vim.opt_local.makeprg = "javac %"

vim.api.nvim_buf_set_keymap(0, 'n', '<localleader><leader>r', ':!/usr/lib/jvm/java-17-jdk/bin/java -cp %:p:h %:t:r<cr>', { noremap = true })

local root_markers = {'gradlew', '.git', 'mvnw'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv("HOME")
local data_dir= home .. "/.local/share/jdtls-workspaces/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local jdtls = require('jdtls')
local on_attach = require("lsp.primary.on_attach")

-- See mfussenegger/dotfiles for more inspiration
-- vim/.config/nvim/ftplugin/java.lua

-- Java LS extensions
local bundles = {
  -- home .. '/.local/src/programming-stuff/language-servers/lsp4jakarta/jakarta.jdt/org.eclipse.lsp4jakarta.jdt.core/target/org.eclipse.lsp4jakarta.jdt.core-0.2.2-SNAPSHOT.jar',
  -- vim.fn.glob(home .. '/.local/src/dev/vscode-pde/extension/server/*.jar'),
}

-- local jar = vim.fn.glob(home .. '/.local/src/repos/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_*.jar', true)
-- local configuration = home .. '/.local/src/repos/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux'

local config = {
  cmd = {
    -- '/usr/lib/jvm/java-22-openjdk/bin/java',
    -- '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    -- '-Dosgi.bundles.defaultStartLevel=4',
    -- '-Declipse.product=org.eclipse.jdt.ls.core.product',
    -- '-Dlog.protocol=true',
    -- '-Dlog.level=ALL',
    -- '-Xmx1g',
    -- '--add-modules=ALL-SYSTEM',
    -- '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    -- '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    -- '-jar', jar,
    -- '-configuration', configuration,
    -- '-data', workspace_folder,

    '/usr/bin/jdtls',
    '-data', data_dir,
  },
  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-22",
            path = "/usr/lib/jvm/java-22-openjdk/",
          },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk/",
          },
        },
      },

      eclipse = {
        downloadSources = true,
      },

      inlayHints = {
        parameterNames = {
          enabled = "all",
        },
      },

      project = {
        referencedLibraries = {
          -- home .. '/.local/src/apache-tomcat-7.0.109/lib/servlet-api.jar',
        },
      },
    },
  },
  init_options = {
    bundles = bundles,
  },
  on_attach = on_attach,
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
