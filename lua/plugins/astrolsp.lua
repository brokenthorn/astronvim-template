-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    file_operations = {
      timeout = 10000, -- default timeout in ms for completing LSP operations
      operations = { -- enable all of the file operations
        willCreate = true,
        didCreate = true,
        willRename = true,
        didRename = true,
        willDelete = true,
        didDelete = true,
      },
    },
    -- Configuration table of features provided by AstroLSP
    features = {
      signature_help = true, -- enable automatic signature help popup globally on startup
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        -- allow_filetypes = { -- enable format on save for specified filetypes only
        --   -- "go",
        -- },
        -- ignore_filetypes = { -- disable format on save for specified filetypes
        --   -- "python",
        -- },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
        "vtsls",
      },
      -- timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    -- servers = {
    --   -- "pyright"
    -- },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      -- See schema here: https://github.com/yioneko/vtsls/blob/main/packages/service/configuration.schema.json
      vtsls = {
        settings = {
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            enableMoveToFileCodeAction = true,
            inlayHints = {
              parameterNames = { enabled = "all" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
          javascript = {
            updateImportsOnFileMove = { enabled = "always" },
            enableMoveToFileCodeAction = true,
            inlayHints = {
              parameterNames = { enabled = "all" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            typescript = {
              preferGoToSourceDefinition = true,
              preferences = { useAliasesForRenames = false },
            },
            javascript = {
              preferGoToSourceDefinition = true,
              preferences = { useAliasesForRenames = false },
            },
          },
        },
      },
    },
    -- customize how language servers are attached
    -- handlers = {
    --   -- a function without a key is simply the default handler, functions
    --   -- take two parameters, the server name and the configured options table
    --   -- for that server
    --   -- function(server, opts) require("lspconfig")[server].setup(opts) end
    --
    --   -- the key is the server that is being setup with `lspconfig`
    --   -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
    --   -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    -- },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      organize_imports_biome = {
        cond = function(client) return client.name == "biome" end,
        {
          event = { "BufWritePost" }, -- has to be post, otherwise doesn't work
          callback = function()
            local clients = vim.lsp.get_clients { bufnr = 0 }

            for _, client in pairs(clients) do
              if client.name == "biome" then
                if client.server_capabilities.codeActionProvider then
                  local actions_supported = client.server_capabilities.codeActionProvider
                  if actions_supported and actions_supported.codeActionKinds then
                    local can_organize_imports = false
                    for _, action in ipairs(actions_supported.codeActionKinds) do
                      if action == "source.organizeImports.biome" then
                        can_organize_imports = true
                        break
                      end
                    end
                    if can_organize_imports then
                      ---@diagnostic disable-next-line: assign-type-mismatch
                      vim.lsp.buf.code_action { context = { only = { "source.organizeImports.biome" } }, apply = true }
                    end
                  end
                end
              end
            end
          end,
        },
      },
      eslint_fix_on_save = false, -- the typescript community pack otherwise enables eslint fix on save
      -- -- first key is the `augroup` to add the auto commands to (:h augroup)
      -- lsp_codelens_refresh = {
      --   -- Optional condition to create/delete auto command group
      --   -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
      --   -- condition will be resolved for each client on each execution and if it ever fails for all clients,
      --   -- the auto commands will be deleted for that buffer
      --   cond = "textDocument/codeLens",
      --   -- cond = function(client, bufnr) return client.name == "lua_ls" end,
      --   -- list of auto commands to set
      --   {
      --     -- events to trigger
      --     event = { "InsertLeave", "BufEnter" },
      --     -- the rest of the autocmd options (:h nvim_create_autocmd)
      --     desc = "Refresh codelens (buffer)",
      --     callback = function(args)
      --       if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
      --     end,
      --   },
      -- },
      -- eslint_fix_on_save = false,
    },
    -- mappings to be set up on attaching of a language server
    -- mappings = {
    --   n = {
    --     -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
    --     gD = {
    --       function() vim.lsp.buf.declaration() end,
    --       desc = "Declaration of current symbol",
    --       cond = "textDocument/declaration",
    --     },
    --     ["<Leader>uY"] = {
    --       function() require("astrolsp.toggles").buffer_semantic_tokens() end,
    --       desc = "Toggle LSP semantic highlight (buffer)",
    --       cond = function(client)
    --         return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
    --       end,
    --     },
    --   },
    -- },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    -- on_attach = function(client, bufnr)
    --   -- this would disable semanticTokensProvider for all clients
    --   -- client.server_capabilities.semanticTokensProvider = nil
    -- end,
  },
}
