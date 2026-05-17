function notifyTime()
  local beats = string.format("@%03.1f", ((os.time()+3600)%86400)/86.4)
  local dateAndTimeString = os.date("%a, %Y-%m-%d %X")

  hl.dispatch(hl.dsp.exec_cmd('dunstify -h string:x-dunst-stack-tag:time \z
  -i preferences-system-time-symbolic \z
  "Time" "' .. beats .. '<br/>' .. dateAndTimeString .. '"'))
end
