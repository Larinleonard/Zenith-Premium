-- ═══════════════════════════════════════════
--  ✦ ZENITH PREMIUM | v107 ✦
--  🚀 No failed pickup + zero lag
-- ═══════════════════════════════════════════

print("[Zenith Premium] Booting...")

if not game:IsLoaded() then game.Loaded:Wait() end
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local VIM = game:GetService("VirtualInputManager")
local RS = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

for _,v in ipairs(((gethui and gethui()) or game:GetService("CoreGui")):GetDescendants()) do
    if v.Name == "ZenithPremium" then v:Destroy() end
end

local parent = (gethui and gethui()) or game:GetService("CoreGui")
local gui = Instance.new("ScreenGui")
gui.Name = "ZenithPremium"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = parent

-- ═══ FULLSCREEN 50% BLACK LOADER ═══
local overlay = Instance.new("Frame", gui)
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.Position = UDim2.new(0, 0, 0, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.5
overlay.BorderSizePixel = 0
overlay.ZIndex = 20
overlay.Active = true

local loader = Instance.new("Frame", overlay)
loader.Size = UDim2.new(0, 320, 0, 200)
loader.Position = UDim2.new(0.5, -160, 0.5, -100)
loader.BackgroundColor3 = Color3.fromRGB(8, 6, 14)
loader.BorderSizePixel = 0
loader.ZIndex = 21
Instance.new("UICorner", loader).CornerRadius = UDim.new(0, 20)

local grad = Instance.new("UIGradient", loader)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 10, 60)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 8, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 10, 60))
}
grad.Rotation = 45

local lStroke = Instance.new("UIStroke", loader)
lStroke.Color = Color3.fromRGB(160, 80, 255)
lStroke.Thickness = 2.5
lStroke.Transparency = 0

task.spawn(function()
    while loader.Parent do
        TweenService:Create(lStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {Color = Color3.fromRGB(80, 200, 255)}):Play()
        task.wait(1.2)
        TweenService:Create(lStroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {Color = Color3.fromRGB(200, 80, 255)}):Play()
        task.wait(1.2)
    end
end)

local star = Instance.new("TextLabel", loader)
star.Size = UDim2.new(0, 60, 0, 60)
star.Position = UDim2.new(0.5, -30, 0, 15)
star.BackgroundTransparency = 1
star.Text = "✦"
star.TextColor3 = Color3.fromRGB(180, 120, 255)
star.Font = Enum.Font.GothamBlack
star.TextSize = 48
star.ZIndex = 22

task.spawn(function()
    while loader.Parent do
        star.Rotation = 0
        TweenService:Create(star, TweenInfo.new(2, Enum.EasingStyle.Linear), {Rotation = 360}):Play()
        task.wait(2)
    end
end)

local lTitle = Instance.new("TextLabel", loader)
lTitle.Size = UDim2.new(1, -20, 0, 30)
lTitle.Position = UDim2.new(0, 10, 0, 75)
lTitle.BackgroundTransparency = 1
lTitle.Text = "ZENITH PREMIUM"
lTitle.TextColor3 = Color3.fromRGB(230, 200, 255)
lTitle.Font = Enum.Font.GothamBlack
lTitle.TextSize = 22
lTitle.TextStrokeTransparency = 0.6
lTitle.TextStrokeColor3 = Color3.fromRGB(140, 70, 255)
lTitle.ZIndex = 22

local lSub = Instance.new("TextLabel", loader)
lSub.Size = UDim2.new(1, -20, 0, 20)
lSub.Position = UDim2.new(0, 10, 0, 105)
lSub.BackgroundTransparency = 1
lSub.Text = "Initializing..."
lSub.TextColor3 = Color3.fromRGB(160, 160, 190)
lSub.Font = Enum.Font.GothamMedium
lSub.TextSize = 12
lSub.ZIndex = 22

local barBG = Instance.new("Frame", loader)
barBG.Size = UDim2.new(1, -40, 0, 8)
barBG.Position = UDim2.new(0, 20, 0, 135)
barBG.BackgroundColor3 = Color3.fromRGB(25, 20, 35)
barBG.BorderSizePixel = 0
barBG.ZIndex = 22
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1, 0)

local barFill = Instance.new("Frame", barBG)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(140, 70, 255)
barFill.BorderSizePixel = 0
barFill.ZIndex = 23
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)
local barGrad = Instance.new("UIGradient", barFill)
barGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 200)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(140, 70, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 200, 255))
}

local pct = Instance.new("TextLabel", loader)
pct.Size = UDim2.new(1, -20, 0, 16)
pct.Position = UDim2.new(0, 10, 0, 148)
pct.BackgroundTransparency = 1
pct.Text = "0%"
pct.TextColor3 = Color3.fromRGB(180, 140, 255)
pct.Font = Enum.Font.GothamBold
pct.TextSize = 11
pct.ZIndex = 22

local ring = Instance.new("Frame", loader)
ring.Size = UDim2.new(0, 70, 0, 70)
ring.Position = UDim2.new(0.5, -35, 0, 10)
ring.BackgroundTransparency = 1
ring.ZIndex = 20
local ringStroke = Instance.new("UIStroke", ring)
ringStroke.Color = Color3.fromRGB(180, 120, 255)
ringStroke.Thickness = 2
ringStroke.Transparency = 0.4
Instance.new("UICorner", ring).CornerRadius = UDim.new(1, 0)

task.spawn(function()
    while loader.Parent do
        TweenService:Create(ringStroke, TweenInfo.new(0.8, Enum.EasingStyle.Sine), {Transparency = 0.9, Thickness = 4}):Play()
        TweenService:Create(ring, TweenInfo.new(0.8, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 90, 0, 90), Position = UDim2.new(0.5, -45, 0, 0)}):Play()
        task.wait(0.8)
        TweenService:Create(ringStroke, TweenInfo.new(0.8, Enum.EasingStyle.Sine), {Transparency = 0.4, Thickness = 2}):Play()
        TweenService:Create(ring, TweenInfo.new(0.8, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 70, 0, 70), Position = UDim2.new(0.5, -35, 0, 10)}):Play()
        task.wait(0.8)
    end
end)

local loadMessages = {
    "Initializing Zenith Premium...",
    "Finding your plot...",
    "Caching game remotes...",
    "Scanning for eggs...",
    "Loading ESP overlay...",
    "Almost ready...",
    "Ready!"
}

local function setProgress(p)
    p = math.clamp(p, 0, 100)
    TweenService:Create(barFill, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(p / 100, 0, 1, 0)}):Play()
    pct.Text = math.floor(p).."%"
    local idx = math.clamp(math.floor(p / (100 / #loadMessages)) + 1, 1, #loadMessages)
    lSub.Text = loadMessages[idx]
end

setProgress(5)

-- MAIN PANEL
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 260, 0, 0)
main.Position = UDim2.new(0, 20, 0.06, 0)
main.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ClipsDescendants = true
main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(120, 60, 220)
stroke.Thickness = 1.5
stroke.Transparency = 0.3

local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 42)
header.BackgroundColor3 = Color3.fromRGB(20, 10, 40)
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -10, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "✦ ZENITH PREMIUM ✦"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBlack
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left

local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, -20, 0, 36)
status.Position = UDim2.new(0, 10, 0, 50)
status.BackgroundColor3 = Color3.fromRGB(18,18,26)
status.Text = "● Ready"
status.TextColor3 = Color3.fromRGB(170,170,190)
status.Font = Enum.Font.Gotham
status.TextSize = 10
status.TextXAlignment = Enum.TextXAlignment.Left
status.TextWrapped = true
Instance.new("UICorner", status).CornerRadius = UDim.new(0, 6)

local eggList = Instance.new("TextLabel", main)
eggList.Size = UDim2.new(1, -20, 0, 56)
eggList.Position = UDim2.new(0, 10, 0, 90)
eggList.BackgroundColor3 = Color3.fromRGB(15,15,22)
eggList.Text = "● Scanning..."
eggList.TextColor3 = Color3.fromRGB(140,220,255)
eggList.Font = Enum.Font.Code
eggList.TextSize = 10
eggList.TextXAlignment = Enum.TextXAlignment.Left
eggList.TextYAlignment = Enum.TextYAlignment.Top
eggList.TextWrapped = true
Instance.new("UICorner", eggList).CornerRadius = UDim.new(0, 6)

local function makeBtn(text, y, bg, sc)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(1, -20, 0, 42)
    b.Position = UDim2.new(0, 10, 0, y)
    b.BackgroundColor3 = bg
    b.Text = text
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.AutoButtonColor = false
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    local s = Instance.new("UIStroke", b)
    s.Color = sc; s.Thickness = 1.5; s.Transparency = 0.2
    b.MouseEnter:Connect(function() TweenService:Create(s, TweenInfo.new(0.2), {Thickness = 2.5, Transparency = 0}):Play() end)
    b.MouseLeave:Connect(function() TweenService:Create(s, TweenInfo.new(0.2), {Thickness = 1.5, Transparency = 0.2}):Play() end)
    return b, s
end

local espFolder = Instance.new("Folder", gui)
espFolder.Name = "ZenithESP"
local espEggFolder = Instance.new("Folder", espFolder); espEggFolder.Name = "Eggs"
local espEggOn = true

local btn = makeBtn("⚡ STEAL 1B+", 154, Color3.fromRGB(45,20,90), Color3.fromRGB(140,70,255))
local hatchBtn = makeBtn("🥚 AUTO HATCH", 200, Color3.fromRGB(20,60,80), Color3.fromRGB(60,200,220))
local buyBtn = makeBtn("💰 AUTO BUY HATCH LUCK", 246, Color3.fromRGB(80,60,10), Color3.fromRGB(255,200,60))
local espEggBtn = makeBtn("👁 EGG ESP: ON", 292, Color3.fromRGB(20,120,40), Color3.fromRGB(80,255,120))
local volcanoBtn = makeBtn("🌋 AUTO VOLCANIC EGG", 338, Color3.fromRGB(90,25,15), Color3.fromRGB(255,120,60))

setProgress(20)
local dropRemote, basketRemote, eggPlacedRemote
pcall(function()
    local rem = RS:FindFirstChild("Remotes")
    if rem then
        local g = rem:FindFirstChild("Game")
        if g then
            dropRemote = g:FindFirstChild("FusionPetPlace")
            basketRemote = g:FindFirstChild("BasketDrop")
            eggPlacedRemote = g:FindFirstChild("EggPlaced")
        end
    end
end)
setProgress(35)

task.spawn(function()
    while gui.Parent do
        local char = lp.Character
        if char then
            for _,p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide then
                    pcall(function() p.CanCollide = false end)
                end
            end
        end
        task.wait(1)
    end
end)

local ranchCF, plotModel = nil, nil
local homeCF = nil
local cachedPlot = nil

task.spawn(function()
    if not lp.Character then lp.CharacterAdded:Wait() end
    task.wait(2)
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
    if hrp then homeCF = hrp.CFrame end
end)

local function isMyPlot(plot)
    local ownerAttr = plot:GetAttribute("Owner")
    if ownerAttr then
        if ownerAttr == lp.UserId or ownerAttr == lp.Name or tostring(ownerAttr) == tostring(lp.UserId) then
            return true
        end
    end
    for _, v in ipairs(plot:GetChildren()) do
        if v:IsA("ObjectValue") and v.Value == lp then return true end
        if v:IsA("IntValue") and v.Value == lp.UserId then
            local n = v.Name:lower()
            if n:find("owner") or n:find("user") or n:find("player") then return true end
        end
        if v:IsA("StringValue") then
            local n = v.Name:lower()
            if n:find("owner") or n:find("user") or n:find("player") then
                if v.Value == lp.Name or v.Value == tostring(lp.UserId) then return true end
            end
        end
    end
    return false
end

local function autoLockRanch()
    if cachedPlot and cachedPlot.Parent then
        local bp = cachedPlot:FindFirstChild("Baseplate") or cachedPlot:FindFirstChildWhichIsA("BasePart", true)
        if bp then
            ranchCF = bp.CFrame + Vector3.new(0, bp.Size.Y/2 + 4, 0)
            plotModel = cachedPlot
            return true
        end
    end
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return false end
    local char = lp.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    for _, plot in ipairs(plots:GetChildren()) do
        if isMyPlot(plot) then
            cachedPlot = plot
            local bp = plot:FindFirstChild("Baseplate") or plot:FindFirstChildWhichIsA("BasePart", true)
            if bp then
                ranchCF = bp.CFrame + Vector3.new(0, bp.Size.Y/2 + 4, 0)
                plotModel = plot
                return true
            end
        end
    end
    local refCF = homeCF or hrp.CFrame
    local myPos = refCF.Position
    local closestPlot, closestBaseplate, closestDist = nil, nil, math.huge
    for _, plot in ipairs(plots:GetChildren()) do
        local bp = plot:FindFirstChild("Baseplate") or plot:FindFirstChildWhichIsA("BasePart", true)
        if bp then
            local d = (bp.Position - myPos).Magnitude
            if d < closestDist then
                closestDist = d; closestPlot = plot; closestBaseplate = bp
            end
        end
    end
    if closestBaseplate then
        cachedPlot = closestPlot
        ranchCF = closestBaseplate.CFrame + Vector3.new(0, closestBaseplate.Size.Y/2 + 4, 0)
        plotModel = closestPlot
        return true
    end
    return false
end

setProgress(55)
task.spawn(function()
    if not lp.Character then lp.CharacterAdded:Wait() end
    for i = 1, 60 do
        if autoLockRanch() then break end
        task.wait(0.5)
    end
end)

task.spawn(function()
    while gui.Parent do
        task.wait(8)
        pcall(autoLockRanch)
    end
end)
setProgress(75)

local MIN_VALUE = 1_000_000_000

local function parseValue(t)
    if not t then return 0 end
    t = tostring(t):upper():gsub("%s",""):gsub(",","")
    local num, suf = t:match("([%d%.]+)([KMBT]?)")
    if not num then return 0 end
    local n = tonumber(num) or 0
    if suf == "K" then return n*1e3 end
    if suf == "M" then return n*1e6 end
    if suf == "B" then return n*1e9 end
    if suf == "T" then return n*1e12 end
    return n
end

-- LIMITED LUCK READER
local luckCache = {}
local function readEggLuck(egg)
    if not egg or not egg.Parent then return "?" end
    if luckCache[egg] then return luckCache[egg] end

    for _, c in ipairs(egg:GetChildren()) do
        if c:IsA("TextLabel") and c.Text ~= "" then
            local n = c.Name:lower()
            if n:find("luck") or n:find("chance") or n:find("value") then
                luckCache[egg] = c.Text; return c.Text
            end
        end
        for _, c2 in ipairs(c:GetChildren()) do
            if c2:IsA("TextLabel") and c2.Text ~= "" then
                local n = c2.Name:lower()
                if n:find("luck") or n:find("chance") or n:find("value") then
                    luckCache[egg] = c2.Text; return c2.Text
                end
            end
            for _, c3 in ipairs(c2:GetChildren()) do
                if c3:IsA("TextLabel") and c3.Text ~= "" then
                    local n = c3.Name:lower()
                    if n:find("luck") or n:find("chance") or n:find("value") then
                        luckCache[egg] = c3.Text; return c3.Text
                    end
                end
            end
        end
    end

    for _, c in ipairs(egg:GetChildren()) do
        if c:IsA("TextLabel") and c.Text ~= "" then
            local t = c.Text:lower()
            if (t:find("%%") or t:find("k") or t:find("m") or t:find("b") or t:find("t"))
               and not t:find("player") and #c.Text < 20 then
                luckCache[egg] = c.Text; return c.Text
            end
        end
    end

    return "?"
end

local function getPos(o)
    if o:IsA("BasePart") then return o.Position end
    if o:IsA("Model") and o.PrimaryPart then return o.PrimaryPart.Position end
    local p = o:FindFirstChildWhichIsA("BasePart", true)
    return p and p.Position
end

-- FAST PLAYER/NPC CHECK
local playerChars = {}
task.spawn(function()
    while gui.Parent do
        playerChars = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character then playerChars[p.Character] = true end
        end
        task.wait(5)
    end
end)

local function isPlayerOrNPC(obj)
    if playerChars[obj] then return true end
    if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then return true end
    return false
end

-- FAST PLOT CHECK
local function isOnPlot(obj)
    local par = obj.Parent
    local depth = 0
    while par and par ~= workspace and depth < 6 do
        local n = par.Name:lower()
        if n == "plots" or n == "plot" or n:match("^plot%d") or n:match("^ranch%d") then 
            return true 
        end
        par = par.Parent
        depth = depth + 1
    end
    return false
end

-- FAST EGG COLLECTION
local function collectEggs()
    local out, seen = {}, {}
    local function add(o)
        if o and not seen[o] and o.Parent then 
            seen[o] = true; table.insert(out, o) 
        end
    end
    local re = workspace:FindFirstChild("RenderedEggs")
    if re then 
        for _,v in ipairs(re:GetChildren()) do 
            add(v)
        end 
    end
    if #out == 0 then
        local ef = workspace:FindFirstChild("Eggs")
        if ef then 
            for _,v in ipairs(ef:GetChildren()) do 
                if not isOnPlot(v) then add(v) end 
            end 
        end
    end
    return out
end

local function getCurrentEggs()
    local list = {}
    for _,v in ipairs(collectEggs()) do
        local p = v:FindFirstChildWhichIsA("ProximityPrompt", true)
        if p and p.Enabled and p.Parent then
            local luckText = readEggLuck(v)
            table.insert(list, {egg=v, prompt=p, name=v.Name, luckText=luckText, num=parseValue(luckText)})
        end
    end
    table.sort(list, function(a,b) return a.num > b.num end)
    return list
end

local espCache = {}
local function buildESP(part, color)
    local hl = Instance.new("Highlight")
    hl.Adornee = part
    hl.FillColor = color
    hl.FillTransparency = 0.75
    hl.OutlineTransparency = 0.4
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = espEggFolder
    local bb = Instance.new("BillboardGui")
    bb.Adornee = part
    bb.Size = UDim2.new(0, 140, 0, 36)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.LightInfluence = 0
    bb.MaxDistance = 100000
    bb.Parent = espEggFolder
    local nameL = Instance.new("TextLabel", bb)
    nameL.Size = UDim2.new(1, 0, 0.5, 0)
    nameL.BackgroundTransparency = 1
    nameL.TextColor3 = Color3.new(1,1,1)
    nameL.TextStrokeTransparency = 0.4
    nameL.Font = Enum.Font.GothamBold
    nameL.TextSize = 12
    local valL = Instance.new("TextLabel", bb)
    valL.Size = UDim2.new(1, 0, 0.5, 0)
    valL.Position = UDim2.new(0, 0, 0.5, 0)
    valL.BackgroundTransparency = 1
    valL.TextColor3 = Color3.fromRGB(140,255,140)
    valL.TextStrokeTransparency = 0.4
    valL.Font = Enum.Font.Code
    valL.TextSize = 11
    return {hl=hl, bb=bb, nameL=nameL, valL=valL, lastText=nil, lastColor=nil}
end

local function clearAllESP()
    for part, data in pairs(espCache) do
        if data.hl then data.hl:Destroy() end
        if data.bb then data.bb:Destroy() end
    end
    espCache = {}
end

task.spawn(function()
    while gui.Parent do
        if espEggOn then
            local liveParts = {}
            for _,egg in ipairs(collectEggs()) do
                local part = egg:IsA("BasePart") and egg or egg:FindFirstChildWhichIsA("BasePart", true)
                if part and part.Parent then
                    liveParts[part] = true
                    local luckText = readEggLuck(egg)
                    local val = parseValue(luckText)
                    local color = Color3.fromRGB(200,200,220)
                    if val >= 1e12 then color = Color3.fromRGB(255,60,60)
                    elseif val >= 1e9 then color = Color3.fromRGB(255,150,60)
                    elseif val >= 1e6 then color = Color3.fromRGB(255,220,60)
                    elseif val >= 1e3 then color = Color3.fromRGB(80,255,120) end
                    local c = espCache[part]
                    if not c then
                        c = buildESP(part, color)
                        c.nameL.Text = "🥚 "..egg.Name
                        c.valL.Text = "🍀 "..luckText
                        c.valL.TextColor3 = color
                        c.lastText = luckText; c.lastColor = color
                        espCache[part] = c
                    else
                        if c.lastText ~= luckText then c.valL.Text = "🍀 "..luckText; c.lastText = luckText end
                        if c.lastColor ~= color then c.hl.FillColor = color; c.valL.TextColor3 = color; c.lastColor = color end
                    end
                end
            end
            for part, data in pairs(espCache) do
                if not liveParts[part] or not part.Parent then
                    if data.hl then data.hl:Destroy() end
                    if data.bb then data.bb:Destroy() end
                    espCache[part] = nil
                end
            end
        else
            if next(espCache) then clearAllESP() end
        end
        task.wait(6)
    end
end)

local eHeld = false
local function startE()
    if eHeld then return end
    eHeld = true
    pcall(function() VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game) end)
    task.spawn(function()
        while eHeld do
            pcall(function() VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game) end)
            task.wait(0.1)
        end
    end)
end
local function stopE()
    eHeld = false
    task.wait(0.04)
    pcall(function() VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game) end)
end

local GLIDE_SPEED = 635

local function glideTo(hrp, targetPos, speed)
    speed = speed or GLIDE_SPEED
    if not hrp or not hrp.Parent then return false end
    pcall(function() hrp:SetNetworkOwner(lp) end)
    pcall(function() hrp.Anchored = false end)
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = Vector3.zero
    bv.Parent = hrp
    local bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.P = 5000
    bg.CFrame = hrp.CFrame
    bg.Parent = hrp
    local lastPos = hrp.Position
    local stuckTime = 0
    while hrp.Parent do
        pcall(function() hrp:SetNetworkOwner(lp) end)
        local myPos = hrp.Position
        local dir = targetPos - myPos
        local dist = dir.Magnitude
        if dist < 6 then break end
        local curSpeed = speed
        if dist < 60 then curSpeed = math.max(speed * (dist / 60), 30) end
        bv.Velocity = dir.Unit * curSpeed
        bg.CFrame = CFrame.new(myPos, myPos + dir.Unit)
        if (myPos - lastPos).Magnitude < 1 then
            stuckTime = stuckTime + 0.06
            if stuckTime > 5 then
                hrp.CFrame = CFrame.new(targetPos)
                break
            end
        else
            stuckTime = 0
            lastPos = myPos
        end
        task.wait(0.06)
    end
    bv.Velocity = Vector3.zero
    pcall(function()
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.Velocity = Vector3.zero
        hrp.RotVelocity = Vector3.zero
    end)
    bv:Destroy()
    bg:Destroy()
    task.wait(0.03)
    return true
end

-- STRONG CARRYING CHECK
local function isCarryingEgg(char)
    if not char then return false, "no char" end
    for _, ch in ipairs(char:GetChildren()) do
        if (ch:IsA("Model") or ch:IsA("Tool")) and ch.Name:lower():find("egg") then
            return true, ch.Name
        end
    end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and tool.Name:lower():find("pet") then
            for _, child in ipairs(tool:GetDescendants()) do
                if child.Name:lower():find("egg") then return true, child.Name end
            end
        end
    end
    for _, ch in ipairs(char:GetDescendants()) do
        if (ch:IsA("Model") or ch:IsA("Tool")) and ch.Name:lower():find("egg") then
            return true, ch.Name
        end
    end
    return false, "none"
end

-- STRONG DROP
local function dropEgg()
    local char = lp.Character
    if not char then return false end
    local holding = isCarryingEgg(char)
    if not holding then return false end

    for i = 1, 5 do
        pcall(function()
            if dropRemote then dropRemote:FireServer() end
            if basketRemote then basketRemote:FireServer() end
            if eggPlacedRemote then eggPlacedRemote:FireServer() end
        end)
        task.wait(0.1)
    end

    for i = 1, 3 do
        pcall(function() VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game) end)
        task.wait(0.05)
        pcall(function() VIM:SendKeyEvent(false, Enum.KeyCode.Q, false, game) end)
        task.wait(0.15)
    end

    return not isCarryingEgg(char)
end

-- SUPER STRONG PICKUP
local function tryPickup(target)
    if not target or not target.Parent then return false end

    local prompt = target:FindFirstChildWhichIsA("ProximityPrompt", true)
    if not prompt then
        for _, c in ipairs(target:GetDescendants()) do
            if c:IsA("ProximityPrompt") then prompt = c; break end
        end
    end

    if prompt then
        pcall(function()
            prompt.HoldDuration = 0
            prompt.MaxActivationDistance = math.huge
            prompt.RequiresLineOfSight = false
            prompt.Enabled = true
            prompt:InputHoldBegin()
            task.wait(0.05)
            prompt:InputHoldEnd()
        end)
        pcall(function() fireproximityprompt(prompt) end)
        task.wait(0.05)
        pcall(function() fireproximityprompt(prompt) end)
    end

    startE()
    task.wait(0.5)
    stopE()
    task.wait(0.1)

    if target.Parent and prompt then
        local part = prompt.Parent
        if part and part:IsA("BasePart") then
            local cam = workspace.CurrentCamera
            local screenPos, onScreen = cam:WorldToViewportPoint(part.Position)
            if onScreen then
                pcall(function()
                    VIM:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, true, game, 0)
                    task.wait(0.05)
                    VIM:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, false, game, 0)
                end)
            end
        end
    end

    task.wait(0.2)
    return (not target.Parent)
end

local function findNearestPrompt(hrp, maxDist)
    maxDist = maxDist or 50
    local best, bestDist = nil, maxDist
    local re = workspace:FindFirstChild("RenderedEggs")
    if not re then re = workspace:FindFirstChild("Eggs") end
    if not re then return nil end

    for _, v in ipairs(re:GetChildren()) do
        local p = nil
        for _, c in ipairs(v:GetChildren()) do
            if c:IsA("ProximityPrompt") then p = c; break end
        end
        if p and p.Enabled then
            local par = p.Parent
            if par and par:IsA("BasePart") then
                local d = (par.Position - hrp.Position).Magnitude
                if d < bestDist then bestDist = d; best = p end
            end
        end
    end
    return best
end

local FENCE_OFFSET = 20
local HOVER_HEIGHT = 8

local function getDropPos(hrp, ranchCF, plotModel)
    local halfX, halfZ = 40, 40
    if plotModel then
        local bp = plotModel:FindFirstChild("Baseplate")
            or plotModel:FindFirstChildWhichIsA("BasePart", true)
        if bp then
            halfX = bp.Size.X / 2
            halfZ = bp.Size.Z / 2
        end
    end
    local dropX = halfX + FENCE_OFFSET
    local dropZ = halfZ + FENCE_OFFSET

    local myPos = hrp.Position
    local dx = myPos.X - ranchCF.Position.X
    local dz = myPos.Z - ranchCF.Position.Z

    local dropPos
    if math.abs(dx) > math.abs(dz) then
        local sign = dx > 0 and 1 or -1
        dropPos = ranchCF.Position + Vector3.new(sign * dropX, HOVER_HEIGHT, 0)
    else
        local sign = dz > 0 and 1 or -1
        dropPos = ranchCF.Position + Vector3.new(0, HOVER_HEIGHT, sign * dropZ)
    end
    return dropPos
end

local DROP_WAIT = 2.5

-- SAFE FENCE DROP (no fall)
local function safeGlideAndDrop(hrp, dropPos)
    if not hrp or not hrp.Parent then return false end
    glideTo(hrp, dropPos, GLIDE_SPEED)
    task.wait(0.05)

    local lockedCF = hrp.CFrame

    local holdBV = Instance.new("BodyVelocity")
    holdBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    holdBV.Velocity = Vector3.new(0, 8, 0)
    holdBV.Parent = hrp
    local holdBG = Instance.new("BodyGyro")
    holdBG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    holdBG.P = 10000
    holdBG.D = 1000
    holdBG.CFrame = hrp.CFrame
    holdBG.Parent = hrp

    pcall(function()
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.Velocity = Vector3.zero
        hrp.RotVelocity = Vector3.zero
    end)

    local lockActive = true
    task.spawn(function()
        while lockActive and hrp.Parent do
            pcall(function()
                hrp.CFrame = CFrame.new(lockedCF.Position)
                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                hrp.Velocity = Vector3.new(0, 0, 0)
            end)
            task.wait(0.03)
        end
    end)

    task.wait(0.15)

    local dropped = false
    for i = 1, 3 do
        dropped = dropEgg()
        if dropped then break end
        task.wait(0.35)
    end

    task.wait(0.25)
    lockActive = false
    task.wait(0.05)
    holdBV.Velocity = Vector3.zero
    holdBV:Destroy()
    holdBG:Destroy()
    task.wait(0.05)
    return dropped
end

local function doFullFlow(egg, prompt)
    if not egg or not egg.Parent then return false end
    local char = lp.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    local eggPos = getPos(egg)
    if not eggPos then return false end
    if not ranchCF then return false end

    glideTo(hrp, eggPos + Vector3.new(0, 3, 0), GLIDE_SPEED)
    if not egg.Parent then return false end

    local carrying = false
    for attempt = 1, 3 do
        if not egg.Parent then break end
        status.Text = "● Pickup "..attempt.."/3..."
        tryPickup(egg)
        task.wait(0.2)
        carrying = isCarryingEgg(char)
        if carrying then break end
        if egg.Parent then
            local p = getPos(egg)
            if p then glideTo(hrp, p + Vector3.new(0, 3, 0), GLIDE_SPEED) end
        end
        task.wait(0.2)
    end
    if not carrying then
        status.Text = "● ❌ Pickup failed"
        return false
    end

    status.Text = "● Gliding to fence (20 out)..."
    local dropPos = getDropPos(hrp, ranchCF, plotModel)
    local dropped = safeGlideAndDrop(hrp, dropPos)
    if not dropped then
        status.Text = "● ❌ Drop failed"
        return false
    end

    status.Text = "● Waiting "..DROP_WAIT.."s..."
    task.wait(DROP_WAIT)

    local carrying2 = false
    for attempt = 1, 3 do
        status.Text = "● Re-pickup "..attempt.."/3..."
        local rePrompt = findNearestPrompt(hrp, 50)
        if rePrompt then
            pcall(function()
                rePrompt.HoldDuration = 0
                rePrompt.MaxActivationDistance = math.huge
                rePrompt.RequiresLineOfSight = false
                rePrompt.Enabled = true
                rePrompt:InputHoldBegin()
                task.wait(0.2)
                rePrompt:InputHoldEnd()
            end)
            pcall(function() fireproximityprompt(rePrompt) end)
        end
        task.wait(0.1)
        startE()
        task.wait(0.8)
        stopE()
        carrying2 = isCarryingEgg(char)
        if carrying2 then break end
        task.wait(0.3)
    end
    if not carrying2 then
        status.Text = "● ❌ Re-pickup failed"
        return false
    end

    status.Text = "● Gliding home..."
    glideTo(hrp, ranchCF.Position, GLIDE_SPEED)
    status.Text = "● ✅ Delivered!"
    return true
end

local active = false
local loopRunning = false

local function stealLoop()
    if loopRunning then return end
    loopRunning = true

    local espWasOn = espEggOn
    espEggOn = false
    clearAllESP()

    while active and gui.Parent do
        if not ranchCF then task.wait(0.2) continue end
        local list = getCurrentEggs()
        if #list == 0 then
            status.Text = "● Waiting for 1B+ egg..."
            task.wait(0.4)
            continue
        end
        local best = nil
        for _,e in ipairs(list) do
            if e.num >= MIN_VALUE and e.egg and e.egg.Parent then
                best = e; break
            end
        end
        if not best then
            status.Text = "● Waiting for 1B+ egg..."
            task.wait(0.4)
            continue
        end
        status.Text = "● 🏆 Stealing: "..best.name
        local ok = false
        pcall(function() ok = doFullFlow(best.egg, best.prompt) end)
        if ok then
            task.wait(0.5)
        else
            task.wait(0.4)
        end
    end

    espEggOn = espWasOn
    loopRunning = false
end

local hatchActive = false
local function fireHatchPrompts()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return end
    for _,p in ipairs(plots:GetChildren()) do
        for _,d in ipairs(p:GetDescendants()) do
            if d:IsA("ProximityPrompt") then
                local a = (d.ActionText or ""):lower()
                local o = (d.ObjectText or ""):lower()
                if a:find("hatch") or a:find("open") or o:find("hatch") or o:find("egg") then
                    d.HoldDuration = 0
                    d.MaxActivationDistance = math.huge
                    pcall(fireproximityprompt, d)
                end
            end
        end
    end
end
local function hatchLoop() while hatchActive and gui.Parent do fireHatchPrompts(); task.wait(0.5) end end

local buyActive = false
local function buyOnce()
    local G = RS.Remotes and RS.Remotes:FindFirstChild("Game")
    if not G then return end
    local P = G:FindFirstChild("Plot")
    if not P then return end
    local up = P:FindFirstChild("Upgrades")
    if up then pcall(function() up:FireServer() end) end
end
local function buyLoop() while buyActive and gui.Parent do buyOnce(); status.Text = "● 💰 Buying..."; task.wait(0.2) end end

-- VOLCANIC FINDERS
local function findVolcanoCave()
    for _, v in ipairs(workspace:GetChildren()) do
        local n = (v.Name or ""):lower()
        if n:find("volcan") and (n:find("cave") or n:find("entrance") or n:find("tunnel") or n:find("zone") or n:find("area")) then
            return v
        end
    end
    for _, v in ipairs(workspace:GetChildren()) do
        if v:IsA("Model") or v:IsA("Folder") then
            local n = (v.Name or ""):lower()
            if n:find("cave") or n:find("volcan") then return v end
        end
    end
    for _, folder in ipairs(workspace:GetChildren()) do
        if folder:IsA("Folder") or folder:IsA("Model") then
            for _, v in ipairs(folder:GetChildren()) do
                local n = (v.Name or ""):lower()
                if n:find("volcan") and n:find("cave") then return v end
            end
        end
    end
    return nil
end

local function getCaveCenter(cave)
    if not cave then return nil end
    local part = cave:IsA("BasePart") and cave or cave:FindFirstChildWhichIsA("BasePart", true)
    if not part then return nil end
    return part.Position
end

local function findVolcanicEgg()
    local containers = {
        workspace:FindFirstChild("RenderedEggs"),
        workspace:FindFirstChild("Eggs"),
    }
    for _, cont in ipairs(containers) do
        if cont then
            for _, v in ipairs(cont:GetChildren()) do
                local n = (v.Name or ""):lower()
                if (n:find("volcan") or n:find("lava") or n:find("magma")) and n:find("egg") then
                    return v
                end
            end
        end
    end
    local cave = findVolcanoCave()
    if cave then
        for _, v in ipairs(cave:GetDescendants()) do
            local n = (v.Name or ""):lower()
            if (n:find("volcan") or n:find("lava") or n:find("magma")) and n:find("egg") then
                return v
            end
        end
    end
    return nil
end

local volcanoActive = false
local volcanoRunning = false

local function volcanicCycle()
    if not volcanoActive or volcanoRunning or not ranchCF then return end
    volcanoRunning = true

    local char = lp.Character
    if not char then volcanoRunning = false; return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then volcanoRunning = false; return end

    local cave = findVolcanoCave()
    local VE = findVolcanicEgg()
    if not VE then
        status.Text = "🌋 No volcanic egg found"
        volcanoRunning = false
        task.wait(1)
        return
    end

    local eggPos = getPos(VE)
    if not eggPos then volcanoRunning = false; return end

    status.Text = "🌋 Entering volcano cave..."
    glideTo(hrp, eggPos + Vector3.new(0, 3, 0), GLIDE_SPEED)
    task.wait(0.1)

    status.Text = "🌋 Picking up volcanic egg..."
    local carrying = false
    for attempt = 1, 3 do
        if not VE.Parent then break end
        tryPickup(VE)
        task.wait(0.2)
        carrying = isCarryingEgg(char)
        if carrying then break end
        if VE.Parent then
            local p = getPos(VE)
            if p then glideTo(hrp, p + Vector3.new(0, 3, 0), GLIDE_SPEED) end
        end
        task.wait(0.2)
    end

    if not carrying then
        status.Text = "🌋 ❌ Pickup failed"
        volcanoRunning = false
        task.wait(1)
        return
    end

    status.Text = "🌋 Escaping volcano..."
    if cave then
        local caveCenter = getCaveCenter(cave)
        if caveCenter then
            local escapePos = caveCenter + Vector3.new(0, 120, 0)
            glideTo(hrp, escapePos, GLIDE_SPEED)
            task.wait(0.15)
        end
    end

    status.Text = "🌋 Flying to fence (20 out)..."
    local dropPos = getDropPos(hrp, ranchCF, plotModel)
    safeGlideAndDrop(hrp, dropPos)

    status.Text = "🌋 Waiting 2s at fence..."
    task.wait(2)

    local carrying2 = false
    for attempt = 1, 2 do
        status.Text = "🌋 Re-pickup "..attempt.."/2..."
        local rePrompt = findNearestPrompt(hrp, 50)
        if rePrompt then
            pcall(function()
                rePrompt.HoldDuration = 0
                rePrompt.MaxActivationDistance = math.huge
                rePrompt.RequiresLineOfSight = false
                rePrompt.Enabled = true
                rePrompt:InputHoldBegin()
                task.wait(0.2)
                rePrompt:InputHoldEnd()
            end)
            pcall(function() fireproximityprompt(rePrompt) end)
        end
        task.wait(0.1)
        startE()
        task.wait(0.8)
        stopE()
        carrying2 = isCarryingEgg(char)
        if carrying2 then break end
        task.wait(0.3)
    end

    if not carrying2 then
        status.Text = "🌋 ❌ Re-pickup failed"
        volcanoRunning = false
        task.wait(1)
        return
    end

    status.Text = "🌋 Gliding home..."
    glideTo(hrp, ranchCF.Position, GLIDE_SPEED)
    status.Text = "🌋 ✅ Delivered!"
    volcanoRunning = false
end

task.spawn(function()
    while gui.Parent do
        local list = getCurrentEggs()
        if #list == 0 then eggList.Text = "○ no eggs"
        else
            local txt = ""
            for i = 1, math.min(3, #list) do
                local e = list[i]
                txt = txt .. "· " .. e.name .. " — 🍀 " .. e.luckText .. "\n"
            end
            eggList.Text = txt
        end
        task.wait(6)
    end
end)

btn.MouseButton1Click:Connect(function()
    if active then
        active = false
        btn.Text = "⚡ STEAL 1B+"
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45,20,90)}):Play()
        status.Text = "● Steal off"
    else
        if not ranchCF then status.Text = "● Plot not ready..."; return end
        active = true
        btn.Text = "⚡ STEAL 1B+: ON"
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(20,120,40)}):Play()
        task.spawn(stealLoop)
    end
end)

hatchBtn.MouseButton1Click:Connect(function()
    hatchActive = not hatchActive
    hatchBtn.Text = hatchActive and "🥚 AUTO HATCH: ON" or "🥚 AUTO HATCH"
    TweenService:Create(hatchBtn, TweenInfo.new(0.2), {BackgroundColor3 = hatchActive and Color3.fromRGB(20,120,40) or Color3.fromRGB(20,60,80)}):Play()
    if hatchActive then task.spawn(hatchLoop) end
end)

buyBtn.MouseButton1Click:Connect(function()
    buyActive = not buyActive
    buyBtn.Text = buyActive and "💰 BUY: ON" or "💰 AUTO BUY HATCH LUCK"
    TweenService:Create(buyBtn, TweenInfo.new(0.2), {BackgroundColor3 = buyActive and Color3.fromRGB(20,120,40) or Color3.fromRGB(80,60,10)}):Play()
    if buyActive then task.spawn(buyLoop) end
end)

espEggBtn.MouseButton1Click:Connect(function()
    espEggOn = not espEggOn
    espEggBtn.Text = espEggOn and "👁 EGG ESP: ON" or "👁 EGG ESP: OFF"
    TweenService:Create(espEggBtn, TweenInfo.new(0.2), {BackgroundColor3 = espEggOn and Color3.fromRGB(20,120,40) or Color3.fromRGB(60,30,30)}):Play()
    if not espEggOn then clearAllESP() end
end)

volcanoBtn.MouseButton1Click:Connect(function()
    volcanoActive = not volcanoActive
    if volcanoActive then
        volcanoBtn.Text = "🌋 VOLCANIC: ON"
        TweenService:Create(volcanoBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(20,120,40)}):Play()
        task.spawn(function()
            while volcanoActive and gui.Parent do
                volcanicCycle()
                task.wait(0.3)
            end
        end)
    else
        volcanoBtn.Text = "🌋 AUTO VOLCANIC EGG"
        TweenService:Create(volcanoBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(90,25,15)}):Play()
    end
end)

task.spawn(function()
    task.wait(1)
    setProgress(85)
    task.wait(1)
    setProgress(95)
    task.wait(1.5)
    setProgress(100)
    task.wait(0.6)
    TweenService:Create(overlay, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
    TweenService:Create(loader, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
    TweenService:Create(lStroke, TweenInfo.new(0.6), {Transparency = 1}):Play()
    TweenService:Create(star, TweenInfo.new(0.6), {TextTransparency = 1, Rotation = 180}):Play()
    TweenService:Create(lTitle, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
    TweenService:Create(lSub, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
    TweenService:Create(barBG, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
    TweenService:Create(barFill, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()
    TweenService:Create(pct, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
    TweenService:Create(ringStroke, TweenInfo.new(0.6), {Transparency = 1}):Play()
    task.wait(0.7)
    overlay:Destroy()
    main.Visible = true
    TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 260, 0, 390)
    }):Play()
end)

print("[Zenith Premium] Loaded ✦ v107 — No failed pickup + zero lag")
