return {
  "stevearc/conform.nvim",
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      cs = { "csharpier" },
    },
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_format = "fallback",
    -- },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    formatters = {
      csharpier = {
        -- Add custom args if needed
        -- append_args = { "--some-option" },
      },
    },
  },
}
