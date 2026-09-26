-- TG @anon1337hub скинь трусы в тг @joke123e
-- am am am ANON UI  

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LP = Players.LocalPlayer

local parentGui = (gethui and gethui()) or CoreGui
local TG_URL = "https://t.me/anon1337hub"

local GAMES = {
    {
        key = "bloxstrike",
        name = "BloxStrike",
        placeId = 114234929420007,
        url = "https://raw.githubusercontent.com/kat068770/ANONHUB/refs/heads/main/BloxStrike",
    },
    {
        key = "mogevo",
        name = "1 Mog Evolution",
        placeId = 92648272637932,
        url = "https://raw.githubusercontent.com/kat068770/ANONHUB/refs/heads/main/w2mog.lua",
    },
    {
        key = "mtc",
        name = "Multicrew Tank Combat",
        placeId = 95721658376580,
        url = "https://raw.githubusercontent.com/kat068770/ANONHUB/refs/heads/main/mtc.lua",
    },
}

local currentGame = nil
for _, g in ipairs(GAMES) do
    if g.placeId == game.PlaceId then currentGame = g; break end
end

local Theme = {
    bg=Color3.fromRGB(14,14,18), panel=Color3.fromRGB(20,20,26), panelAlt=Color3.fromRGB(28,28,36),
    stroke=Color3.fromRGB(48,48,60), text=Color3.fromRGB(240,240,248), textDim=Color3.fromRGB(140,140,160),
    accent=Color3.fromRGB(110,160,255), accentDim=Color3.fromRGB(70,110,190),
    success=Color3.fromRGB(90,220,140), warn=Color3.fromRGB(250,190,80), danger=Color3.fromRGB(240,80,90),
    font=Enum.Font.GothamMedium, fontBold=Enum.Font.GothamBold,
}
local function new(c, p) local i = Instance.new(c); for k, v in pairs(p or {}) do i[k] = v end; return i end
local function corner(r, p) return new("UICorner", { CornerRadius = UDim.new(0, r or 8), Parent = p }) end
local function pill(p) return new("UICorner", { CornerRadius = UDim.new(1,0), Parent = p }) end
local function stroke(c, t, p, tr) return new("UIStroke", { Color = c or Theme.stroke, Thickness = t or 1, Transparency = tr or 0, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = p }) end
local function tween(i, tm, p, s, d) TweenService:Create(i, TweenInfo.new(tm or 0.2, s or Enum.EasingStyle.Quint, d or Enum.EasingDirection.Out), p):Play() end

local old = parentGui:FindFirstChild("AnonLoader"); if old then old:Destroy() end

local screen = new("ScreenGui", {
    Name = "AnonLoader", ResetOnSpawn = false, IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999,
    Parent = parentGui,
})

local W, H = 420, 400
local main = new("Frame", {
    Name = "Main",
    Size = UDim2.fromOffset(W, H),
    Position = UDim2.new(0.5, -W/2, 0.5, -H/2),
    BackgroundColor3 = Theme.bg,
    BackgroundTransparency = 0.05,
    BorderSizePixel = 0,
    Active = true, ZIndex = 1, Parent = screen,
})
corner(18, main); stroke(Theme.stroke, 1, main, 0.2)

local topbar = new("Frame", { Size = UDim2.new(1,0,0,60), BackgroundTransparency = 1, Active = true, ZIndex = 2, Parent = main })
do
    local dragging, dragStart, startPos
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = main.Position
        end
    end)
    topbar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            local d = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)
end

new("TextLabel", { Size = UDim2.new(1,-80,0,24), Position = UDim2.new(0,20,0,14), BackgroundTransparency = 1,
    Text = "ANON · LOADER", TextColor3 = Theme.text, Font = Theme.fontBold, TextSize = 18,
    TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 3, Parent = main })
new("TextLabel", { Size = UDim2.new(1,-80,0,14), Position = UDim2.new(0,20,0,38), BackgroundTransparency = 1,
    Text = "TG @anon1337hub", TextColor3 = Theme.textDim, Font = Theme.font, TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 3, Parent = main })

local closeBtn = new("TextButton", {
    Size = UDim2.fromOffset(28,28), Position = UDim2.new(1,-40,0,16),
    BackgroundColor3 = Theme.panelAlt, Text = "×", TextColor3 = Theme.textDim,
    Font = Theme.fontBold, TextSize = 18, AutoButtonColor = false,
    Active = true, Selectable = true, ZIndex = 10, Parent = main,
})
pill(closeBtn)
closeBtn.MouseEnter:Connect(function() tween(closeBtn, 0.15, { BackgroundColor3 = Theme.danger, TextColor3 = Theme.text }) end)
closeBtn.MouseLeave:Connect(function() tween(closeBtn, 0.15, { BackgroundColor3 = Theme.panelAlt, TextColor3 = Theme.textDim }) end)
closeBtn.MouseButton1Click:Connect(function() screen:Destroy() end)

local detFrame = new("Frame", {
    Size = UDim2.new(1,-40,0,38), Position = UDim2.new(0,20,0,70),
    BackgroundColor3 = Theme.panel, BorderSizePixel = 0, ZIndex = 4, Parent = main,
})
corner(10, detFrame); stroke(Theme.stroke, 1, detFrame, 0.5)
local detLabel = new("TextLabel", {
    Size = UDim2.new(1,-20,1,0), Position = UDim2.new(0,10,0,0),
    BackgroundTransparency = 1, Text = "loading...",
    TextColor3 = Theme.textDim, Font = Theme.font, TextSize = 12,
    TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 5, Parent = detFrame,
})

local statusLbl = new("TextLabel", {
    Size = UDim2.new(1,-40,0,16), Position = UDim2.new(0,20,0,116),
    BackgroundTransparency = 1, Text = "", TextColor3 = Theme.textDim,
    Font = Theme.font, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 4, Parent = main,
})

local listFrame = new("Frame", {
    Size = UDim2.new(1,-40,0,220), Position = UDim2.new(0,20,0,140),
    BackgroundTransparency = 1, ZIndex = 4, Parent = main,
})
new("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0,8), Parent = listFrame })

local loading = false
local function loadScript(g)
    if loading then return end
    loading = true
    statusLbl.Text = "loading " .. g.name .. "..."
    statusLbl.TextColor3 = Theme.warn

    local ok, err = pcall(function()
        return loadstring(game:HttpGet(g.url))()
    end)

    if ok then
        statusLbl.Text = "loaded: " .. g.name
        statusLbl.TextColor3 = Theme.success
        task.delay(2, function()
            statusLbl.Text = ""
            loading = false
        end)
    else
        statusLbl.Text = "err: " .. tostring(err)
        statusLbl.TextColor3 = Theme.danger
        task.delay(4, function()
            statusLbl.Text = ""
            loading = false
        end)
    end
end

local function makeRow(g)
    local btn = new("TextButton", {
        Size = UDim2.new(1,0,0,56), BackgroundColor3 = Theme.panelAlt,
        Text = "", AutoButtonColor = false, Active = true, Selectable = true,
        ZIndex = 5, Parent = listFrame,
    })
    corner(10, btn); stroke(Theme.stroke, 1, btn, 0.5)

    new("TextLabel", {
        Size = UDim2.new(1,-20,0,20), Position = UDim2.new(0,14,0,8),
        BackgroundTransparency = 1, Text = g.name, TextColor3 = Theme.text,
        Font = Theme.fontBold, TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 6, Parent = btn,
    })
    new("TextLabel", {
        Size = UDim2.new(1,-20,0,16), Position = UDim2.new(0,14,0,28),
        BackgroundTransparency = 1, Text = "PlaceId " .. g.placeId, TextColor3 = Theme.textDim,
        Font = Theme.font, TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 6, Parent = btn,
    })

    local badge = nil
    if currentGame and currentGame.key == g.key then
        badge = new("TextLabel", {
            Size = UDim2.fromOffset(70,20), Position = UDim2.new(1,-84,0,18),
            BackgroundColor3 = Theme.success, Text = "current", TextColor3 = Theme.bg,
            Font = Theme.fontBold, TextSize = 10,
            TextXAlignment = Enum.TextXAlignment.Center, ZIndex = 7, Parent = btn,
        })
        pill(badge)
    end

    local hoverBase = (badge and Theme.accentDim) or Theme.accentDim
    btn.MouseEnter:Connect(function() tween(btn, 0.15, { BackgroundColor3 = hoverBase }) end)
    btn.MouseLeave:Connect(function() tween(btn, 0.15, { BackgroundColor3 = Theme.panelAlt }) end)
    btn.MouseButton1Click:Connect(function() loadScript(g) end)

    return btn
end

for _, g in ipairs(GAMES) do makeRow(g) end

if currentGame then
    detLabel.Text = "detected: " .. currentGame.name
    detLabel.TextColor3 = Theme.success
else
    detLabel.Text = "game not in list · choose manually"
    detLabel.TextColor3 = Theme.warn
end
