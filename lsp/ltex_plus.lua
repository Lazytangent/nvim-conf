return {
  settings = {
    ltex = {
      language = "en-US",
      dictionary = {
        ["en-US"] = {
          -- Use Neovim's existing spell list
          ":~/.config/nvim/spell/en.utf-8.add",
        },
      },

      -- default is:
      -- checkFreqency = "edit",
      checkFrequency = "save",
    },
  },
}
