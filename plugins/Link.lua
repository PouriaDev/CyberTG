do
local function run(msg, matches)
local data = load_data(_config.moderation.data)
if not is_channel_msg(msg) then
	return
else
if data[tostring(msg.to.id)] then
	local settings = data[tostring(msg.to.id)]['settings']
	if #matches == 2 then
		
		if matches[1] == 'newlink' and is_owner(msg) then
			local function link_callback (extra , success, result)
				local receiver = extra.receiver
				if success == 0 then
					return "*Error: Failed to retrieve link* \nReason: Not creator.\n\nIf you have the link, please use /setlink to set it"
				end
				data[tostring(msg.to.id)]['settings']['set_link'] = result
				save_data(_config.moderation.data, data)
				local group_link = data[tostring(msg.to.id)]['settings']['set_link']
				send_large_msg(receiver, "Created New Link!")
			end
			local receiver = 'channel#'..msg.to.id
			return export_channel_link(receiver, link_callback, {receiver = receiver})

		elseif matches[1] == 'link' and is_owner(msg) then
			local group_link = data[tostring(msg.to.id)]['settings']['set_link']
			if not group_link then
				return "Create a link using /newlink first!\n\nOr if I am not creator use /setlink to set your link"
			end
			send_large_msg('user#'..msg.from.id, "Group link:\n______________________________\n"..group_link)
		end
		
	else
		
		if matches[1] == 'newlink' and is_momod(msg) then
			local function link_callback (extra , success, result)
				local receiver = extra.receiver
				if success == 0 then
					return "Error!"
				end
				data[tostring(msg.to.id)]['settings']['set_link'] = result
				save_data(_config.moderation.data, data)
				local group_link = data[tostring(msg.to.id)]['settings']['set_link']
				send_large_msg(receiver, "New Group Link:\n______________________________\n"..group_link)
			end
			local receiver = 'channel#'..msg.to.id
			return export_channel_link(receiver, link_callback, {receiver = receiver})
		
		elseif matches[1] == 'clink' and is_momod(msg) then
			local function link_callback (extra , success, result)
				local receiver = extra.receiver
				if success == 0 then
					return "Error in closing link!"
				end
				data[tostring(msg.to.id)]['settings']['set_link'] = result
				save_data(_config.moderation.data, data)
				send_large_msg(receiver, "Link closed")
			end
			local receiver = 'channel#'..msg.to.id
			return export_channel_link(receiver, link_callback, {receiver = receiver})

		elseif matches[1] == 'link' and is_momod(msg) then
			local group_link = data[tostring(msg.to.id)]['settings']['set_link']
			if not group_link then
				return "First Make  Newlink"
			end
			return "Group link:\n______________________________\n"..group_link
		end
	end
end
end
end
 
return {
  description = "Link Manager System",
  usage = {
	"/link : مشاهده لينک",
	"/link pv : ارسال لينک در خصوصي",
	"/newlink : ساخت لينک جديد",
	"/newlink pv : لينک جديد در خصوصي",
	"/clink : بستن لينک",
    },
	},
  patterns = {
  "^[!/#]([Nn]ewlink)$",
  "^[!/#]([Ll]ink)$",
	"^[!/#]([Nn]ewlink) ([Pp]v)$",
  "^[!/#]([Ll]ink) ([Pp]v)$",
	"^[!/#]([Cc]link)$",
	"^([Nn]ewlink)$",
  "^([Ll]ink)$",
	"^([Nn]ewlink) ([Pp]v)$",
  "^([Ll]ink) ([Pp]v)$",
	"^([Cc]link)$",
  },
  run = run,
  moderated = true
}
end
