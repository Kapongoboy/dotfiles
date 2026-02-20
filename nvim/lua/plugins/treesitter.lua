return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function(_, opts)
    local ok, treesitter = pcall(require, "nvim-treesitter")
    if not ok then
      vim.schedule(function()
        vim.notify("nvim-treesitter not found. Run :Lazy sync", vim.log.levels.ERROR)
      end)
      return
    end
    treesitter.setup(opts)
  end,
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "rust",
      "python",
      "typescript",
      "javascript",
      "zig",
      "cmake",
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
}
