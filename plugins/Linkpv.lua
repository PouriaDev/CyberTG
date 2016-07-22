do

function run(msg, matches)
       if not is_momod(msg) then
        return "Only For Moderators!"
       end
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then 
        return "اول باید لینک جدید ایجاد کنید"
       end
         local text = "لینک گروه:\n"..group_link
          send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "لینک در چت خصوصی ارسال شد"
end

return {
  patterns = {
    "^[/#!]([Ll]inkpv)$",
    "^([Ll]inkpv)$"
  },
  run = run
}

end


