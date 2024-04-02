vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.makeprg = "javac %"

vim.api.nvim_buf_set_keymap(0, 'n', '<localleader><leader>r', ':!/usr/lib/jvm/java-22-jdk/bin/java -cp %:p:h %:t:r<cr>', { noremap = true })

local jdtls = require('jdtls')
local root_markers = {'gradlew', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv("HOME")
local workspace_folder = home .. "/.local/share/eclipse-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local on_attach = require("lsp.primary.on_attach")

-- See mfussenegger/dotfiles for more inspiration
-- vim/.config/nvim/ftplugin/java.lua
-- vim.fn.setenv('JAVA_HOME', '/usr/lib/jvm/java-17-openjdk/')
vim.fn.setenv('JAVA_HOME', '/usr/lib/jvm/java-22-jdk/')

local bundles = {
  home .. '/.local/src/programming-stuff/language-servers/lsp4jakarta/jakarta.jdt/org.eclipse.lsp4jakarta.jdt.core/target/org.eclipse.lsp4jakarta.jdt.core-0.2.2-SNAPSHOT.jar',
}

-- for _, bundle in ipairs(vim.split(vim.fn.glob('/usr/lib/eclipse/plugins/*.jar'), '\n')) do
--   table.insert(bundles, bundle)
-- end

-- for _, bundle in ipairs(vim.split(vim.fn.glob(home .. '/.local/src/apache-tomcat-7.0.109/lib/*.jar'), '\n')) do
--   table.insert(bundles, bundle)
-- end

local config = {
  cmd = {
    -- '/usr/lib/jvm/java-22-jdk/bin/java',
    -- '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    -- '-Dosgi.bundles.defaultStartLevel=4',
    -- '-Declipse.product=org.eclipse.jdt.ls.core.product',
    -- '-Dlog.protocol=true',
    -- '-Dlog.level=ALL',
    -- '-Xmx1g',
    -- '--add-modules=ALL-SYSTEM',
    -- '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    -- '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    -- '-jar', vim.fn.glob('/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),

    '/usr/bin/jdtls',
    '--jvm-arg=-Dlog.level=ALL',
    '--jvm-arg=-Dlog.protocol=true',
    '--jvm-arg=-Xmx1g',

    '-configuration', '/usr/share/java/jdtls/config_linux',
    '-data', workspace_folder,
  },
  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
  settings = {
    java = {
      -- inlayHints = {
      --   parameterNames = {
      --     enabled = "all",
      --   },
      -- },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-22",
            path = "/usr/lib/jvm/java-22-jdk/",
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
      -- project = {
      --   referencedLibraries = {
          -- home .. '/.local/src/apache-tomcat-7.0.109/lib/servlet-api.jar',
      --   },
      -- },
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
