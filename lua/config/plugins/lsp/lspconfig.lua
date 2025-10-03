return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local protocol = require("vim.lsp.protocol")

		local on_attach = function(client, bufnr)
			-- format on save
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("Format", { clear = true }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
      -- Mappings 
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'sig', vim.lsp.buf.signature_help, opts) 

		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require("lspconfig")
    local util = require('lspconfig.util')

    lspconfig.gopls.setup({
        on_attach = on_attach,
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        capabilities = capabilities,
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
    
    lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig.cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    require("mason").setup()
    mason_lspconfig.setup()
  end
}


