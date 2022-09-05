getgenv().Main_Settings = {
    ["Time_Between_Doors"] = 0.1,
    ["Wait_On_Locked_Doors"] = 0.8
}

local Exploit = (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or ("Unsupported")

if Exploit ~= "Synapse" then 
    game.Players.LocalPlayer:Kick("SynX Only")
end

local function notif(ST,TT) game:GetService("StarterGui"):SetCore("SendNotification",{ Title = ST, Text = TT, Icon = "rbxassetid://"}) end

game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

if game.GameId == 2440500124 then 
    repeat task.wait() until game.Workspace:FindFirstChild("CurrentRooms"):FindFirstChild("0")
    notif("Script Started",".")
    repeat
        fireproximityprompt(game.Workspace.CurrentRooms["0"].StarterElevator.Model.Model.SkipButton.SkipPrompt)
        wait(3)
    until game.Workspace:FindFirstChild("CurrentRooms"):FindFirstChild("0"):FindFirstChild("StarterElevator"):FindFirstChild("DoorHitbox"):FindFirstChild("BillboardGui"):FindFirstChild("Seconds").Text == ""
    if game.Players.LocalPlayer.Character:FindFirstChild("Collision") then 
        game.Players.LocalPlayer.Character.Collision:Destroy()
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Parent = game.Players.LocalPlayer.Character.Head
        wait(.1)
        game.Players.LocalPlayer.Character:FindFirstChild("Head"):FindFirstChild("HumanoidRootPart").Parent = game.Players.LocalPlayer.Character
        wait(.5)
    end
    local KeyFound = false
    local RoomNum = 0
    local CurrentRoomNum = 0
    local CurrentRoom = nil
    for _,v in pairs(game:GetService("Workspace").CurrentRooms:GetChildren()) do 
        RoomNum = tonumber(v.Name)
        CurrentRoom = v
        if CurrentRoomNum == RoomNum then
            if v.Door:FindFirstChild("Lock") then 
                for _1,v1 in pairs(v:GetDescendants()) do 
                    if string.find(v1.Name,"Key") and v1:IsA("MeshPart") and v1.Parent.Parent.Name == "KeyObtain" then 
                        KeyFound = true
                        print("Key Door",v.Name.." Locked. Searching For Key")
                        if string.find(v1.Parent.Name,"Drawer") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1.Parent.Holder.CFrame
                            wait(.2)
                            fireproximityprompt(v1.Parent.Knobs.ActivateEventPrompt)
                            wait(.1)
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1.CFrame
                        wait(.5)
                        fireproximityprompt(v1.Parent.Parent.ModulePrompt)
                        wait(Main_Settings["Wait On Locked Doors"])
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentRoom.Door.Lock.CFrame
                        wait(Main_Settings["Wait On Locked Doors"])
                        fireproximityprompt(CurrentRoom.Door.Lock.UnlockPrompt)
                        print("Key Door",v.Name.." Opened.")
                    end
                end
            end
            for _2,v2 in pairs(v:GetDescendants()) do 
                if v2.Name == "LeverConstraint" then 
                    print("Gate Door",v.Name.." Locked. Searching For Lever")
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.Parent.Main.CFrame
                    wait(.1)
                    fireproximityprompt(v2.Parent.ActivateEventPrompt)
                    print("Gate Door",v.Name.." Pressed/Opened.")
                    wait(.1)
                end
            end
            if not KeyFound then 
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentRoom.Door.Door.CFrame
            end
            KeyFound = false
            if Main_Settings["Time_Between_Doors"] == 0 then 
                task.wait(1/60)
            else
                wait(Main_Settings["Time_Between_Doors"])
            end
        end
    end

    game:GetService("Workspace").CurrentRooms.ChildAdded:Connect(function(v)
        CurrentRoomNum = tonumber(v.Name)-1 
        print("Room:",CurrentRoomNum) 
        if CurrentRoomNum == 50 then 
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            game:GetService("ReplicatedStorage").Bricks.PlayAgain:FireServer()
            wait(math.huge)
        end
        for _,v in pairs(game:GetService("Workspace").CurrentRooms:GetChildren()) do 
            RoomNum = tonumber(v.Name)
            CurrentRoom = v
            if CurrentRoomNum == RoomNum then
                if v.Door:FindFirstChild("Lock") then 
                    for _1,v1 in pairs(v:GetDescendants()) do 
                        if string.find(v1.Name,"Key") and v1:IsA("MeshPart") and v1.Parent.Parent.Name == "KeyObtain" then 
                            KeyFound = true
                            print("Key Door",v.Name.." Locked. Searching For Key")
                            if string.find(v1.Parent.Name,"Drawer") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1.Parent.Holder.CFrame
                                wait(.2)
                                fireproximityprompt(v1.Parent.Knobs.ActivateEventPrompt)
                                wait(.1)
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1.CFrame
                            wait(.5)
                            fireproximityprompt(v1.Parent.Parent.ModulePrompt)
                            wait(Main_Settings["Wait_On_Locked_Doors"])
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentRoom.Door.Lock.CFrame
                            wait(Main_Settings["Wait_On_Locked_Doors"])
                            fireproximityprompt(CurrentRoom.Door.Lock.UnlockPrompt)
                            print("Key Door",v.Name.." Opened.")
                        end
                    end
                end
                for _2,v2 in pairs(v:GetDescendants()) do 
                    if v2.Name == "LeverConstraint" then 
                        print("Gate Door",v.Name.." Locked. Searching For Lever")
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v2.Parent.Main.CFrame
                        wait(.1)
                        fireproximityprompt(v2.Parent.ActivateEventPrompt)
                        print("Gate Door",v.Name.." Pressed/Opened.")
                        wait(.1)
                    end
                end
                if not KeyFound then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentRoom.Door.Door.CFrame
                end
                KeyFound = false
                if Main_Settings["Time_Between_Doors"] == 0 then 
                    task.wait(1/60)
                else
                    wait(Main_Settings["Time_Between_Doors"])
                end
            end
        end
    end)
end

local queue_on_teleport = 
queue_on_teleport or syn and syn.queue_on_teleport 
[[repeat wait() until game:IsLoaded() 
wait(7) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/NotOreoz/huh/main/T1.lua"))()
]]
