local function run(msg,matches)
local cap = matches[2]
local function tophoto(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = './cap/'..msg.from.id..'.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
send_photo2(receiver, file, cap, rmtmp_cb, cb_extra)

  redis:del("photo:cap")
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
    end
  end

  
  
    local receiver = get_receiver(msg)
    local group = msg.to.id
    if msg.reply_id then
       if msg.to.type == 'photo' and redis:get("photo:cap") then
        if redis:set("photo:cap", "waiting") then
        end
       end
    
      if matches[1]:lower() == "cap" then
     redis:get("photo:cap")
        load_document(msg.reply_id, tophoto, msg)
    end
    end
  end

  
  
return {
  patterns = {
 "^[#!/]([Cc]ap) (.*)$",
 "^([Cc]ap) (.*)$",
 "%[(photo)%]",
 "%[(document)%]",
  },
  run = run,
  }

