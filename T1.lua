repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name) 
repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")
local function notif(ST,TT) game:GetService("StarterGui"):SetCore("SendNotification",{ Title = ST, Text = TT, Icon = "rbxassetid://"}) end

if game.GameId == 2440500124 then 
    repeat task.wait() until game.Workspace:FindFirstChild("CurrentRooms"):FindFirstChild("0")
    notif("Script Started","Press Del (SynX Internal UI To see whats happening.")
    repeat
        fireproximityprompt(game.Workspace.CurrentRooms["0"].StarterElevator.Model.Model.SkipButton.SkipPrompt)
        game:GetService("ReplicatedStorage").Bricks.PreRunShop:FireServer({})
        wait(2)
    until game.Workspace:FindFirstChild("CurrentRooms"):FindFirstChild("0"):FindFirstChild("StarterElevator"):FindFirstChild("DoorHitbox"):FindFirstChild("BillboardGui"):FindFirstChild("Seconds").Text == ""
    if game.Players.LocalPlayer.Character:FindFirstChild("Collision") then 
        game.Players.LocalPlayer.Character.Collision:Destroy()
    end
    local KeyFound = false
    local RoomNum = 0
    local CurrentRoomNum = 1
    local CurrentRoom = nil
    for _,v in pairs(game:GetService("Workspace").CurrentRooms:GetChildren()) do 
        CurrentRoom = v
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentRoom.Door.Hidden.CFrame
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, CurrentRoom.Door.Hidden, 0)
        wait(0.3)
    end

    game:GetService("Workspace").CurrentRooms.ChildAdded:Connect(function(v)
        repeat task.wait() until v:FindFirstChild("Door")
        repeat task.wait() until v.Door:FindFirstChild("Hidden")
        CurrentRoomNum = CurrentRoomNum + 1
        if CurrentRoomNum >= 50  then 
            notif("Reached 50","Restarting")
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            game:GetService("ReplicatedStorage").Bricks.PlayAgain:FireServer()
            wait(math.huge)
        end
        if CurrentRoomNum <= 5 then 
            notif("Door "..CurrentRoomNum..", Anti Glitch","Waiting 2.5 Sec")
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
--
spawn(function()
    for i = 1, 35 do 
        print(i.."s | Restarting at 35s")
        if i == 35 or game.Players.LocalPlayer.Character.Humanoid.Health ~= 100 then
            notif("Restarting","Automatic Restart (35s) Or you Took Damage.")
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            game:GetService("ReplicatedStorage").Bricks.PlayAgain:FireServer()
            wait(25)
            game:GetService("ReplicatedStorage").Bricks.PlayAgain:FireServer()
        end
        wait(1)
    end
end)
