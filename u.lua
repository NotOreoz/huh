if W ~= nil then 
    for _,v in next, W do
        v.Visible = false 
        v:Clear() 
    end 
end

if not RenderWindow then game:GetService("Players").LocalPlayer:Kick("Not V3") end

getgenv().A = {}
getgenv().W = {}

local function Notif(Title,Content,Duration,Type)
    syn.toast_notification({
        ["Type"] = ToastType[Type],
        ["Duration"] = Duration,
        ["Title"] = Title,
        ["Content"] = Content
    })
end

local function Window(t)
    W[#W+1] = RenderWindow.new(t["Name"])
    W[#W].CanResize = t["CanResize"]
    W[#W].DefaultSize = t["DefaultSize"]
    W[#W].Visible = true
    return
end

local function Button(t)
    A[#A+1] = W[t["Window"]]:Button()
    A[#A].Label = t["Name"]
    A[#A].Size = Vector2.new(100,25)
    A[#A].OnUpdated:Connect(t["what it do"])
    return
end

local function Toggle(t)
    A[#A+1] = W[t["Window"]]:CheckBox()
    A[#A].Label = t["Name"]
    A[#A].Value = t["Default"]
    A[#A].OnUpdated:Connect(t["what it do"])
    return
end

local function Dropdown(t)
    A[#A+1] = W[t["Window"]]:Combo()
    A[#A].Label = t["Name"]
    A[#A].Items = t["Table"]
    A[#A].SelectedItem = t["Selected"]
    A[#A].OnUpdated:Connect(t["what it do"])
    return
end

local function Slider(t)
    A[#A+1] = W[t["Window"]]:IntSlider()
    A[#A].Min = t["Min"]
    A[#A].Max = t["Max"]
    A[#A].Value = t["Default"]
    A[#A].Clamped = true
    A[#A].OnUpdated:Connect(t["what it do"])
    return
end

local function TextBox(t)
    A[#A+1] = W[t["Window"]]:TextBox()
    A[#A].Size = t["Size"]
    A[#A].MaxTextLength = t["MaxTextLength"]
    A[#A].Value = t["DefaultText"]
    A[#A].OnUpdated:Connect(t["what it do"])
    return
end

local function Divider(t)
    W[t["Window"]]:Separator("")
end

Notif("Loaded_2","-",5,"Success")
