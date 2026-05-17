function notifyNetworks()
hl.dispatch(hl.dsp.exec_cmd('dunstify \z
 -h string:x-dunst-stack-tag:networks "networks" \z
 "$(nmcli connection show | awk \'/wifi/ {print $1,$3,$4}\' | column -t)"'))
end
