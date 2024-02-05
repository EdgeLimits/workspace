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

    vim.keymap.set("n", "<leader>A", function() harpoon:list():append() end, { desc = "Harpoon add file" })
    vim.keymap.set("n", "<leader>a", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon toogle quick menu" })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon to file 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon to file 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon to file 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon to file 4" })
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon to file 5" })
  end,
}
