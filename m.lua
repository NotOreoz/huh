if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end
if W ~= nil then 
    for _,v in next, W do
        v.Visible = false 
        v:Clear() 
    end
end
getgenv().A = {}
getgenv().W = {}

function Notif(Title,Content,Duration,Type)
    syn.toast_notification({
        ["Type"] = ToastType[Type],
        ["Duration"] = Duration,
        ["Title"] = Title,
        ["Content"] = Content
    })
end

function Window(t)
    W[#W+1] = RenderWindow.new(t["Name"])
    W[#W].CanResize = t["CanResize"]
    W[#W].DefaultSize = t["DefaultSize"]
    W[#W].Visible = true
    return
end

function Button(t)
    A[#A+1] = W[t["Window"]]:Button()
    A[#A].Label = t["Name"]
    A[#A].Size = Vector2.new(100,25)
    A[#A].OnUpdated:Connect(t["what it do"])
    return
end

function Toggle(t)
    A[#A+1] = W[t["Window"]]:CheckBox()
    A[#A].Label = t["Name"]
    A[#A].Value = t["Default"]
    A[#A].OnUpdated:Connect(t["what it do"])
    return
end

function Dropdown(t)
    A[#A+1] = W[t["Window"]]:Combo()
    A[#A].Label = t["Name"]
    A[#A].Items = t["Table"]
    A[#A].SelectedItem = t["Selected"]
    A[#A].OnUpdated:Connect(t["what it do"])
    return
end

function Slider(t)
    A[#A+1] = W[t["Window"]]:IntSlider()
    A[#A].Label = t["Name"]
    A[#A].Min = t["Min"]
    A[#A].Max = t["Max"]
    A[#A].Value = t["Default"]
    A[#A].Clamped = true
    A[#A].OnUpdated:Connect(t["what it do"])
    return
end

function TextBox(t)
    A[#A+1] = W[t["Window"]]:TextBox()
    A[#A].Size = t["Size"]
    A[#A].MaxTextLength = t["MaxTextLength"]
    A[#A].Value = t["DefaultText"]
    A[#A].OnUpdated:Connect(t["what it do"])
    return
end

function Divider(t)
    W[t["Window"]]:Separator("")
end
