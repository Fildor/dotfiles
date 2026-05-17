local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Meine persönlichen Bindings
-- TODO: scripte umstellen auf lua
require ("notifyTime")
hl.bind(mainMod .. " + T", notifyTime)
require ("notifyNetworks")
-- hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("~/.local/bin/notifyNetworks.sh"))
hl.bind(mainMod .. " + N", notifyNetworks)
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.local/bin/notifyBattery.sh"))
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd(fileManager))

-- Example Bindings ...
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))--terminal))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("wofi --show drun"))--menu))
-- hl.bind(mainMod .. " + R", hl.notification.create({text="TEST", duration=2000}))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + comma", hl.dsp.layout("consume"))
hl.bind(mainMod .. " + period", hl.dsp.layout("expel"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- Move focus with arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for Volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", function ()
    hl.dispatch(hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+'))
    hl.dispatch(hl.dsp.exec_cmd('~/.local/bin/notifyVolume.sh'))
  end,
  { locked = true, repeating = true }
)
hl.bind("XF86AudioLowerVolume", function()
    hl.dispatch(hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
    hl.dispatch(hl.dsp.exec_cmd("~/.local/bin/notifyVolume.sh"))
  end,
  { locked = true, repeating = true }
)
hl.bind("XF86AudioMute", function()
  hl.dispatch(hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
  hl.dispatch(hl.dsp.exec_cmd("~/.local/bin/notifyVolume.sh"))
  end,
  { locked = true, repeating = true }
)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext" ,hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause",hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay" ,hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev" ,hl.dsp.exec_cmd("playerctl previous"), { locked = true })

