local helpers = require "OAuth.helpers"
local base = 'https://screenshotmachine.com/'
local url = base .. 'processor.php'
local function get_webshot_url()
	local response_body = {}
	local request_constructor = {
		url = url,
		method = "GET",
		sink = ltn12.sink.table(response_body),
		headers = {
			referer = base,
			dnt = "1",
			origin = base,
			["User-Agent"] = "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36"
		},
		redirect = false
	}
	local arguments = {
		urlparam = "http://umbrella.shayan-soft.ir/date/cal.htm",
		size = "FULL"
	}
	request_constructor.url = url .. "?" .. helpers.url_encode_arguments(arguments)
	local ok, response_code, response_headers, response_status_line = https.request(request_constructor)
	if not ok or response_code ~= 200 then
		return nil
	end
	local response = table.concat(response_body)
	return string.match(response, "href='(.-)'")
end

local function run(msg, matches)
	if is_momod(msg) then
		local find = get_webshot_url()
		if find then
			local imgurl = base .. find
			local receiver = get_receiver(msg)
			local dlfile = download_to_file(imgurl)
			local file = 'file/cal.webp'
			os.rename(dlfile, file)
			local cb_extra = {file_path=file}
			send_document(receiver, file, rmtmp_cb, cb_extra)
		end
	else
		return 'فقط مدیران میتوانند از این قابلیت استفاده کنند'
	end
end

return {
	description = "Hijri Calendar Table",
	usage = {
		"/calendar : تقویم",
	},
	patterns = {
		"^[!/#]([Cc]alendar)$",
		"^([Cc]alendar)$",
	},
	run = run
}
