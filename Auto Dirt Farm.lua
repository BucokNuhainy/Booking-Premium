breaklmao = true;

function break_tile(x, y)
id = CheckTile(x, y)
if id ~= 0 then
hit_tile(x, y)
sleep(200)
id = CheckTile(x, y)
sleep(200)
end
end

function CheckCaveBackground()
for _, tile in pairs(GetTile()) do
if tile.fg ~= 8 or tile.fg ~= 3760 then
if tile.bg == 14 then
if CheckTile(tile.x, tile.y - 2).fg == 0 then
findpath(tile.x, tile.y - 2)
sleep(300)
break_tile(tile.x, tile.y)
return true
else if CheckTile(tile.x, tile.y - 2).fg == 0 then
findPath(tile.x, tile.y - 2)
sleep(900)
break_tile(tile.x, tile.y)
return true
end
end
end
end
end
return false
end


function hit_tile(x, y)
pkt = {}
pkt.type = 3
pkt.value = 18
pkt.px = x
pkt.py = y
pkt.posX = GetLocal().posX
pkt.posY = GetLocal().posY
SendPacketRaw(false,pkt)
end
function main()
while breaklmao do
breaking = true
while breaking do
breaking = CheckCaveBackground()
end
end
end
main()