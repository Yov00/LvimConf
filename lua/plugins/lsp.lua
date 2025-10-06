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
--             "templ", -- 👈 this maps .templ to Emmet as HTML
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
--     },
--   },
-- }
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "Hoffs/omnisharp-extended-lsp.nvim",
        lazy = true,
      },
    },
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "javascriptreact",
            "typescriptreact",
            "templ",
            "cshtml",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
          },
        },

        -- omnisharp = {
        --   cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        --   enable_editorconfig_support = true,
        --   enable_import_completion = true,
        --   organize_imports_on_format = true,
        --   enable_msbuild_load_projects_on_demand = true,
        --   enable_roslyn_analyzers = true,
        --   handlers = {
        --     ["textDocument/definition"] = function(...)
        --       return require("omnisharp_extended").handler(...)
        --     end,
        --   },
        --   filetypes = { "cs", "vb", "razor" },
        -- },
      },
    },
  },
}
