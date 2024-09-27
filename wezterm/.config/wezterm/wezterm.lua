--- My Wezterm config file

local wezterm = require("wezterm")
local keymaps = require("keymaps")

-- local fish_path = "/usr/bin/fish"

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings
-- config.default_prog = { fish_path, "-l" }

config.color_scheme = 'Equilibrium Gray Dark (base16)'
config.font = wezterm.font_with_fallback({
  { family = "Hack Nerd Font",       scale = 1, weight = "Medium", },
})
config.window_background_opacity = 0.92
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}

-- Keys
config.leader = keymaps.leader
config.keys = keymaps.keys
config.key_tables = keymaps.key_tables

-- Tab bar
-- I don't like the look of "fancy" tab bar

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = true
config.show_tab_index_in_tab_bar = false
config.show_tabs_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = false
config.tab_and_split_indices_are_zero_based = false
config.tab_bar_at_bottom = false
config.tab_max_width = 25
config.use_fancy_tab_bar = false

-- config.use_fancy_tab_bar = false
-- config.status_update_interval = 1000
-- config.tab_bar_at_bottom = false
-- wezterm.on("update-status", function(window, pane)
--   -- Workspace name
--   local stat = window:active_workspace()
--   local stat_color = "#f7768e"
--   -- It's a little silly to have workspace name all the time
--   -- Utilize this to display LDR or current key table name
--   if window:active_key_table() then
--     stat = window:active_key_table()
--     stat_color = "#7dcfff"
--   end
--   if window:leader_is_active() then
--     stat = "LDR"
--     stat_color = "#bb9af7"
--   end
--
--   local basename = function(s)
--     -- Nothing a little regex can't fix
--     return string.gsub(s, "(.*[/\\])(.*)", "%2")
--   end
--
--   -- Current working directory
--   local cwd = pane:get_current_working_dir()
--   if cwd then
--     if type(cwd) == "userdata" then
--       -- Wezterm introduced the URL object in 20240127-113634-bbcac864
--       cwd = basename(cwd.file_path)
--     else
--       -- 20230712-072601-f4abf8fd or earlier version
--       cwd = basename(cwd)
--     end
--   else
--     cwd = ""
--   end
--
--   -- Current command
--   local cmd = pane:get_foreground_process_name()
--   -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
--   cmd = cmd and basename(cmd) or ""
--
--   -- Time
--   local time = wezterm.strftime("%H:%M")
--
--   -- Left status (left of the tab line)
--   window:set_left_status(wezterm.format({
--     { Foreground = { Color = stat_color } },
--     { Text = "  " },
--     { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
--     { Text = " |" },
--   }))
--
--   -- Right status
--   window:set_right_status(wezterm.format({
--     -- Wezterm has a built-in nerd fonts
--     -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
--     { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
--     { Text = " | " },
--     { Foreground = { Color = "#e0af68" } },
--     { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
--     "ResetAttributes",
--     { Text = " | " },
--     { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
--     { Text = "  " },
--   }))
-- end)

--[[ Appearance setting for when I need to take pretty screenshots
config.enable_tab_bar = false
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0cell',

}
--]]

return config