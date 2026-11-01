local autocmd = vim.api.nvim_create_autocmd

-- man item under cursor in C and shell files
autocmd("FileType", {
  pattern = { "c", "sh", "bash" },
  callback = function()
    vim.keymap.set("n", "<leader>K", function()
      vim.cmd("Man " .. vim.fn.expand("<cword>"))
    end, { desc = "Open manpage", noremap = true })
    require("which-key").add({
      { "<leader>K", icon = " " },
    })
  end,
})

-- attempt to start treesitter when a buffer loads
autocmd({ "BufReadPost", "BufNewFile" }, {
  desc = "Attempt to start treesitter when a buffer loads",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
