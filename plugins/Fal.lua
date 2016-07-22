local database = 'http://vip.opload.ir/vipdl/95/1/amirhmz/'
local function run(msg)
	local res = http.request(database.."fal.db")
	local fal = res:split(",") 
	return fal[math.random(#fal)]
end
return {
	description = "500 Fal Hafez",
	usage = "/fal : send random fal",
	patterns = {
		"^[/#!]([Ff]al)",
		"^([Ff]al)$"
		},
	run = run
}


