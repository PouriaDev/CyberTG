local function getindex(t,id) 
for i,v in pairs(t) do 
if v == id then 
return i 
end 
end 
return nil 
end 
 
function reload_plugins( ) 
  plugins = {} 
  load_plugins() 
end 
   function run(msg, matches) 
    if tonumber (msg.from.id) == 142141024 then 
       if matches[1]:lower() == "setsudo" then 
          table.insert(_config.sudo_users, tonumber(matches[2])) 
      print(matches[2]..' Added To Sudo Users') 
     save_config() 
     reload_plugins(true) 
      return matches[2]..' Added To Sudo Users' 
   elseif matches[1]:lower() == "remsudo" then 
      local k = tonumber(matches[2]) 
          table.remove(_config.sudo_users, getindex( _config.sudo_users, k)) 
      print(matches[2]..' Removed From Sudo Users') 
     save_config() 
     reload_plugins(true) 
      return matches[2]..' Removed From Sudo Users' 
      end 
   end 
end 
return { 
patterns = { 
"^[!/#]([Ss]etsudo) (%d+)$", 
"^[!/#]([Rr]emsudo) (%d+)$",
"^([Ss]etsudo) (%d+)$", 
"^([Rr]emsudo) (%d+)$"
}, 
run = run 
}
