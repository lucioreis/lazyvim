return {

  {
    "mfussenegger/nvim-dap",
    -- event = "BufWinEnter",
    keys = {
      { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" } },
      { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", { desc = "Step Back" } },
      { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" } },
      { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", { desc = "Get Session" } },
      { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step Into" } },
      { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step Over" } },
      { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step Out" } },
      { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", { desc = "Pause" } },
      { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Toggle Repl" } },
      { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", { desc = "Start" } },
      { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", { desc = "Quit" } },
      { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", { desc = "Toggle UI" } },
    },
    opts = {
      breakpoint = {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      },
      breakpoint_rejected = {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      },
      stopped = {
        text = "",
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      },
      log = {
        level = "info",
      },
      ui = {},
    },
    config = function(_, opts)
      local dap = require("dap")
      vim.fn.sign_define("DapBreakpoint", opts.breakpoint)
      vim.fn.sign_define("DapBreakpointRejected", opts.breakpoint_rejected)
      vim.fn.sign_define("DapStopped", opts.stopped)
      dap.set_log_level(opts.log.level)

      dap.adapters.chrome = {
        -- executable: launch the remote debug adapter - server: connect to an already running debug adapter
        type = "executable",
        -- command to launch the debug adapter - used only on executable type
        command = "node",
        args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
      }

      dap.adapters.firefox = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/bin/vscode-firefox-debug/dist/adapter.bundle.js" },
      }

      dap.configurations.typescriptreact = {
        {
          name = "Debug with Firefox",
          type = "firefox",
          request = "launch",
          reAttach = true,
          url = "http://localhost:3000/",
          webRoot = "${workspaceFolder}",
          taskArgs = { "-p dev-edition-default" },
          firefoxExecutable = "/usr/bin/firefox-developer-edition",
        },
      }
    end,
  },

  -- Debugger user interface
  {
    "rcarriga/nvim-dap-ui",
    opts = {
      auto_open = true,
      notify = {
        threshold = vim.log.levels.INFO,
      },
      config = {
        icons = { expanded = "", collapsed = "", circular = "" },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        -- Use this to override mappings for specific elements
        element_mappings = {},
        expand_lines = true,
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.33 },
              { id = "breakpoints", size = 0.17 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 0.33,
            position = "right",
          },
          {
            elements = {
              { id = "repl", size = 0.45 },
              { id = "console", size = 0.55 },
            },
            size = 0.27,
            position = "bottom",
          },
        },
        controls = {
          enabled = true,
          -- Display controls in this element
          element = "repl",
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
          },
        },
        floating = {
          max_height = 0.9,
          max_width = 0.5, -- Floats will be treated as percentage of your screen.
          border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
          max_value_lines = 100, -- Can be integer or nil.
        },
      },
    },
    config = function(_, opts)
      --require("dap").setup_ui()
      local status_ok, dap = pcall(require, "dap")
      if not status_ok then
        return
      end
      local dapui = require("dapui")
      dapui.setup(opts.config)

      if opts.auto_open then
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        -- dap.listeners.before.event_terminated["dapui_config"] = function()
        --   dapui.close()
        -- end
        -- dap.listeners.before.event_exited["dapui_config"] = function()
        --   dapui.close()
        -- end
      end

      -- until rcarriga/nvim-dap-ui#164 is fixed
      local function notify_handler(msg, level, opts)
        if level >= opts.notify.threshold then
          return vim.notify(msg, level, opts)
        end

        opts = vim.tbl_extend("keep", opts or {}, {
          title = "dap-ui",
          icon = "",
          on_open = function(win)
            vim.api.nvim_buf_set_option(vim.api.nvim_win_get_buf(win), "filetype", "markdown")
          end,
        })
      end

      local dapui_ok, _ = xpcall(function()
        require("dapui.util").notify = notify_handler
      end, debug.traceback)
      if not dapui_ok then
        vim.notify("Unable to override dap-ui logging level")
      end
    end,
  },
}
