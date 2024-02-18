
local itemInfo = {}

function getItemObject()
    for _,item in pairs(GetWorldObject()) do
        table.insert(itemInfo,"\nadd_label_with_icon_button|small|`7Name : "..GetItemByID(item.id).name.." `7Amount : [`5"..item.amount.."``]|left|"..item.id.."|"..item.oid.."|\n")
    end
end

getItemObject()

function take(id)
    x = 0
    y = 0
    SendPacket(2,"action|dialog_return\ndialog_name|extractor\ntilex|"..x.."|\ntiley|"..y.."|\nstartIndex|0|\nextractorID|6140|\nbuttonClicked|extractOnceObj_"..tostring(id))
end

function pkt(type,packet)
    if packet:find("/scans") then
        getItemObject()
        var = {}
        var[0] = "OnDialogRequest"
        var[1] = string.format("add_label_with_icon|big|Auto Magnet Bye : GOJO SATORU |left|1|\nadd_spacer|small|\nadd_smalltext|`7Click The Item for taking `4Note U Must Have Minimal 1 Extractosnap|\n"..table.concat(itemInfo).."\nadd_quick_exit|||\nend_dialog|scanbilek|Thanks!||")
        SendVariant(var,-1,100)
    end
    
    if packet:find("dialog_name|scanbilek\nbuttonClicked|(%d+)") then
        x=0
        y=0
        po = packet:match("dialog_name|scanbilek\nbuttonClicked|(%d+)")
        SendPacket(2,"action|dialog_return\ndialog_name|extractor\ntilex|"..x.."|\ntiley|"..y.."|\nstartIndex|0|\nextractorID|6140|\nbuttonClicked|extractOnceObj_"..po)
    end
end
AddHook("OnTextPacket","Hookied",pkt)