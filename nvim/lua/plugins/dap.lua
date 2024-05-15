return {
{
        -- Debug Adapter Protocol plugin
        'mfussenegger/nvim-dap',

        config = function()
            local utils = require('dap.utils')

            local rpc = require('dap.rpc')

            local function send_payload(client, payload)
                local msg = rpc.msg_with_content_length(vim.json.encode(payload))
                client.write(msg)
            end

            function RunHandshake(self, request_payload)
                local signResult = io.popen('node C:\\debugadapter\\vsdbgsignature\\sign.js ' .. request_payload.arguments.value)
                if signResult == nil then
                    utils.notify('error while signing handshake', vim.log.levels.ERROR)
                    return
                end
                local signature = signResult:read("*a")
                signature = string.gsub(signature, '\n', '')
                local response = {
                    type = "response",
                    seq = 0,
                    command = "handshake",
                    request_seq = request_payload.seq,
                    success = true,
                    body = {
                        signature = signature
                    }
                }
                send_payload(self.client, response)
            end

            local dap = require 'dap'
            dap.set_log_level("trace")
            Exectuable = ''

            dap.adapters.lldb = {
                type = 'executable',
                command = 'lldb-dap',
                name = 'lldb',
            }

            dap.adapters.cppvsdbg = {
                id='cppvsdbg',
                type='executable',
                args = { "--interpreter=vscode" },
                command = "C:/Users/David.Connett.ICEPOR/scoop/persist/vscode/data/extensions/ms-vscode.cpptools-1.19.9-win32-x64/debugAdapters/vsdbg/bin/vsdbg.exe",
                options = {
                    externalTerminal = true,
                    -- logging = {
                    --   moduleLoad = false,
                    --   trace = true
                    -- }
                },
                runInTerminal =  true,
                reverse_request_handlers = {
                    handshake = RunHandshake,

                },
            }

            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = "C:/Users/David.Connett.ICEPOR/scoop/persist/vscode/data/extensions/ms-vscode.cpptools-1.20.5-win32-x64/debugAdapters/bin/OpenDebugAD7.exe",
                args = {
                    --'--server',
                },
                options = {
                    detached = false,
                },
            }

            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = 'cppvsdbg',
                    request = 'launch',
                    cwd = '${workspaceFolder}',
                    clientID = 'vscode',
                    clientName = 'Visual Studio Code',
                    externalTerminal = true,
                    columnsStartAt1 = true,
                    linesStartAt1 = true,
                    locale = "en",
                    pathFormat = "path",
                    externalConsole = true,

                    program = function()
                        print("Launching exe " .. Executable)
                        return (Executable and Executable ~= '') and Executable or dap.ABORT
                    end,
                },
            }


            dap.configurations.c = dap.configurations.cpp
            dap.configurations.h = dap.configurations.cpp

            vim.keymap.set('n', '<C-S-F5>', dap.restart, {})
            vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, {})
            vim.keymap.set('n', '<F10>', dap.step_over, {})
            vim.keymap.set('n', '<F11>', dap.step_into, {})
            vim.keymap.set('n', '<S-F11>', dap.step_out, {})

            vim.keymap.set('n', '<S-F5>', function()
                dap.disconnect { terminateDebugee = true }
            end, {})

            vim.keymap.set('n', '<F5>', function()
                if dap.session() then
                    dap.continue()
                else
                    local builtin = require 'telescope.builtin'
                    local themes = require 'telescope.themes'
                    local teleutils = require 'telescope.utils'

                    builtin.find_files(themes.get_dropdown {
                        previewer = false,
                        find_command = { 'rg', '--files', '--glob=*.exe' },
                        default_text = teleutils.transform_path({}, Executable),
                        prompt_title = 'Select executable',
                        attach_mappings = function(_, map)
                            local result = true
                            map({ 'i', 'n' }, '<return>', function(prompt_buffer)
                                local selection = require('telescope.actions.state').get_selected_entry()
                                Executable = selection.path
                                require('telescope.actions').close(prompt_buffer)
                                dap.continue()
                                result = false
                            end)
                            return result
                        end,
                    })
                end
            end, {})

            -- Change default breakpoint icon
            vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
            vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
        end,
    },
    {
        -- UI integration for DAP
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = function()
            local dap = require 'dap'
            local dapui = require 'dapui'
            dapui.setup {
                layouts = {
                    {
                        elements = {
                            {
                                id = 'scopes',
                                size = 0.25,
                            },
                            {
                                id = 'breakpoints',
                                size = 0.25,
                            },
                            {
                                id = 'stacks',
                                size = 0.25,
                            },
                            {
                                id = 'watches',
                                size = 0.25,
                            },
                        },
                        position = 'right',
                        size = 40,
                    },
                    {
                        elements = {
                            {
                                id = 'repl',
                                size = 0.5,
                            },
                            {
                                id = 'console',
                                size = 0.5,
                            },
                        },
                        position = 'bottom',
                        size = 10,
                    },
                },
            }

            dap.listeners.before.attach.dapui_config = function()
                print("Before attach");
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                print("Before launch");
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                print("Before event terminate");
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                print("Before event exited");
                dapui.close()
            end
        end,
    }
}
