return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "javascriptreact",
            "typescriptreact",
            "templ", -- 👈 this maps .templ to Emmet as HTML
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
          },
        },
      },
    },
    {
      "seblj/roslyn.nvim",
      ft = { "cs", "razor" },
    },
  },
}

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         emmet_ls = {
--           filetypes = {
--             "html",
--             "css",
--             "javascriptreact",
--             "typescriptreact",
--             "templ",
--             "cshtml",
--           },
--           init_options = {
--             html = {
--               options = {
--                 ["bem.enabled"] = true,
--               },
--             },
--           },
--         },
--       },
--       setup = {
--         csharp_ls = function()
--           return true -- Skip csharp_ls setup
--         end,
--       },
--     },
--   },
--
--   {
--     "seblj/roslyn.nvim",
--     ft = { "cs", "razor" },
--     opts = {
--       settings = {
--         ["csharp|inlay_hints"] = {
--           csharp_enable_inlay_hints_for_implicit_object_creation = false,
--           csharp_enable_inlay_hints_for_implicit_variable_types = false,
--           csharp_enable_inlay_hints_for_lambda_parameter_types = false,
--           csharp_enable_inlay_hints_for_types = false,
--           dotnet_enable_inlay_hints_for_parameters = false,
--           dotnet_enable_inlay_hints_for_literal_parameters = false,
--           dotnet_enable_inlay_hints_for_indexer_parameters = false,
--           dotnet_enable_inlay_hints_for_object_creation_parameters = false,
--           dotnet_enable_inlay_hints_for_other_parameters = false,
--           dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = false,
--           dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = false,
--           dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = false,
--         },
--       },
--     },
--     config = function(_, opts)
--       require("roslyn").setup(opts)
--
--       vim.api.nvim_create_autocmd("LspAttach", {
--         callback = function(args)
--           local client = vim.lsp.get_client_by_id(args.data.client_id)
--           if client and client.name == "roslyn" then
--             vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
--           end
--         end,
--       })
--     end,
--   },
-- }
