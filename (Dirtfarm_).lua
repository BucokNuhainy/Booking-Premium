urutan=1
world={"ifjeeko"}

LogToConsole("`9Auto Dirt Farm Started")
SleepMS(500)

function punch(x,y)
pkt={}
pkt.type=3
pkt.value=18
pkt.tilex=x
pkt.tiley=y
pkt.x=GetLocal().pos.x
pkt.y=GetLocal().pos.y
SleepMS(300)
SendPacketRaw(false,pkt)
end

function join(name)
SleepS(1)
SendPacket(2, "action|join_request\nname|" .. name .. "")
        SendPacket(3, "action|join_request\nname|" .. name .. "\ninvitedWorld|0")
        SleepMS(4000)
end

function side()
for x=0,1 do
for y=0,53 do
local k=CheckTile(x,y)
if k.bg==14 then
FindPath(k.pos.x,k.pos.y-1,120)
SleepMS(550)
while (CheckTile(x,y).bg==14) do
punch(x,y)
end
end
end
end
for x=98,99 do
for y=0,53 do
local k=CheckTile(x,y)
if k.bg==14 then
FindPath(k.pos.x,k.pos.y-1,120)
SleepMS(950)
while (CheckTile(x,y).bg==14) do
punch(x,y)
end
end
end
end
end

function main()
for y= 1,53,2 do
for x =0,99 do
bg=CheckTile(x,y)
if bg.bg==14  then
FindPath(bg.pos.x,bg.pos.y-2,140)

while CheckTile(bg.pos.x,bg.pos.y).bg==14 do
punch(bg.pos.x,bg.pos.y)

end

end
end
end
end
n=urutan
while true do
join(world[n])
side()
main()
n=n+1
if n>#world then n=1 end
end