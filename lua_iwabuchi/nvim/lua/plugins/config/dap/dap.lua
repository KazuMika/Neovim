#!/usr/bin/env lua
--
-- FileName:     init
-- Author:       8ucchiman
-- Email:        8ucchiman@gmail.com
-- CreatedDate:  2023-07-18 13:53:17
-- LastModified: 2023-01-23 14:18:33 +0900
-- Reference:    https://stackoverflow.com/questions/73358168/where-can-i-check-my-neovim-lua-runtimepath
--               https://alpha2phi.medium.com/neovim-for-beginners-debugging-using-dap-44626a767f57
-- Description:  ---
--


-- vim.api.nvim_command('set runtimepath^=.')

local M = {}

local function configure()
    local dap_install = require("dap-install")

    dap_install.setup({
    	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    })

    local dap_breakpoint = {
        error = {
            text = "🟥",
            texthl = "LspDiagnosticsSignError",
            linehl = "",
            numhl = "",
        },
        rejected = {
            text = "",
            texthl = "LspDiagnosticsSignHint",
            linehl = "",
            numhl = "",
        },
        stopped = {
            text = "⭐️",
            texthl = "LspDiagnosticsSignInformation",
            linehl = "DiagnosticUnderlineInfo",
            numhl = "LspDiagnosticsSignInformation",
        },
    }

    vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
    vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
    vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
    require("nvim-dap-virtual-text").setup {
        commented = true,
    }

    local dap, dapui = require("dap"), require("dapui")
    dapui.setup {} -- use default
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end


local function configure_debuggers()
    require("plugins.config.dap.lua").setup()
    require("plugins.config.dap.python").setup()
    -- require("plugins.config.dap.rust").setup()
    -- require("plugins.config.dap.go").setup()
end

function M.setup()
    configure() -- Configuration
    -- configure_exts() -- Extensions
    configure_debuggers() -- Debugger
    require("plugins.config.dap.keymaps").setup() -- Keymaps
end

configure_debuggers()

return M
