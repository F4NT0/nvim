-----------------------------------------------------
-- CONFIGURING JAVA JDTLS LSP PROJECT INTO THE NEOVIM
------------------------------------------------------
-- STEPS BEFORE:
--  1. Configure Mason into the project in lua/plugins/mason.lua
--  2. Open Mason using the command :Mason
--  3. Search for Java projects with Ctrl + F and insert Java
--  4. Install from Mason the following packages:
--        -> google-java-format
--        -> java-debug-adapter
--        -> java-test
--  5. Then this configuration is going to work
--
local function get_jdtls()
  -- Get the Mason Registry to gain access to downloaded binaries
  local mason_registry = require("mason-registry")
  -- Find the JDTLS package in the Mason Registry
  local jdtls = mason_registry.get_package("jdtls")
  -- Find the full path to the directory where Mason has downloaded the JDTLS binaries
  local jdtls_path = jdtls:get_install_path()
  -- Obtain the path to the jar which runs the language server
  local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
  -- My configuration is using Windows (win) but linux (linux) and mac (mac) is available
  local SYSTEM = "win"
  -- Obtain the path to configuration files for your specific operation system
  local config = jdtls_path .. "/config_" .. SYSTEM
  -- Obtain the path to the lombok jar
  local lombok = jdtls_path .. "/lombok.jar"

  return launcher, config, lombok
end

local function get_bundles()
  -- Get the Mason Registry
  local mason_registry = require("mason-registry")

  ---------------------------------------
  -- CONFIGURATION OF JAVA-DEBUG-ADAPTER
  ---------------------------------------

  -- Find the Java Debug Adapter package in the Mason Registry
  local java_debug = mason_registry.get_packages("java-debug-adapter")
  -- Find the Full Path to the directory where Mason has downloaded the JDA binaries
  local java_debug_path = java_debug:get_install_path()
  -- Configure the bundle path
  local bundles = vim.fn.glob(java_debug_path .. "/extensions/server/com.microsoft.java.debug.plugin-*.jar", 1)

  ------------------------------
  -- CONFIGURATION OF JAVA-TEST
  ------------------------------

  -- Find the Java Test Packages in the Mason Registry
  local java_test = mason_registry.get_package("java-test")
  -- Obtain the full path to the Java Test Binaries
  local java_test_path = java_test:get_install_path()
  -- Add all of the Jars for the running tests in debug mode
  vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", 1), "\n"))

  return bundles
end

----------------------------------
-- CONFIGURATION OF MY WORKSPACE
----------------------------------

local function get_workspace()
  -- Get the home directory of your system
  local home = os.getenv("HOME")
  -- Declare the directory where you would like to store projects
  local workspace_path = home .. "/source/repos/"
  -- Determine the project name
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), "p:h:t")
  -- Create the workspace directory
  local workspace_dir = workspace_path .. project_name

  return workspace_dir
end

--------------------------------------------
-- CONFIGURING THE KEYMAPS TO USE WITH JAVA
--------------------------------------------

local function java_keymaps()
  ---------------------------
  -- COMMANDS CONFIGURATIONS
  ---------------------------
  ---
  -- Configuration to use the command JdtCompile as a VIM command
  vim.cmd(
    "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
  )
  -- Configuration to use the command JdtUpdateConfig as a VIM command after change the Maven file
  vim.cmd("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
  -- Configuration to use JdtByteCode as a VIM command
  vim.cmd("command! -buffer JdtByteCode lua require('jdtls').javap()")
  -- Configuration to use JdtShell as a VIM command to open a shell to run java
  vim.cmd("command! -buffer JdtShell lua require('jdtls').jshell()")

  --------------------------
  -- KEYBOARD CONFIGURATION
  --------------------------
  ---
  -- Shift + J + o  = organize imports
  vim.keymaps.set(
    "n",
    "Jo",
    "<Cmd> lua require('jdtls').organize_imports()<CR>",
    { desc = "[J]ava [O]rganize Imports" }
  )
  -- Shift + J + v = extract the code under the cursor to a variable
  vim.keymaps.set(
    "n",
    "Jv",
    "<Cmd> lua require('jdtls').extract_variable()<CR>",
    { desc = "[J]ava Extract [V]ariables" }
  )
  -- Shift + J + Shift + C = Extract the code under the cursor to a constant
  vim.keymaps.set(
    "n",
    "JC",
    "<Cmd> lua require('jdtls').extract_constant()<CR>",
    { desc = "[J]ava Extract [C]onstant" }
  )
  -- Shift + J + t = Run the test method currently under the cursor
  vim.keymaps.set(
    "n",
    "Jt",
    "<Cmd> lua require('jdtls').test_nearest_method()<CR>",
    { desc = "[J]ava [T]est Method" }
  )
  -- Shift + J + Shift + T = Run all tests under the current class
  vim.keymaps.set("n", "JT", "<Cmd> lua require('jdtls').test_class()<CR>", { desc = "[J]ava [T]est Class" })
  -- Shift + J + u = Update the project configuration
  vim.keymaps.set("n", "Ju", "<Cmd> JdtUpdateConfig<CR>", { desc = "[J]ava [U]pdate Config" })
end

--------------------
-- SETUP THE JDTLS
--------------------

local function setup_jdtls()
  -- Get access to the jdtls plugin
  local jdtls = require("jdtls")

  -- Get the paths to the jdtls jar
  local launcher, os_config, lombok = get_jdtls()

  -- Get the path your specific workspace
  local workspace_dir = get_workspace()

  -- Get the bundle list
  local bundles = get_bundles()

  -- Determine the root directory by looking this files
  local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })

  -- Tell JDTLS language features is capable of use
  local capabilities = {
    workspace = {
      configuration = true,
    },
    textDocument = {
      completion = {
        snippetSupport = false,
      },
    },
  }

  -- Configuring the CMP (to connect into the file cmp.lua file
  local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- Configure all capabilities from the LSP
  for k, v in pairs(lsp_capabilities) do
    capabilities[k] = v
  end

  -- Get the default extended client capabilities of the JDTLS language server
  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  -- Modify the resolveAdditionalTextEditsSupport to true
  extendedClientCapabilities.resolveAdditionalTextEditSupport = true

  -- Set the command that starts the JDTLS language server
  local cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent" .. lombok,
    "-jar",
    launcher,
    "-configuration",
    os_config,
    "-data",
    workspace_dir,
  }

  local settings = {
    java = {
      format = {
        enabled = true,
        -- Use Google Style guide for code formatting
        settings = {
          url = vim.fn.stdpath("config") .. "/lang_servers/intellij-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
      -- Enable downloading archives from eclipse automatically
      eclipse = {
        downloadSource = true,
      },
      -- Enable downloading archives from maven automatically
      maven = {
        downloadSources = true,
      },
      -- Enable method signature help
      signatureHelp = {
        enabled = true,
      },
      -- Use fernflower decompiler when using the javap command to decompile byte codes to java code
      contentProvider = {
        preferred = "fernflower",
      },
      -- Setup automatical package import organization on file save
      saveActions = {
        organizeImports = true,
      },
      -- Customize completion options
      completion = {
        -- When using an unimported static method, how should the LSP rank possible import
        favoriteStaticMember = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        -- Try not to sugest imports from these packages
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
        -- Set the order in which the language server should organize imports
        importOrder = {
          "java",
          "jakarta",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        -- How many classes from a specific package should be imported before automatic imports
        organizeImports = {
          starThreshold = 9999,
          staticThreshold = 9999,
        },
      },
      -- How should different pieces of code be generated
      codeGeneration = {
        -- When generating toString use a json format
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        -- When generating hashCode and equals methods use Java 7 object method
        hashCodeEquals = {
          useJava7Objects = true,
        },
        -- When generating code use code blocks
        useBlocks = true,
      },
      -- If changes to the project will require the developer to update the projects configuration advise the developer before accepting the change
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      -- enable code lens in the LSP
      referencesCodeLens = {
        enabled = true,
      },
      -- Enable inlay hints for parameter names
      inlayHints = {
        parameterNames = {
          enabled = "all",
        },
      },
    },
  }

  -- Create a table called init_options to pass the bundles with debug
  local init_options = {
    bundles = bundles,
    extendedClientCapabilities = extendedClientCapabilities,
  }

  -- Function that will be ran once the language server is attached
  local on_attach = function(_, bufnr)
    -- Map Java keymaps
    java_keymaps()

    -- Setup the java debug
    require("jdtls.dap").setup_dap()

    -- Find the main method
    -- It may fail randomly, close Neovim and start again
    require("jdtls.dap").setup_dap_main_class_configs()

    -- Enable jdtls
    require("jdtls_setup").add_commands()

    -- Refresh codelens
    vim.lsp.codelens.refresh()

    -- Setup to automatically runs every time java file is saved
    vim.api.nvim_create_autocmd("BuffWritePost", {
      pattern = { "*.java" },
      callback = function()
        local _, _ = pcall(vim.lsp.codelens.refresh)
      end,
    })
  end

  -- Create the configuration table for the start or attach functions
  local config = {
    cmd = cmd,
    root_dir = root_dir,
    settings = settings,
    capabilities = capabilities, -- Configure the CMP options for Java (see cmp.lua)
    init_options = init_options,
    on_attach = on_attach,
  }

  -- Start the JDTLS server
  require("jdtls").start_or_attach(config)
end

return {
  setup_jdtls = setup_jdtls,
}
