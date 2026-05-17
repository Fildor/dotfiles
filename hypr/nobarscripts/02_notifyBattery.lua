function notifyBattery ()

local fh = io.popen("acpi -b")
local acpi_str = fh:read("*a")
fh:close()

local cols = {}
for word in acpi_str:gmatch("%S+") do
  table.insert(cols, word)
end

local level = string.sub(cols[4], 1, -2)
local level_num = tonumber(level)

if level_num == nil then
  level = string.sub(level, 1, -2)
  level_num = tonumber(level)
end

local level_sym = "full"
if level_num <= 5 then
  level_sym = "action"
elseif level_num <= 10 then
  level_sym = "caution"
elseif level_num <= 20 then
  level_sym = "empty"
elseif level_num <= 40 then
  level_sym = "low"
elseif level_num <= 80 then
  level_sym = "good"
end

local status = cols[3] -- Column 3 of the battery string
local symbol_var = ""
if status == "Charging," then
  symbol_var = "-charging"
elseif status == "Full," then
  symbol_var = "-charged"
end

-- dunstify -h string:x-dunst-stack-tag:battery \
--  -i battery-${level_sym}${symbol_var}-symbolic \
--  -h int:value:${level_num} \
--  "Battery" "$acpi_str"

local cmd = 'dunstify -h string:x-dunst-stack-tag:battery \z
-i battery-' .. level_sym .. symbol_var .. '-symbolic \z
-h int:value:' .. level_num .. '\z
"Battery" "' .. acpi_str .. '"'

hl.dispatch(hl.dsp.exec_cmd(cmd))

end
