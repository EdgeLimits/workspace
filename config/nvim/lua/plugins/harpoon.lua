-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2?tab=readme-ov-file
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
      }
    })

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add file" })
    vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon toogle quick menu" })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon to file 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon to file 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon to file 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon to file 4" })
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon to file 5" })
    -- clear all marks
    vim.keymap.set("n", "<leader>hx", function()
        harpoon:list():clear()
    end)
    -- navigate list
    vim.keymap.set("n", "<leader>m", function() harpoon:list():prev() end, { desc = "Harpoon to the prev" })
    vim.keymap.set("n", "<leader>,", function() harpoon:list():next() end, { desc = "Harpoon to the next" })
  end,
}

