do
local function run(msg, matches)
local data = load_data(_config.moderation.data)
if not is_channel_msg(msg) then
	return
else
if data[tostring(msg.to.id)] then
	local settings = data[tostring(msg.to.id)]['settings']
	if #matches == 2 then
		
		if matches[1] == 'newlink' and is_momod(msg)then
			local function callback_link (extra , success, result)
			local receiver = get_receiver(msg)
				if success == 0 then
					send_large_msg(receiver, '*Error: Failed to retrieve link* \nReason: Not creator.\n\nIf you have the link, please use /setlink to set it')
					data[tostring(msg.to.id)]['settings']['set_link'] = nil
					save_data(_config.moderation.data, data)
				else
					send_large_msg(receiver, "Created a new link")
					data[tostring(msg.to.id)]['settings']['set_link'] = result
					save_data(_config.moderation.data, data)
				end
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] attempted to create a new SuperGroup link")
			export_channel_link(receiver, callback_link, false)
		end

		if matches[1] == 'setlink' and is_owner(msg) then
			data[tostring(msg.to.id)]['settings']['set_link'] = 'waiting'
			save_data(_config.moderation.data, data)
			return 'Please send the new group link now'
		end

		if msg.text then
			if msg.text:match("^(https://telegram.me/joinchat/%S+)$") and data[tostring(msg.to.id)]['settings']['set_link'] == 'waiting' and is_owner(msg) then
				data[tostring(msg.to.id)]['settings']['set_link'] = msg.text
				save_data(_config.moderation.data, data)
				return "New link set"
			end
		end

		if matches[1] == 'link' then
			if not is_momod(msg) then
				return
			end
			local group_link = data[tostring(msg.to.id)]['settings']['set_link']
			if not group_link then
				return "Create a link using /newlink first!\n\nOr if I am not creator use /setlink to set your link"
			end
			savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
			return "Group link:\n"..group_link
                end
	end
end
end
end
 
return {
  description = "Link Manager System",
  usage = {
	"/link : مشاهده لينک",
	"/newlink : ساخت لينک جديد",
    },
	},
  patterns = {
  "^[!/#]([Nn]ewlink)$",
  "^[!/#]([Ll]ink)$",
  "^([Nn]ewlink)$",
  "^([Ll]ink)$",
  },
  run = run,
  moderated = true
}
end
