Letter = 5 -- how many letter to find

-- Dont Sell It Back!!
-- Or AL HAX Kill You

-- Don't Touch!!

Rchar = "abcdefghijklmnopqrstuvwxyz"

RcharTable = {}
for Chara in Rchar:gmatch(".") do
    table.insert(RcharTable, Chara)
end

function randomLetter()
    Rchara = ""
    for i = 1, Letter do
       Rchara = Rchara..RcharTable[math.random(1, #RcharTable)]
    end
    return Rchara:upper()
end

LogToConsole("`2Succes `0Generate "..Letter.." Letter World!!")
local worldJoin = randomLetter()
LogToConsole("`0Try to join world... `2"..worldJoin)
SendPacket(3, [[action|join_request
name|]]..worldJoin..[[

invitedWorld|0]])