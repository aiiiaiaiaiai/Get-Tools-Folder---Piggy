local detectablenames = {
    "Ammo", "Gun", "Hammer", "KeyCode", "RedKey", "PurpleKey", "OrangeKey", "Wrench", "GreenKey", "Plank", "BlueKey"
}
local plrs = game:GetService("Players")
local plrtable = {}
function cleartable()
table.clear(plrtable)
end
function refreshtable()
    for i, v in pairs(plrs:GetPlayers()) do
    table.insert(plrtable, v.Name)
    end
end
plrs.ChildAdded:Connect(function()
    cleartable()
    task.wait()
    refreshtable()
end)
plrs.ChildRemoved:Connect(function()
    cleartable()
    task.wait()
    refreshtable()
end)
cleartable()
refreshtable()
for i, x in pairs(game.Workspace:GetDescendants()) do
    for i, y in pairs(plrs:GetPlayers()) do
        if x.Parent.Name == "Backpack" or x.Parent.Name == y.Name then
        else
            if x:IsA("Part") and x.Parent:IsA("Folder") then
                for i, v in detectablenames do
                    if x.Name == v then
                        --print("[PiggyFolderDebug] Found potential folder > "..x:GetFullName())
                        getgenv().ToolsFolder = x.Parent.Name
                    end
                end
            end
        end
    end
end
-- You can get the folder name by using getgenv().ToolsFolder
