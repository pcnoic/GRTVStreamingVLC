--[[
    Greek TV Streaming with VLC 
    Authors: Christos Alexiou (http://christosalexiou.tk)
]]--

streamingList = {
    {name = "STAR TV", url = "https://www.star.gr/3dbe1d56-8537-4164-ab90-ae9db16946e3"}, 
    {name = "SKAI TV", url = "https://www.youtube.com/embed/P0OJ0mEtxKQ?controls=0&modestbranding=1&rel=0&showinfo=0&loop=0&fs=0&hl=el&enablejsapi=1&origin=http%3A%2F%2Fwww.skaitv.gr&widgetid=1"}, 
    {name = "Open Beyond", url = "https://www.tvopen.gr/7698aab8-a291-4888-9d79-af00dc6abf02"}, 
    {name = "ANT1 TV", url = "https://www.antenna.gr/6cc052eb-a813-4310-a20d-7ffb897c3fe1"}, 
    {name = "ALPHA TV", url = "https://alphalive-i.akamaihd.net/hls/live/682300/live/master.m3u8"}, 
    {name = "ERT 1", url = "https://youtu.be/SbZQY3UYw_Y"},
    {name = "ERT 2" url = "https://youtu.be/AOVVjaLbGEk"}, 
    {name = "ERT 3" url = "https://youtu.be/x3IIDO6C-kc"}, 
    {name = "ERT SPORT HD", url = "https://youtu.be/MP8Htwny-T4"}, 
    {name = "ERT WORLD", url = "https://youtu.be/MRDeOhioF3g"}, 
}


function descript() 
    return {title = "Greek TV Streaming" ; 
            version = "0.0.1" ; 
            author = "Christos Alexiou" ; 
            myurl = "http://christosalexiou.tk"; 
            shortdesc = "Stream live TV from the GreekTV channels"
            capabalilties = {}
        }
end

function activ() 
    dialog = vlc.dialog("Greek TV Streaming") 
    list = dialog:add_list(1,3,4,1) 
    play_button = dialog:add_button("Play", click_play, 1, 4, 4, 1)
    -- adding the channels 
    for idx, details in ipairs(streamingList) do 
        list:add_value(details.name, idx) 
    end 

    dialog:show() 
end 

function click_play() 
    selecting = list:get_selection() 
    if(not selecting) then return 1 end 
    local selection = nil 
    for idx, selectedItem in pairs(selecting) do 
        selection = idx 
        break 
    end 
    details = streamingList[selection] 

    -- start stream 
    vlc.playlist.clear() 
    vlc.playlist.add() 
    vlc.playlist.play() 

end

function deact() 
end 

function close()
    vlc.deact() 
end 










