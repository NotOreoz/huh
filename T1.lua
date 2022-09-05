repeat task.wait() until game:IsLoaded()
print("Game Loaded")
repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name) 
print("Found Player")
repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")
print("Found Player HumanoidRootPart")
repeat task.wait() until game.Workspace:FindFirstChild("CurrentRooms")
print("Found CurrentRoom Folder")
local function notif(ST,TT) game:GetService("StarterGui"):SetCore("SendNotification",{ Title = ST, Text = TT, Icon = "rbxassetid://"}) end
wait(7)
print("Wait 7 Over")
if game.GameId == 2440500124 then 
    notif("Script Started",".")
    print("Started")
    repeat
        fireproximityprompt(game.Workspace.CurrentRooms["0"].StarterElevator.Model.Model.SkipButton.SkipPrompt)
        game:GetService("ReplicatedStorage").Bricks.PreRunShop:FireServer({})
        wait(2)
    until game.Workspace:FindFirstChild("CurrentRooms"):FindFirstChild("0"):FindFirstChild("StarterElevator"):FindFirstChild("DoorHitbox"):FindFirstChild("BillboardGui"):FindFirstChild("Seconds").Text == ""
    if game.Players.LocalPlayer.Character:FindFirstChild("Collision") then 
        game.Players.LocalPlayer.Character.Collision:Destroy()
        print("Destroyed Collision")
    end
    local KeyFound = false
    local RoomNum = 0
    local CurrentRoomNum = 1
    local CurrentRoom = nil
    for _,v in pairs(game:GetService("Workspace").CurrentRooms:GetChildren()) do 
        CurrentRoom = v
        print("Starting First 3 Rooms")
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentRoom.Door.Hidden.CFrame
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, CurrentRoom.Door.Hidden, 0)
        wait(0.3)
    end

    game:GetService("Workspace").CurrentRooms.ChildAdded:Connect(function(v)
        repeat task.wait() until v:FindFirstChild("Door")
        CurrentRoomNum = CurrentRoomNum + 1
        if CurrentRoomNum >= 50  then 
            print("Restarting, Reached 50")
            notif("Reached 50","Restarting")
            game.Players.LocalPlayer.Character.Humanoid.Health = 1
            wait(math.huge)
        end
        if CurrentRoomNum <= 5 then 
            notif("Door "..CurrentRoomNum..", Anti Glitch","Waiting 2.5 Sec")
            print("Anti Glitch",CurrentRoomNum)
            wait(2.5)
        end
        for _,v in pairs(game:GetService("Workspace").CurrentRooms:GetChildren()) do 
            CurrentRoom = v
            if CurrentRoomNum == tonumber(v.Name) then
                --notif("Door","#"..tostring(CurrentRoomNum))
                print("Door","#"..tostring(CurrentRoomNum))
                for i = 1,3 do
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentRoom.Door.Hidden.CFrame
                    wait(0.2)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, CurrentRoom.Door.Hidden, 0)
                    wait(0.1)
                end
                wait(0.1)
            end
        end
    end)
end

local queue_on_teleport = 
queue_on_teleport or syn and syn.queue_on_teleport 
[[
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/NotOreoz/huh/main/T1.lua"))()
]]
spawn(function()
    for i = 1, 45 do 
        print(i.."s | Restarting at 45s")
        if i == 45 or game.Players.LocalPlayer.Character.Humanoid.Health ~= 100 then
            print("Restarting","Automatic Restart (45s), Door 50, Or you Took Damage.")
            notif("Restarting","Automatic Restart (45s), Door 50, Or you Took Damage.")
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            game:GetService("ReplicatedStorage").Bricks.PlayAgain:FireServer()
        end
        wait(1)
    end
end)
