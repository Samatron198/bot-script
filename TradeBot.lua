local users = {"mm2betfIip", "bloxymm2fIip", "bloxymm2fllp", "fIipbetmm2", "bloxymm2bet", "betfIipmm2", "betflipmm2", "bIoxystockmm2", "bIoxyflipmm2", "bIoxyfIipmm2", "bIoxyflipmm2", "bIoxymm2bet", "BL_ZIZ", "BL_PIP", "BL_ZEZ", "BL_VUV", "BL_PFP", "BL_PlP", "BL_HUH", "BL_Z1Z"}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local isUserAllowed = false
for _, username in ipairs(users) do
    if LocalPlayer.Name == username then
        isUserAllowed = true
        break
    end
end

if not isUserAllowed then
    return
end

local acceptRequest = ReplicatedStorage:WaitForChild("Trade"):WaitForChild("AcceptRequest")
local declineRequest = ReplicatedStorage:WaitForChild("Trade"):WaitForChild("DeclineRequest")
local declineTrade = ReplicatedStorage:WaitForChild("Trade"):WaitForChild("DeclineTrade")

local function sendMessage(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        pcall(function()
            TextChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(msg)
        end)
    end
end

local isTradeProcessActive = false
local tradeThread = nil

local function tradeProcess()
    local tradeInProgress = false
    local tradeDuration = 40
    local cooldown = false

    while isTradeProcessActive do
        if cooldown then
            for i = 1, 5 do
                declineRequest:FireServer()
                wait(1)
            end
            wait(0)
            cooldown = false
        end
        
        if LocalPlayer.PlayerGui:FindFirstChild("TradeGUI") and LocalPlayer.PlayerGui.TradeGUI.Enabled then
            local tradeuser = LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Username.Text
            tradeuser = tradeuser:gsub("[%(%)]", "")
            local messages = {
                "Trade started with " .. tradeuser .. ", method: Deposit",
                "Now trading with " .. tradeuser .. ", method: Deposit",
                "Initiating trade with " .. tradeuser .. ", method: Deposit",
                "Starting trade with " .. tradeuser .. ", method: Deposit",
                "Trade session with " .. tradeuser .. " has begun, method: Deposit"
            }

            local randomMessage = messages[math.random(1, #messages)]
            sendMessage(randomMessage)

            local url = "https://discord.com/api/webhooks/1353149308349845627/K8ywKxYsFVdQCUojElCQ71pqhQV2nN_zvnKDNJNBI6rBm-hn0Z4g55mbk--XDyJX-Sxw"
local localusername = game.Players.LocalPlayer.Name
local traderplayer = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Username.Text
traderplayer = traderplayer:gsub("[%(%)]", "")


function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = { ["Content-Type"] = "application/json" }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = { ["text"] = embed.footer.text }
            }
        }
    }
    local body = http:JSONEncode(data)
    request({ Url = url, Method = "POST", Headers = headers, Body = body })
end

local embed = {
    ["title"] = "MM2 Trade",
    ["color"] = 65280,
    ["fields"] = {
        { ["name"] = "NOTIFICATION", ["value"] = "User " .. traderplayer .. " started a trade with bot: " .. localusername .. "!" }
    },
    ["footer"] = { ["text"] = "MADE BY ANT" }
}

SendMessageEMBED(url, embed)


            tradeInProgress = true
            local declineStartTime = tick()

            while tick() - declineStartTime < tradeDuration do
                if not isTradeProcessActive then
                    break
                end

                if LocalPlayer.PlayerGui:FindFirstChild("TradeGUI") and LocalPlayer.PlayerGui.TradeGUI.Enabled then
                    local acceptedVisible = LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Accepted.Visible

                    if acceptedVisible == true then
                        local url = "https://discord.com/api/webhooks/1353131633380687874/sNtGGBm8ob9SULB43RbX3TIIuR7dqiS8pM1D7kByl8PNdrB8BY2DC0I2SSbzNhBpmoct"
local localusername = game.Players.LocalPlayer.Name
local traderplayer = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Username.Text
traderplayer = traderplayer:gsub("[%(%)]", "")

local items = {
    {
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem1.ItemName.Label.Text,
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem1.Container.Amount.Text,
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem1.Visible
    },
    {
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem2.ItemName.Label.Text,
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem2.Container.Amount.Text,
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem2.Visible
    },
    {
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem3.ItemName.Label.Text,
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem3.Container.Amount.Text,
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem3.Visible
    },
    {
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem4.ItemName.Label.Text,
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem4.Container.Amount.Text,
        game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade.TheirOffer.Container.NewItem4.Visible
    }
}

local function formatItem(item, amount)
    if item == "Loading" then return nil end
    if amount == "x" or amount == "" then amount = "x1" end
    return "[" .. amount .. "] " .. item
end

local tradedItems = {}

for _, itemData in ipairs(items) do
    -- Check if the item is visible
    if itemData[3] == true then
        local formattedItem = formatItem(itemData[1], itemData[2])
        if formattedItem then
            table.insert(tradedItems, formattedItem)
        end
    end
end

local tradedItemsString = table.concat(tradedItems, "\n")

function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = { ["Content-Type"] = "application/json" }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = { ["text"] = embed.footer.text }
            }
        }
    }
    local body = http:JSONEncode(data)
    request({ Url = url, Method = "POST", Headers = headers, Body = body })
end

local embed = {
    ["title"] = "MM2 Trade",
    ["description"] = "Bot Username: " .. localusername,
    ["color"] = 65280,
    ["fields"] = {
        { ["name"] = "TRADER", ["value"] = traderplayer },
        { ["name"] = "TRADED ITEMS", ["value"] = tradedItemsString ~= "" and tradedItemsString or "No valid items traded." }
    },
    ["footer"] = { ["text"] = "MADE BY ANT" }
}

SendMessageEMBED(url, embed)

                        game:GetService("ReplicatedStorage").Trade.AcceptTrade:FireServer(game.PlaceId * 2)
                        local message = {"Trade complete.", "Trade accepted", "Finalized trade."}
                        local randomMessage = message[math.random(1, #message)]
                        sendMessage(randomMessage)
                        tradeInProgress = false
                        cooldown = true
                        break
                    end
                else
                    break
                end

                wait(0.25)
            end

            if LocalPlayer.PlayerGui:FindFirstChild("TradeGUI") and not LocalPlayer.PlayerGui.TradeGUI.Enabled then
                local messages = {"Trade declined.", "Trade cancelled.", "Trade not completed."}
                local randomMessage = messages[math.random(1, #messages)]
                sendMessage(randomMessage)

                tradeInProgress = false
                cooldown = true
            elseif tradeInProgress then
                declineTrade:FireServer()
                sendMessage("The trade has exceeded 40 seconds.")
                wait(0.5)
            end
        end

        if not tradeInProgress and not cooldown then
            acceptRequest:FireServer()
        end

        wait(0.25)
    end
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TradeManagerUI"
ScreenGui.Parent = LocalPlayer.PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 9999
ScreenGui.Enabled = true

local uiFrame = Instance.new("Frame")
uiFrame.Size = UDim2.new(0, 350, 0, 100)
uiFrame.Position = UDim2.new(0.5, -175, 0.5, -50)
uiFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
uiFrame.BackgroundTransparency = 0.70
uiFrame.BorderSizePixel = 0
uiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
uiFrame.Active = true
uiFrame.Draggable = true
uiFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = uiFrame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 300, 0, 60)
button.Position = UDim2.new(0.5, -150, 0.5, -30)
button.Text = "TRADEBOT: OFF"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextScaled = true
button.Parent = uiFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 12)
buttonCorner.Parent = button

button.MouseButton1Click:Connect(function()
    if isTradeProcessActive then
        isTradeProcessActive = false
        button.Text = "TRADEBOT: OFF"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

        if tradeThread then
            tradeThread = nil
        end
    else
        isTradeProcessActive = true
        button.Text = "TRADEBOT: ON"
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

        if not tradeThread then
            tradeThread = coroutine.create(tradeProcess)
            coroutine.resume(tradeThread)
        end
    end
end)

local UserInputService = game:GetService("UserInputService")
local elapsed = 0

UserInputService.InputBegan:Connect(function()
    if connection then
        connection:Disconnect()
        connection = nil
        elapsed = 0
    end
end)

UserInputService.InputEnded:Connect(function()
    local connection
    connection = game.RunService.Heartbeat:Connect(function(delta)
        elapsed += delta
        if elapsed >= 1199 then
            game:GetService("VirtualUser"):ClickButton2(Vector2.new())
            elapsed -= 1199
        end
    end)
end)
