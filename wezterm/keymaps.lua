local wezterm = require("wezterm")

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'META' or 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

return {
  mouse_bindings = {
    {
      event = { Down = { streak = 3, button = 'Right' } },
      action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
    },
  },

  keys = {
    -- Clears only the scrollback and leaves the viewport intwezterm.action.
    -- You won't see a difference in what is on screen, you just won't
    -- be able to scroll back until you've output more stuff on screen.
    -- This is the default behavior.
    {
      key = 'K',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ClearScrollback 'ScrollbackOnly',
    },
    -- Clears the scrollback and viewport leaving the prompt line the new first line.
    {
      key = 'K',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
    },
    -- Clears the scrollback and viewport, and then sends CTRL-L to ask the
    -- shell to redraw its prompt
    {
      key = 'K',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.Multiple {
        wezterm.action.ClearScrollback 'ScrollbackAndViewport',
        wezterm.action.SendKey { key = 'L', mods = 'CTRL' },
      },
    },    -- Pane creation
    { key = "H", mods = "SHIFT|ALT", action = wezterm.action.SplitHorizontal({domain = "CurrentPaneDomain" }) },
    { key = "V", mods = "SHIFT|ALT", action = wezterm.action.SplitVertical({domain = "CurrentPaneDomain" }) },

    -- move between split panes
    split_nav('move', 'h'),
    split_nav('move', 'j'),
    split_nav('move', 'k'),
    split_nav('move', 'l'),

    -- resize panes
    split_nav('resize', 'h'),
    split_nav('resize', 'j'),
    split_nav('resize', 'k'),
    split_nav('resize', 'l'),

    { key = 'w', mods = 'SHIFT|ALT', action = wezterm.action.CloseCurrentPane({confirm = false})},

    -- Spawn a new command window and run it.
    {
      key = 'S',
      mods = 'SHIFT|ALT',
      action = wezterm.action.PromptInputLine({
        description = 'Launch',
        action = wezterm.action_callback(function(window, pane, line)
          local cmd = {"C:/Program Files/PowerShell/7/pwsh.exe", "-NoLogo", "-Command", line}
          if line then
            window:perform_action(
              wezterm.action.SpawnCommandInNewWindow({
                -- args = wezterm.shell_split(cmd),
                args = cmd
              }),
              pane
            )
          end
        end),
      }),
    },

    -- Spawn a new command tab and run it.
    {
      key = 'T',
      mods = 'SHIFT|ALT',
      action = wezterm.action.PromptInputLine({
        description = 'Launch',
        action = wezterm.action_callback(function(window, pane, line)
          local cmd = {"C:/Program Files/PowerShell/7/pwsh.exe", "-NoLogo", "-Command", line}
          if line then
            window:perform_action(
              wezterm.action.SpawnCommandInNewTab({
                -- args = wezterm.shell_split(cmd),
                args = cmd
              }),
              pane
            )
          end
        end),
      }),
    },




  }
}
