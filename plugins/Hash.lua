local function run(msg, matches)

local tulereshte = string.len(matches[1])

if tonumber(tulereshte) == 16 then
return [[Hash Algoritm:
MySQL

Hash Num: 16
EX.: 7cd2b5942be28759]]

elseif tonumber(tulereshte) == 24 then
return [[Hash Algoritm:
Haval128 (Base64)
MD2 (Base64)
MD4 (Base64)
MD5 (Base64)
Tiger128 (Base64)

Hash Num: 24
EX.: 8ljB6IQUqypSerVB/8W4vw==]]

elseif tonumber(tulereshte) == 28 then
return [[Hash Algoritm:
Haval160 (Base64)
SHA-1 (Base64)
Tiger160 (Base64)

Hash Num: 28
EX.: 8ljB6IQUqypSerVB/8W4v5Nfe5U=]]

elseif tonumber(tulereshte) == 32 then
return [[Hash Algoritm:
.md5(md5($pass))
.md5(md5($pass).$salt)
.md5(md5($salt).md5($pass))
Domain Cached Credentials
Haval128 (HMAC)
Haval128_3
Haval128_4
Haval128_5
Haval192 (Base64)
LM
MD2 (HMAC)
MD2
MD4 (HMAC)
MD4
MD5 (HMAC)
MD5
NTLM
RipeMD128 (HMAC)
RipeMD128
SNEFRU128 (HMAC)
SNEFRU128
Tiger128 (HMAC)
Tiger128
Tiger192 (Base64)

Hash Num: 32
EX.: 8ljB6IQUqypSerVB/8W4v5Nfe5UcEylR]]

elseif tonumber(tulereshte) == 34 then
return [[Hash Algoritm:
MD5 (Unix)

Hash Num: 34
EX.: $1$P2lE.rGp$SYCpUzBZjWRGKyMe/MbU00]]

elseif tonumber(tulereshte) == 37 then
return [[Hash Algoritm:
MD5 (APR)

Hash Num: 37
EX.: $apr1$ZSc84vgF$YiKqBzqnUskAPKeDWlN8/0]]

elseif tonumber(tulereshte) == 40 then
return [[Hash Algoritm:
Haval160 (HMAC)
Haval160
Haval160_3
Haval160_4
Haval160_5
Haval224 (Base64)
MySQL v5.x
RipeMD160 (HMAC)
RipeMD160
SHA-0
SHA-1 (HMAC)
SHA-1
SHA224 (Base64)
Tiger160 (HMAC)
Tiger160

Hash Num: 40
EX.: f258c1e88414ab2a527ab541ffc5b8bf935f7b95]]

elseif tonumber(tulereshte) == 44 then
return [[Hash Algoritm:
Haval256 (Base64)
SHA256 (Base64)
SNEFRU256 (Base64)

Hash Num: 44
EX.: fQMyBWR6KvPcgzn2yyVkPDPrxiLTKXnEthKwLEkDAxs=]]

elseif tonumber(tulereshte) == 48 then
return [[Hash Algoritm:
Haval192 (HMAC)
Haval192
Haval192_4
Haval195_5
Tiger192 (HMAC)
Tiger192
Tiger2

Hash Num: 48
EX.: afd7ce60de4799388c88898d708b649d228fc06accecbbb6]]

elseif tonumber(tulereshte) == 56 then
return [[Hash Algoritm:
Haval224 (HMAC)
Haval224
Haval244_3
Havan244_4
RipeMD320 (Base64)
SHA224 (HMAC)
SHA224

Hash Num: 56
EX.: 23097d223405d8228642a477bda255b32aadbce4bda0b3f7e3 6c9da7]]

elseif tonumber(tulereshte) == 64 then
return [[Hash Algoritm:
Haval256 (HMAC)
Haval256
Haval256_3
Haval256_4
Haval256_5
RipeMD256 (HMAC)
SHA256 (HMAC)
SHA256
SHA384 (Base64)
SNEFRU256 (HMAC)
SNEFRU256

Hash Num: 64
EX.: 7d033205647a2af3dc8339f6cb25643c33ebc622d32979c4b6 12b02c4903031b]]

elseif tonumber(tulereshte) == 80 then
return [[Hash Algoritm:
RipeMD320 (HMAC)
RipeMD320

Hash Num: 80
EX.: de4c01b3054f8930a79d09ae738e92301e5a17085beffdc1b8 d116713e74f82fa942d64cdbc4682d?]]

elseif tonumber(tulereshte) == 88 then
return [[Hash Algoritm:
SHA512 (Base64)

Hash Num: 88
EX.: 3a81oZNherrMQXNJriBBMRLm+k6JqX6iCp7u5ktV05ohkpkqJ0/BqDa6PCOj/uu9RU1EI2Q86A4qmslPpUyknw==]]

elseif tonumber(tulereshte) == 96 then
return [[Hash Algoritm:
SHA384 (HMAC)
SHA384

Hash Num: 96
EX.: cb00753f45a35e8bb5a03d699ac65007272c32ab0eded1631a 8b605a43ff5bed8086072ba1e7cc23?58baeca134c825a7]]

elseif tonumber(tulereshte) == 128 then
return [[Hash Algoritm:
SHA512 (HMAC)
SHA512

Hash Num: 128
EX.: ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a 9eeee64b55d39a2192992a274fc1a8 ?36ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49 f]]

else
return [[ERROR!
رشته ي وارد شده هش نيست
يا
اين هش با الگوريتم خصوصي است
يا
هش همراه salt است]]

end

end

return {
	description = "HASH Algoritm Finder",
	usage = "/hash (code) : الگوریتم یاب هش",
	patterns = {
	"^[!/#]([Hh]ash) (.*)$",
	"^([Hh]ash) (.*)$",
}, 
	run = run 
}
