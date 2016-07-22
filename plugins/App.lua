do
local function run(msg, matches)
	if matches[1]:lower() == 'app' then
		local url = http.request('http://api.magic-team.ir/plazza/search.php?key='..URL.escape(matches[2]))
		local jdat = json:decode(url)
		items = jdat
		local text = ''
		local msgss = 0
		for item in pairs(items) do
		msgss = msgss + 1
		text = text..msgss..' 📦 عنوان: '..items[msgss].title..' 🔰   Package Id: '..items[msgss].pack..'\n\n'
    local hash = 'app:'..msg.from.id..msgss
	local hash1 = 'img:'..msg.from.id..msgss
  redis:set(hash, items[msgss].pack)
  redis:set(hash1, items[msgss].icon)
		
		end
		return text..'برای دریافت اطلاعات برنامه از دستور زیر استفاده کنید\n/appinfo number\n(example): /appinfo 1'
	end
	if matches[1]:lower() == 'appinfo' then
	local hashz = 'app:'..msg.from.id..matches[2]
	local hash1z = 'img:'..msg.from.id..matches[2]
	pp = redis:get(hashz)
	pp1 = redis:get(hash1z)
	local url = http.request('http://api.magic-team.ir/plazza/info.php?key='..pp)
		local jdat = json:decode(url)
		if jdat.needroot == "false" then 
		root = 'خیر'
		else
		root = 'بله'
		end
		ple = math.floor(jdat.dlsize / 1024)
		text = 'عنوان: \n'..jdat.title..'\nنام پکیج :\n'..pp..'\nدرباره: \n'..jdat.info..'\nورژن: \n'..jdat.version..'\nنیاز به روت : '..root..'\nسایز : '..ple..'\n تصویر : '..pp1..'\nلینک دانلود : '..jdat.dlurl
		return text
	end
end

return {
   patterns = {
"^[/!#]([Aa]pp) (.*)$",
"^[/!#]([Aa]ppinfo) (.*)$",
"^([Aa]pp) (.*)$",
"^([Aa]ppinfo) (.*)$",
   },
   run = run
}
end
