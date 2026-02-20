return {
  -- Main LSP Configuration
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { "mason-org/mason.nvim", opts = {} }, -- NOTE: Must be loaded before dependants
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Useful status updates for LSP.
    { "j-hui/fidget.nvim", opts = {} },

    -- Allows extra capabilities provided by blink.cmp
    "saghen/blink.cmp",
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = {
        spacing = 4,
        prefix = "●",
      },
      update_in_insert = true,
      float = {
        source = "always",
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
        map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
        map("<leader>ds", vim.lsp.buf.document_symbol, "[D]ocument [S]ymbols")
        map("<leader>ws", vim.lsp.buf.workspace_symbol, "[W]orkspace [S]ymbols")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("<leader>rr", vim.lsp.buf.references, "[R]eferences")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/documentHighlight") then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        if client and client:supports_method("textDocument/inlayHint") then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "[T]oggle Inlay [H]ints")
        end
      end,
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = {
      clangd = { mason_package = "clangd" },
      pyright = { mason_package = "pyright" },
      rust_analyzer = { mason_package = "rust-analyzer" },
      ts_ls = { mason_package = "typescript-language-server" },
      eslint = { mason_package = "eslint-lsp" },
      gleam = {
        mason = false,
      },

      lua_ls = {
        mason_package = "lua-language-server",
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    }

    local ensure_installed = {}
    for _, server in pairs(servers) do
      if server.mason ~= false and server.mason_package then
        table.insert(ensure_installed, server.mason_package)
      end
    end
    table.insert(ensure_installed, "stylua")
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    local function configure_server(server_name, server)
      local server_opts = vim.deepcopy(server or {})
      server_opts.mason = nil
      server_opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
      vim.lsp.config(server_name, server_opts)
      vim.lsp.enable(server_name)
    end

    for server_name, server in pairs(servers) do
      configure_server(server_name, server)
    end
  end,
}
