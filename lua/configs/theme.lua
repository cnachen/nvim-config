require('catppuccin').setup {
  color_overrides = {
    mocha = {
      text = "#F4CDE9",
      subtext1 = "#DEBAD4",
      subtext0 = "#C8A6BE",
      overlay2 = "#B293A8",
      overlay1 = "#9C7F92",
      overlay0 = "#866C7D",
      surface2 = "#705867",
      surface1 = "#5A4551",
      surface0 = "#44313B",
      base = "#352939",
      mantle = "#211924",
      crust = "#1a1016",
    },
  },
}

vim.cmd.colorscheme 'gruvbox-material'

local mocha = (function()
  local C = require('catppuccin.palettes').get_palette('mocha')
  local M = require('catppuccin.utils.lualine')('mocha')

  M.normal = {
    a = { fg = C.subtext0, bg = C.surface1, gui = "bold" },
    b = { fg = C.text, bg = C.surface0 },
    c = { fg = C.text, bg = C.surface1 },
  }
  M.command = {
    a = { fg = C.surface0, bg = C.peach, gui = "bold" },
  }
  M.insert = {
    a = { fg = C.surface0, bg = C.mauve, gui = "bold" },
  }
  M.visual = {
    a = { fg = C.surface0, bg = C.flamingo, gui = "bold" },
  }
  M.terminal = {
    a = { fg = C.surface0, bg = C.lavender, gui = "bold" },
  }
  M.replace = {
    a = { fg = C.surface0, bg = C.red, gui = "bold" },
  }
  M.inactive = {
    a = { fg = C.subtext0, gui = "bold" },
    b = { fg = C.subtext0 },
    c = { fg = C.subtext0 },
  }
  return M
end)()

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
        -- symbols = {
        --   modified = '[+]',
        --   readonly = '[-]',
        --   newfile = '[New]',
        --   unnamed = '[Empty]',
        -- },
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
