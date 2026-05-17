package main

import (
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

// fileExists is a small wrapper for clarity.
func fileExists(path string) bool {
	_, err := os.Stat(path)
	return err == nil
}

// dirExists returns true if `path` is an existing directory.
func dirExists(path string) bool {
	info, err := os.Stat(path)
	return err == nil && info.IsDir()
}

// defaultDestDir returns %LOCALAPPDATA%\nvim (the Neovim convention on Windows).
func defaultDestDir() string {
	local := os.Getenv("LOCALAPPDATA")
	if local == "" {
		home, _ := os.UserHomeDir()
		local = filepath.Join(home, "AppData", "Local")
	}
	return filepath.Join(local, "nvim")
}

// configSrcDir locates this repository on disk. The installer is expected to
// run from inside the repo's `installer/` directory, but we also accept the
// case where the user copied the binary somewhere else and the repo is the
// parent of the binary.
func configSrcDir() string {
	if cwd, err := os.Getwd(); err == nil {
		// If we're inside .../installer/, the parent is the repo root.
		if filepath.Base(cwd) == "installer" {
			return filepath.Dir(cwd)
		}
		// If we're already at the repo root, use cwd.
		if fileExists(filepath.Join(cwd, "init.lua")) && dirExists(filepath.Join(cwd, "lua")) {
			return cwd
		}
	}
	// Fallback: directory next to the executable.
	if exe, err := os.Executable(); err == nil {
		dir := filepath.Dir(exe)
		if filepath.Base(dir) == "installer" {
			return filepath.Dir(dir)
		}
		if fileExists(filepath.Join(dir, "init.lua")) {
			return dir
		}
	}
	return ""
}

// ── winget install ───────────────────────────────────────────────────────────

// installResult is the outcome of one `winget install` invocation.
type installResult struct {
	label string
	err   error
}

// runWinget installs a single package via `winget install <id>`.
func runWinget(id string) error {
	if id == "" {
		return fmt.Errorf("no winget id")
	}
	cmd := exec.Command("winget", "install", "--id", id,
		"--accept-package-agreements", "--accept-source-agreements",
		"--silent", "--disable-interactivity")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}

// installMissing runs winget for every check that has a winget id and is not
// in the OK state. Stops on the first hard failure.
func installMissing(checks []checkResult) []installResult {
	results := []installResult{}
	for _, c := range checks {
		if c.wingetID == "" || c.status == checkOK {
			continue
		}
		err := runWinget(c.wingetID)
		results = append(results, installResult{label: c.label, err: err})
	}
	return results
}

// ── config deploy ────────────────────────────────────────────────────────────

// deployConfig copies the contents of `srcDir` to `destDir`, optionally
// backing up an existing config first.
func deployConfig(srcDir, destDir string, backup bool) error {
	if srcDir == "" {
		return fmt.Errorf("could not locate source configuration")
	}

	if dirExists(destDir) && backup {
		backupPath := destDir + ".backup"
		_ = os.RemoveAll(backupPath)
		if err := os.Rename(destDir, backupPath); err != nil {
			return fmt.Errorf("could not back up %s: %w", destDir, err)
		}
	}

	if err := os.MkdirAll(destDir, 0o755); err != nil {
		return fmt.Errorf("cannot create %s: %w", destDir, err)
	}

	// Files & directories we do NOT copy into the user config directory.
	skip := map[string]bool{
		".git":       true,
		".gitignore": true,
		"installer":  true,
		// Avoid copying ourselves
		filepath.Base(srcDir + ".exe"): true,
	}

	return filepath.Walk(srcDir, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		rel, err := filepath.Rel(srcDir, path)
		if err != nil {
			return err
		}
		if rel == "." {
			return nil
		}
		// Skip top-level excluded entries.
		topLevel := strings.SplitN(rel, string(os.PathSeparator), 2)[0]
		if skip[topLevel] {
			if info.IsDir() {
				return filepath.SkipDir
			}
			return nil
		}
		dest := filepath.Join(destDir, rel)
		if info.IsDir() {
			return os.MkdirAll(dest, info.Mode())
		}
		return copyFile(path, dest)
	})
}

func copyFile(src, dst string) error {
	in, err := os.Open(src)
	if err != nil {
		return err
	}
	defer in.Close()
	if err := os.MkdirAll(filepath.Dir(dst), 0o755); err != nil {
		return err
	}
	out, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer out.Close()
	if _, err := io.Copy(out, in); err != nil {
		return err
	}
	info, err := os.Stat(src)
	if err == nil {
		_ = os.Chmod(dst, info.Mode())
	}
	return nil
}

// ── plugin sync ──────────────────────────────────────────────────────────────

// runLazySync invokes Neovim headlessly to install/update every plugin
// declared by the configuration. Returns whatever `nvim` printed on stderr.
func runLazySync() error {
	bin, err := exec.LookPath("nvim")
	if err != nil {
		return fmt.Errorf("nvim is not on PATH")
	}
	cmd := exec.Command(bin, "--headless", "+Lazy! sync", "+qa")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}
