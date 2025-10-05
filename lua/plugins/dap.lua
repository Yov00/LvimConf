return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Debug: Continue",
      },
      {
        "<F6>",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug: Test",
      },
      {
        "<F9>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Debug: Toggle Breakpoint",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Debug: Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Debug: Step Into",
      },
      {
        "<F8>",
        function()
          require("dap").step_out()
        end,
        desc = "Debug: Step Out",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "Debug: Open REPL",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Debug: Run Last",
      },
      {
        "<leader>dt",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug: Nearest Test",
      },
    },
    config = function()
      local dap = require("dap")
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"

      local netcoredbg_adapter = {
        type = "executable",
        command = mason_path,
        args = { "--interpreter=vscode" },
      }

      dap.adapters.netcoredbg = netcoredbg_adapter
      dap.adapters.coreclr = netcoredbg_adapter

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            -- Auto-build before debugging
            vim.notify("Building project...", vim.log.levels.INFO)
            local result = vim.fn.system("dotnet build")
            if vim.v.shell_error ~= 0 then
              vim.notify("Build failed!\n" .. result, vim.log.levels.ERROR)
              return nil
            end
            vim.notify("Build successful!", vim.log.levels.INFO)

            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/", "file")
          end,
          env = {
            ASPNETCORE_ENVIRONMENT = "Development",
            ASPNETCORE_URLS = "http://localhost:5000",
          },
          cwd = vim.fn.getcwd(),
        },
      }
      dap.configurations.razor = dap.configurations.cs
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dapui = require("dapui")
      local dap = require("dap")

      dapui.setup()

      -- Open UI automatically
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Issafalcon/neotest-dotnet",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-dotnet"),
        },
      })
    end,
  },
}

-- OLD WORKING but no assets are loaded
-- return {
--   {
--     "mfussenegger/nvim-dap",
--     dependencies = {
--       "rcarriga/nvim-dap-ui",
--       "nvim-neotest/nvim-nio",
--     },
--     keys = {
--       {
--         "<F5>",
--         function()
--           require("dap").continue()
--         end,
--         desc = "Debug: Continue",
--       },
--       {
--         "<F6>",
--         function()
--           require("neotest").run.run({ strategy = "dap" })
--         end,
--         desc = "Debug: Test",
--       },
--       {
--         "<F9>",
--         function()
--           require("dap").toggle_breakpoint()
--         end,
--         desc = "Debug: Toggle Breakpoint",
--       },
--       {
--         "<F10>",
--         function()
--           require("dap").step_over()
--         end,
--         desc = "Debug: Step Over",
--       },
--       {
--         "<F11>",
--         function()
--           require("dap").step_into()
--         end,
--         desc = "Debug: Step Into",
--       },
--       {
--         "<F8>",
--         function()
--           require("dap").step_out()
--         end,
--         desc = "Debug: Step Out",
--       },
--       {
--         "<leader>dr",
--         function()
--           require("dap").repl.open()
--         end,
--         desc = "Debug: Open REPL",
--       },
--       {
--         "<leader>dl",
--         function()
--           require("dap").run_last()
--         end,
--         desc = "Debug: Run Last",
--       },
--       {
--         "<leader>dt",
--         function()
--           require("neotest").run.run({ strategy = "dap" })
--         end,
--         desc = "Debug: Nearest Test",
--       },
--     },
--     config = function()
--       local dap = require("dap")
--       local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
--
--       local netcoredbg_adapter = {
--         type = "executable",
--         command = mason_path,
--         args = { "--interpreter=vscode" },
--       }
--
--       dap.adapters.netcoredbg = netcoredbg_adapter
--       dap.adapters.coreclr = netcoredbg_adapter
--
--       dap.configurations.cs = {
--         {
--           type = "coreclr",
--           name = "launch - netcoredbg",
--           request = "launch",
--           program = function()
--             return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/", "file")
--           end,
--         },
--       }
--     end,
--   },
--   {
--     "rcarriga/nvim-dap-ui",
--     dependencies = {
--       "mfussenegger/nvim-dap",
--       "nvim-neotest/nvim-nio",
--     },
--     config = function()
--       local dapui = require("dapui")
--       local dap = require("dap")
--
--       dapui.setup()
--
--       -- Open UI automatically
--       dap.listeners.after.event_initialized["dapui_config"] = function()
--         dapui.open()
--       end
--       dap.listeners.before.event_terminated["dapui_config"] = function()
--         dapui.close()
--       end
--       dap.listeners.before.event_exited["dapui_config"] = function()
--         dapui.close()
--       end
--     end,
--   },
--   {
--     "nvim-neotest/neotest",
--     dependencies = {
--       "nvim-neotest/nvim-nio",
--       "nvim-lua/plenary.nvim",
--       "antoinemadec/FixCursorHold.nvim",
--       "nvim-treesitter/nvim-treesitter",
--       "Issafalcon/neotest-dotnet",
--     },
--     config = function()
--       require("neotest").setup({
--         adapters = {
--           require("neotest-dotnet"),
--         },
--       })
--     end,
--   },
-- }
