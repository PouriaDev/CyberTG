do

 function run(msg, matches)
 local ch = '134461890'..msg.to.id
 local fuse = 'New Group Request!\n\nId : ' .. msg.from.id .. '\n\nName: ' .. msg.from.print_name ..'\n\nUsername: @' .. msg.from.username ..'\n\nMessage From: '..msg.to.id.. '\n\nThe Pm:\n' .. matches[1]
 local fuses = '!printf user#id' .. msg.from.id


   local text = matches[1]
   local chat = "chat#id"..134461890

  local sends = send_msg(chat, fuse, ok_cb, false)
  return 'درخواست ارسال شد\nسوپر گروه شما ساخته می شود و به شما اطلاع داده می شود'

 end
 end
 return {

  description = "درخواست گروه",

  usage = "",
  patterns = {
  "^(درخواست گروه)$",
  "^([Rr]eqgp)$"

  },
  run = run
 }

