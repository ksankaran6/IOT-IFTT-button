gpio.mode(3, gpio.OUTPUT)
gpio.write(3, gpio.HIGH)
print("Starting SmartButton")
cnt =0
wifi.setmode(wifi.STATION) 
wifi.sta.config("YOUR_STATION","PASSWORD")  
wifi.sta.connect() 
tmr.alarm(1, 2000, 1, function()
if wifi.sta.getip()== nil then
    cnt = cnt + 1
    print("(" .. cnt .. ") Waiting for IP...")
    if cnt == 10 then
        tmr.stop(1)
        dofile("setwifi.lua")
    end
else
    tmr.stop(1)
    dofile("ifttt.lua")
end
end)
