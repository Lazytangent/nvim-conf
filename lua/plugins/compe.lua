require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = false;
    buffer = true;
    tags = false;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    luasnip = true;
    ['nvim-treesitter'] = true;
  };
}

require("nvim-autopairs.completion.cmp").setup {
  map_cr = true,
  map_complete = true,
  auto_select = true,
  insert = false,
  map_char = {
    all = '(',
    tex = '{'
  }
}
