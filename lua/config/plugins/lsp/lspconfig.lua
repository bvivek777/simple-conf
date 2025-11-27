return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local format_group = vim.api.nvim_create_augroup("LspFormat", { clear = false })

    local function on_attach(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = format_group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end

      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "sig", vim.lsp.buf.signature_help, opts)
    end

    local function setup(server, config)
      local server_config = lspconfig[server]
      if not server_config then
        vim.notify(string.format("lspconfig: server '%s' is not available", server), vim.log.levels.WARN)
        return
      end

      server_config.setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
      }, config or {}))
    end

    setup("gopls", {
      settings = {
        gopls = {
          ["ui.inlayhint.hints"] = {
            compositeLiteralFields = true,
            constantValues = true,
            parameterNames = true,
          },
        },
      },
    })

    for _, server in ipairs({ "pyright", "jsonls", "cssls", "html" }) do
      setup(server)
    end
  end,
}
