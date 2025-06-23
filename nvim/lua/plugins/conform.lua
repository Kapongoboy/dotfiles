return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = {"stylua"},
        python = {"isort", "black"},
        javascript = {"prettierd", "prettier"},
        cpp = {"cpplint"},
      },
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({bufnr = args.buf})
        end,
      })
    })
  end
}
