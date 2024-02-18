------Auto DF By ZeroWant------------
------Dirt Farm_Bot By ZeroWant---------
------Don't Your Salle This Sc Free---
SendPacket(2, "action|input\n|text|`2Subscribe `0ZeroWant")
function hbreak(x, y)
pkt = {}
pkt.type = 3
pkt.value = 18
pkt.px = x
pkt.py = y
pkt.x = GetLocal().pos.x
pkt.y = GetLocal().pos.y
SendPacketRaw(false,pkt)
Sleep(150)
findingdirt()
end
SendPacket(2, "action|input\n|text|`2Subscribe `0ZeroWant")
SendPacket(2, "action|input\n|text|`2Thanks `0ZeroWant")
function findingdirt() do
for _, tile in pairs(GetTiles()) do
if(tile.y %2 == 1) or tile.x == 0 or tile.x == 1 or tile.x ==99 or tile.x == 98 then
if(tile.fg == 2) or (tile.bg == 14 and tile.fg == 0) or (tile.fg == 10) or (tile.fg == 4) then
                      FindPath(tile.x, tile.y-2)
                      hbreak(tile.x, tile.y)
                     break
           else
                  end
               end
           end
       end
   end

findingdirt()