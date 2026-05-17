function notifyVolume()
  
  local fh = io.popen("wpctl get-volume @DEFAULT_AUDIO_SINK@")
  local volume_string = fh:read("*a")
  fh:close()

  local count = 0
  -- local tester = ""
  local cols = {}
  for word in volume_string:gmatch("%S+") do
    table.insert(cols, word)
    -- tester = tester .. '|' .. word
    count = count + 1
  end

  local is_muted = false
  if count > 2 then is_muted = true end
  local volume_percent = cols[2] * 100
  local vol_desc = string.format("%3.0f%%", volume_percent)
  local vol_num = "-h int:value:" .. volume_percent
  
  local vol_sym = "overamplified"
  if is_muted then
    vol_sym = "muted"
    vol_desc = "MUTED"
  elseif volume_percent <= 33 then
    vol_sym = "low"
  elseif volume_percent <= 66 then
    vol_sym = "medium"
  elseif volume_percent <= 100 then
    vol_sym = "high"
  end
  
  local cmd = 'dunstify -h string:x-dunst-stack-tag:volume \z
  -i audio-volume-' .. vol_sym .. '-symbolic \z
  "Volume" "' .. vol_desc .. '" ' .. vol_num
  -- local cmd = 'dunstify -h string:x-dunst-stack-tag:volume \z
  -- "Volume" "' .. tester .. '"'
  hl.dispatch(hl.dsp.exec_cmd(cmd))
end
