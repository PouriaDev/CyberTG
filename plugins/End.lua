
local function run(msg, matches, callback, extra)
if not is_sudo(msg) then
return false
end

local hash = 'endmsg:'
if matches[1] == 'delend' and not matches[2] then 
   redis:hset(hash, 'endmsg', 0)
   return 'End msg is nil'
end

if matches[1] == 'setend' then
redis:hset(hash, 'endmsg', matches[2])
        return "End msg changed :"
end
end
return {
  patterns = {
  "^[!/#](setend) +(.*)$",
  "^[!/#](delend)$",
  "^(setend) +(.*)$",
  "^(delend)$"
  },
  run = run
}

