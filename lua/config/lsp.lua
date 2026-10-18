-- this makes it so code stuff is only shown if an LSP is available
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { buffer = buf, noremap = true, desc = "Definition" })

    vim.keymap.set("n", "<leader>cK", vim.lsp.buf.hover, { buffer = buf, noremap = true, desc = "Hover" })

    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = buf, noremap = true, desc = "Rename" })

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, noremap = true, desc = "Code actions" })

    vim.keymap.set("n", "<leader>cR", vim.lsp.buf.references, { buffer = buf, noremap = true, desc = "References" })

    vim.keymap.set(
      "n",
      "<leader>cD",
      vim.diagnostic.open_float,
      { buffer = buf, noremap = true, desc = "Diagnostics on current line." }
    )

    vim.keymap.set("n", "<leader>cf", function()
      require("conform").format({ async = true })
    end, { buffer = buf, noremap = true, desc = "Format buffer" })

    require("which-key").add({
      { "<leader>c", group = "Code", buffer = buf },
    })
  end,
})

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

if not vim.lsp.is_enabled("clangd") then
  ---@type vim.lsp.Config
  vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_markers = { "compile_commands.json", ".clangd", ".git" },
  })
  vim.lsp.enable("clangd")
end

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})
vim.lsp.enable("lua_ls")
