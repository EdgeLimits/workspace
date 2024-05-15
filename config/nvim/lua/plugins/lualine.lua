return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "SmiteshP/nvim-navic",
  },
  config = function()
    local lualine = require("lualine")
    local lsp_names = function()
      local clients = {}
      for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
        table.insert(clients, client.name)
      end
      local ft = vim.api.nvim_eval("&filetype")
      local linters = require("lint").linters_by_ft[ft]
      for _, linter in ipairs(linters ~= nil and linters or {}) do
        table.insert(clients, linter)
      end
      local filetype = require("conform").formatters_by_ft[ft]
      for _, formatter in ipairs(filetype or {}) do
        if type(formatter) == "table" then
          table.insert(clients, "{" .. table.concat(formatter, ",") .. "}")
        else
          table.insert(clients, formatter)
        end
      end
      return #clients == 0 and "" or " " .. table.concat(clients, ", ")
    end

    -- local navic = require("nvim-navic")
    lualine.setup {
      options = {
        icons_enabled = true,
        theme = "catppuccin-mocha",
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {},
        -- lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'searchcount', 'progress'},
        lualine_z = {'location'},
      },
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {'filename'},
      --   lualine_x = {'location'},
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
      -- tabline = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
      winbar = {
        lualine_c = {},
        lualine_b = {},
        lualine_a = {
          {
            "navic",
            color_corection = nil,
            navic_opts = {
              highlight = true,
              draw_empty = true,
            },
          }
        },
        lualine_x = {},
        lualine_y = { {
          "filename",
          path = 1,
          file_status = false,
        } },
        lualine_z = {{
          "filename",
          path = 0,
          file_status = true,
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]',     -- Text to show for newly created file before first write
          }
        }},
      },
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
