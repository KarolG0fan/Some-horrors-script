if game.PlaceId == 7711635737 then
    -- Rayfield library setup
    local Rayfield
    local success, message = pcall(function()
        Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    end)

    if not success then
        warn("Failed to load Rayfield: " .. message)
        return -- Stop execution if Rayfield failed to load
    end

    -- Create the main window
    local Window = Rayfield:CreateWindow({
        Name = "Some horrors Scripts",
        LoadingTitle = "Some Horrors Script",
        LoadingSubtitle = "by Souls",
        Theme = "Default",
        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false,
        ConfigurationSaving = {
            Enabled = true,
            FileName = "Emergency Hamburg Hub"
        },
        Discord = {
            Enabled = true,
            Invite = "AAdqsWYQpR",
            RememberJoins = true
        },
        KeySystem = true,
        KeySettings = {
            Title = "Untitled",
            Subtitle = "Key System",
            Note = "https://discord.gg/AAdqsWYQpR",
            FileName = "Key",
            SaveKey = false,
            Key = {"Some_Horros_Key2025"}
        }
    })

    -- Tab for Main Features
    local Tab = Window:CreateTab("Main Features", 4483362458)

    -- ESP Button
    local ESPButton = Tab:CreateButton({
        Name = "ESP",
        Callback = function()
            local Holder = Instance.new("Folder", game.CoreGui)
            Holder.Name = "ESP"

            local Box = Instance.new("BoxHandleAdornment")
            Box.Name = "nilBox"
            Box.Size = Vector3.new(4, 7, 4)
            Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
            Box.Transparency = 0.7
            Box.ZIndex = 0
            Box.AlwaysOnTop = true
            Box.Visible = true

            local NameTag = Instance.new("BillboardGui")
            NameTag.Name = "nilNameTag"
            NameTag.Enabled = false
            NameTag.Size = UDim2.new(0, 200, 0, 50)
            NameTag.AlwaysOnTop = true
            NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
            local Tag = Instance.new("TextLabel", NameTag)
            Tag.Name = "Tag"
            Tag.BackgroundTransparency = 1
            Tag.Position = UDim2.new(0, -50, 0, 0)
            Tag.Size = UDim2.new(0, 300, 0, 20)
            Tag.TextSize = 20
            Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
            Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
            Tag.TextStrokeTransparency = 0.4
            Tag.Text = "nil"
            Tag.Font = Enum.Font.SourceSansBold
            Tag.TextScaled = false

            local LoadCharacter = function(v)
                repeat wait() until v.Character ~= nil
                v.Character:WaitForChild("Humanoid")
                local vHolder = Holder:FindFirstChild(v.Name)
                vHolder:ClearAllChildren()
                local b = Box:Clone()
                b.Name = v.Name .. "Box"
                b.Adornee = v.Character
                b.Parent = vHolder
                local t = NameTag:Clone()
                t.Name = v.Name .. "NameTag"
                t.Enabled = true
                t.Parent = vHolder
                t.Adornee = v.Character:WaitForChild("Head", 5)
                if not t.Adornee then
                    return UnloadCharacter(v)
                end
                t.Tag.Text = v.Name
                b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
                t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)

                -- Update NameTag based on health
                local UpdateNameTag = function()
                    if not pcall(function()
                        v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                        local maxh = math.floor(v.Character.Humanoid.MaxHealth)
                        local h = math.floor(v.Character.Humanoid.Health)
                        t.Tag.Text = v.Name .. "\n" .. ((maxh ~= 0 and tostring(math.floor((h / maxh) * 100))) or "0") .. "%  " .. tostring(h) .. "/" .. tostring(maxh)
                    end) then
                        Update:Disconnect()
                    end
                end
                UpdateNameTag()
                Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
            end

            local UnloadCharacter = function(v)
                local vHolder = Holder:FindFirstChild(v.Name)
                if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
                    vHolder:ClearAllChildren()
                end
            end

            local LoadPlayer = function(v)
                local vHolder = Instance.new("Folder", Holder)
                vHolder.Name = v.Name
                v.CharacterAdded:Connect(function()
                    pcall(LoadCharacter, v)
                end)
                v.CharacterRemoving:Connect(function()
                    pcall(UnloadCharacter, v)
                end)
                v.Changed:Connect(function(prop)
                    if prop == "TeamColor" then
                        UnloadCharacter(v)
                        wait()
                        LoadCharacter(v)
                    end
                end)
                LoadCharacter(v)
            end

            local UnloadPlayer = function(v)
                UnloadCharacter(v)
                local vHolder = Holder:FindFirstChild(v.Name)
                if vHolder then
                    vHolder:Destroy()
                end
            end

            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                spawn(function() pcall(LoadPlayer, v) end)
            end

            game:GetService("Players").PlayerAdded:Connect(function(v)
                pcall(LoadPlayer, v)
            end)

            game:GetService("Players").PlayerRemoving:Connect(function(v)
                pcall(UnloadPlayer, v)
            end)

            game:GetService("Players").LocalPlayer.NameDisplayDistance = 0
        end
    })

    -- Infinite Jump Button
    local InfiniteJumpButton = Tab:CreateButton({
        Name = "Infinite Jump",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/WweihvrM"))()
        end
    })

    -- Aimbot/ESP Button
    local AimbotButton = Tab:CreateButton({
        Name = "Aimbot/ESP",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
        end
    })

    -- Mod Cars Button
    local ModCarsButton = Tab:CreateButton({
        Name = "Mod Cars",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/vrAfVSFT"))()
        end
    })

    -- Cars Mod/fly speed Toggle
    local CarsModToggle = Tab:CreateToggle({
        Name = "Cars Mod/fly speed",
        CurrentValue = false,
        Flag = "Toggle1", -- A flag is the identifier for the configuration file
        Callback = function(Value)
            if Value then
                loadstring(game:HttpGet("https://pastebin.com/raw/v5Pj1G8p", true))()
            else
                print("Cars Mod/fly speed Disabled!")
            end
        end
    })

    -- Tab for Teleport
    local TeleportTab = Window:CreateTab("Teleport", "rewind")

    -- Teleport to Player Button
    local TeleportToPlayerButton = TeleportTab:CreateButton({
        Name = "Teleport to Player",
        Callback = function()
            local targetPlayer = game.Players:GetPlayers()
            if #targetPlayer > 1 then
                local target = targetPlayer[2] -- Change index for different player
                if target ~= game.Players.LocalPlayer then
                    game.Players.LocalPlayer.Character:MoveTo(target.Character.HumanoidRootPart.Position)
                end
            end
        end
    })

    -- Teleport Player to You Button
    local TeleportPlayerToYouButton = TeleportTab:CreateButton({
        Name = "Teleport Player to You",
        Callback = function()
            local targetPlayer = game.Players:GetPlayers()
            if #targetPlayer > 1 then
                local target = targetPlayer[2] -- Change index to choose player
                if target ~= game.Players.LocalPlayer then
                    target.Character:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                end
            end
        end
    })

    -- Settings Tab for Fov and Theme
    local SettingsTab = Window:CreateTab("Settings", 4483362458)

    -- FOV Button
    local FovButton = SettingsTab:CreateButton({
        Name = "FOV Script",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Glockyori/fov/main/fovscript"))()
        end
    })

    -- Admin Script Button (Infinite Yield)
    local AdminButton = Settings
end