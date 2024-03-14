require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '·',
    section_separators = '',
  },
  sections = {
    lualine_c = {
      'diff',
      'diagnostics',
    },
    lualine_b = {
      {
        'filename',
        file_status = true,
        newfile_status = false,
        path = 0,
        shorting_target = 40,
      },
    },
    lualine_x = {
      {
        function()
          local enc = vim.opt.fileencoding:get()
          return string.upper(enc)
        end,
      },
      {
        function()
          local M = {
            unix = 'LF',
            mac = 'CR',
            dos = 'CRLF',
          }
          local fmt = vim.bo.fileformat
          return M[fmt]
        end,
      },
      {
        'filetype',
        fmt = string.upper,
      },
    },
  },
}
