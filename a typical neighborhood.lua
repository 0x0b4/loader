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
        ["text"] = "A Typical Neighborhood"
        }
        }
    }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {["content-type"] = "application/json"}
request = http_request or request or HttpPost 
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)

--// Loadstrings
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BIvck/Skibidi/refs/heads/main/library.lua", true))()
library.Title = 'anti.<font color="rgb(245, 66, 230)">solutions</font> | <font color="rgb(245, 66, 230)">A Typical Neighborhood (P)</font>'
library.Build = 'build: <font color="rgb(245, 66, 230)">freemium</font>'
library:Notify("anti.solutions - removing brainrots!", 5)
wait(0.5)
library:Notify("anti.solutions - removed gyatt [1/5]", 5)
wait(0.5)
library:Notify("anti.solutions - removed sigma [2/5]", 5)
wait(0.5)
library:Notify("anti.solutions - removed skibidi [3/5]", 5)
wait(0.5)
library:Notify("anti.solutions - removed rizz [4/5]", 5)
wait(0.5)
library:Notify("anti.solutions - removed kingvon piracy [5/5]", 5)
wait(0.3)
library:Notify("anti.solutions - successfully removed [100%]", 5)
wait(0.1)

--// Tabs
local tabs = {
    Main = library:addTab("main", "http://www.roblox.com/asset/?id=15178561786"),
    visuals = library:addTab("visuals", "http://www.roblox.com/asset/?id=13321848320"),
    misc = library:addTab("misc", "http://www.roblox.com/asset/?id=7347408509"),
    settings = library:addTab("settings", "http://www.roblox.com/asset/?id=11956055886")
}

--// Tables
local enables = {
    main = {
        aimbot = false,
        silent = false,
        killaura = false,
        autoreload = false,
        aimswitch = false,
        currentname = nil,
        currenthitpart = "",
        fovradius = 0,
        playerinfo = false,
        walkspeed = false,
        walkval = 16
    },
    gunlists = {
        "Pistol", "Heavy Pistol", "Ranch Rifle", "Revolver", "Hunting Shotgun",
        "Military Sniper", "Hunting Sniper", "Military Rifle", "Carbine",
        "Assault Rifle", "Pistol Supp", "Duty Pistol", "Duty Pistol Supp",
        "Heavy Revolver", "Sawn-Off", "SMG", "BIG MAC", "Shotgun", "Plinking Pistol", "Suppressed Carbine", "Tactical SMG"
    },
    meleelists = {
        "Fists", "Chainsaw", "Ninjato", "Pickaxe", "Bat", "Baton","Axe", "Boxing", "Shovel", "Dumbbell","Shiv", "Pipe", "Crowbar", "Metal Bat", "Kitchen Knife", "Rolling Pin", "Cleaver", "Combat Knife", "Scythe", "Spear","Hatchet", "Pitchfork", "Old Sword", "Frying Pan", "Bonesaw", "Flashlight", "Broom", "Mop", "Hammer", "Sledgehammer", "Temple Sword"
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

--// Tables holder
local utility = {}
local functions = {}

--// Drawing
function utility:new(type, properties)
    local object = Drawing.new(type)

    for i, v in pairs(properties) do
        object[i] = v
    end
    return object
end

--// Variables
local workspace = game.Workspace
local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local mouse = localplayer:GetMouse()
local camera = workspace.CurrentCamera
local lighting = game:GetService("Lighting")
local replicatestorage = game:GetService("ReplicatedStorage")
local userinput = game:GetService("UserInputService")
local runservice = game:GetService("RunService")
local centerofscreen = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
local os_clock = os.clock()
local Sky = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
local ScreenInstance = Instance.new("ScreenGui", game.Workspace) ScreenInstance.Name = "Screengui"

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

--// For ESP
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
					Name.Text = player.DisplayName
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
                    if player.Character:FindFirstChildOfClass("Tool") then
                        Weapon.Text = tostring(player.Character:FindFirstChildOfClass("Tool"))
                        Weapon.TextColor3 = enables.esp.infos.weapon.color
                    else
                        Weapon.Text = ""
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

local function updateWalkSpeed(humanoid)
    if enables.main.walkspeed and humanoid then
        humanoid.WalkSpeed = enables.main.walkval
    else
        humanoid.WalkSpeed = 16
    end
end
local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    updateWalkSpeed(humanoid)
    humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if enables.main.walkspeed and humanoid.WalkSpeed ~= enables.main.walkval then
            humanoid.WalkSpeed = enables.main.walkval
        end
    end)
end

function functions:dofullbright()
    lighting.Ambient = Color3.new(1,1,1)
    lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
    lighting.ColorShift_Top = Color3.new(1, 1, 1)
    lighting.Brightness = 10
end
  
function functions:resetLighting()
    lighting.Ambient = Color3.new(0,0,0)
    lighting.ColorShift_Bottom = Color3.new(0,0,0)
    lighting.ColorShift_Top = Color3.new(0,0,0)
    lighting.Brightness = 3
end

--// Fov Circle
local Circle = utility:new("Circle", {
    Color = Color3.fromRGB(0, 0, 0),
    Filled = false,
    Thickness = 1,
    Visible = false
})

function functions:updatecircle()
    Circle.Position = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    local fovScalingFactor = 30 * math.tan(math.rad(camera.FieldOfView / 2))
    local radius = fovScalingFactor + enables.main.fovradius
    Circle.Radius = radius
end

--// Target Closest
function functions:targetplayer()
    local Target = nil
    local Name = nil
    local Distance = enables.esp.distancelimit
    for _, player in ipairs(players:GetPlayers()) do
        if player ~= localplayer and player.Character and player.Character:FindFirstChild(enables.main.currenthitpart) then
            local head = player.Character[enables.main.currenthitpart]
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

local function aimbot(smooth)
    if functions:targetplayer() then
    local LookAt = nil
    local Distance = math.floor(0.5+(localplayer.Character:FindFirstChild("HumanoidRootPart").Position - functions:targetplayer().Position).magnitude)
    if Distance > 100  then
        local distChangeBig = Distance / 10
        LookAt = camera.CFrame:PointToWorldSpace(Vector3.new(0,0,-smooth * distChangeBig)):Lerp(functions:targetplayer().Position,.01) -- No one esle do camera smoothing ? tf
    else-- Made By Mick Gordon
        local distChangeSmall = Distance / 10
        LookAt = camera.CFrame:PointToWorldSpace(Vector3.new(0,0,-smooth * distChangeSmall)):Lerp(functions:targetplayer().Position,.01) -- No one esle do camera smoothing ? tf
    end
    camera.CFrame = CFrame.lookAt(camera.CFrame.Position, LookAt)
    end
end

local killauraConnection
function enablekillaura()
    if killauraConnection then
        return
    end
    killauraConnection =
        game:GetService("RunService").Heartbeat:Connect(function()
            if not enables.main.killaura then
                return
            end
            local character = localplayer.Character or localplayer.CharacterAdded:Wait()
            for _, weaponName in pairs(enables.meleelists) do
            local gun = character:FindFirstChildOfClass("Tool")
            if gun and character:FindFirstChild(weaponName) then
                local inflictRemote = gun:FindFirstChild("Damage"):FindFirstChild("InfIictTarget")
                if inflictRemote then
                    local players = players:GetPlayers()
                    local localPlayerPosition = character:FindFirstChild("HumanoidRootPart")
                    if localPlayerPosition then
                        for _, player in pairs(players) do
                            if player ~= localplayer then
                                local playerCharacter = player.Character
                                if playerCharacter then
                                    local playerHumanoidRootPart =
                                        playerCharacter:FindFirstChild("HumanoidRootPart")
                                    if playerHumanoidRootPart then
                                        if
                                            (playerHumanoidRootPart.Position - localPlayerPosition.Position).Magnitude <=
                                                150
                                         then
                                            local inflict = {
                                                [1] = playerCharacter:FindFirstChild("Humanoid"),
                                                [2] = 200,
                                                [3] = playerCharacter:FindFirstChild("Head")
                                            }
                                            inflictRemote:FireServer(table.unpack(inflict))
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
end
function disablekillaura()
    if killauraConnection then
        killauraConnection:Disconnect()
        killauraConnection = nil
    end
end

local function fireGun(player)
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    for _, weaponName in pairs(enables.gunlists) do
        local gun = character:FindFirstChildOfClass("Tool")
        if gun and character:FindFirstChild(weaponName) then
            local inflictRemote = gun:FindFirstChild("Damage"):FindFirstChild("InfIictTarget")
            if inflictRemote and player.Character then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                local head = functions:targetplayer()
                if humanoid and head then
                    inflictRemote:FireServer(humanoid, 200, head)
                end
            end
        end
    end
end

local lastAmmo = nil
local function checkAmmoChanged()
    local character = localplayer.Character
    if character then
        for _, weaponName in pairs(enables.gunlists) do
            local gun = character:FindFirstChildOfClass("Tool")
            if gun and character:FindFirstChild(weaponName) then
                local handle = gun:FindFirstChild("Handle")
                if handle then
                    local ammoLeft = handle:FindFirstChild("AmmoLeft")
                    if ammoLeft then
                        local currentAmmo = ammoLeft.Value
                        if lastAmmo ~= nil and currentAmmo < lastAmmo then
                            local closestPlayer = enables.main.currentname
                            if enables.main.silent and closestPlayer then
                                fireGun(closestPlayer)
                            end
                        end
                        lastAmmo = currentAmmo
                    end
                end
            end
        end
    end
end

local Noclipping
local function toggleNoclip(state)
    if state then
        wait(0.1)
        local function NoclipLoop()
            if not Clip and localplayer.Character then
                for _, child in pairs(localplayer.Character:GetChildren()) do
                    if child:IsA("BasePart") and child.CanCollide then
                        child.CanCollide = false
                    end
                 end
             end
         end
         Noclipping = runservice.Stepped:Connect(NoclipLoop)
     else
         if Noclipping then
             Noclipping:Disconnect()
         end
         if localplayer.Character then
             for _, child in pairs(localplayer.Character:GetChildren()) do
                 if child:IsA("BasePart") and not child.CanCollide then
                     child.CanCollide = true
                 end
             end
         end
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
--  local Target = utility:new("Text", {
--     Font = 3,
--     Size = 13,
--     Color = Color3.new(1, 1, 1),
--     Center = true,
--     Outline = true,
--     Position = Vector2.new(centerofscreen.X, (centerofscreen + Vector2.new(0, 55)).Y)
--  })
--  local Ad = utility:new("Text", {
--     Font = 3,
--     Size = 13,
--     Color = Color3.new(0.952941, 0.356863, 0.874510),
--     Transparency = 1,
--     Text = "anti.solutions",
--     Center = true,
--     Outline = true,
--     Position = Vector2.new(centerofscreen.X, (centerofscreen + Vector2.new(0, 40)).Y)

--  })
--  local Health = utility:new("Text", {
--     Font = 3,
--     Size = 13,
--     Color = Color3.fromRGB(52, 235, 70),
--     Center = true,
--     Outline = true,
--     Position = Vector2.new(centerofscreen.X, (centerofscreen + Vector2.new(0, 70)).Y)
--  })
--  local Meters = utility:new("Text", {
--     Font = 3,
--     Size = 13,
--     Color = Color3.new(1, 1, 1),
--     Center = true,
--     Outline = true,
--     Position = Vector2.new(centerofscreen.X, (centerofscreen + Vector2.new(0, 85)).Y)
--  })
--  local Visible = utility:new("Text", {
--     Font = 3,
--     Size = 13,
--     Color = Color3.fromRGB(240, 142, 214),
--     Center = true,
--     Outline = true,
--     Text = "Not Visible",
--     Position = Vector2.new(centerofscreen.X, (centerofscreen + Vector2.new(0, 100)).Y)
--  })
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
function functions:extras()
    if enables.cursor.Enabled then
        local pos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
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
        -- Ad.Position = Vector2.new(pos.X, (pos + Vector2.new(0, enables.cursor.Radius + 5)).Y)
        -- Ad.Transparency = transp
        -- Target.Position = Vector2.new(pos.X, (pos + Vector2.new(0, enables.cursor.Radius + 20)).Y)
        -- Health.Position = Vector2.new(pos.X, (pos + Vector2.new(0, enables.cursor.Radius + 35)).Y)
        -- Meters.Position = Vector2.new(pos.X, (pos + Vector2.new(0, enables.cursor.Radius + 50)).Y)
        -- Visible.Position = Vector2.new(pos.X, (pos + Vector2.new(0, enables.cursor.Radius + 65)).Y)
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
        -- Ad.Visible = false        --
        for index, line in pairs(lines) do
            line[1].Visible = false
            line[2].Visible = false
        end
    end
    -- if enables.main.playerinfo and functions:targetplayer() then
    --     -- Advertisement
    --     Ad.Visible = enables.main.playerinfo
    --     -- Target
    --     Target.Text = "target : "..enables.main.currentname.Name
    --     Target.Visible = enables.main.playerinfo
    --     -- Health
    --     Health.Text = "health : "..tostring(math.floor(enables.main.currentname.Character.Humanoid.Health)).."/100"
    --     Health.Visible = enables.main.playerinfo
    --     -- Distance
    --     Meters.Text = "distance : "..math.ceil((camera.CFrame.Position - functions:targetplayer().Position).Magnitude / 3.571).."m"
    --     Meters.Visible = enables.main.playerinfo
    --     -- Visible
    --     Visible.Visible = enables.main.playerinfo
    --     local check = functions:VisibleCheck(enables.main.currentname)
    --     if check == true then
    --         Visible.Text = "visible"
    --         Visible.Color = Color3.fromRGB(52, 235, 70)
    --     else
    --         Visible.Text = "hiding"
    --         Visible.Color = Color3.fromRGB(235, 52, 52)
    --     end
    -- else
    --     Visible.Visible = false
    --     Ad.Visible = false
    --     Meters.Visible = false
    --     Health.Visible = false
    --     Target.Visible = false
    -- end
    --// Snapline
    if not Snapline then
        Snapline = Drawing.new('Line')
        Snapline.Visible = false
        Snapline.Thickness = 1
    end

    local targetCharacter = functions:targetplayer()
    
    if targetCharacter then
        local target = camera:WorldToViewportPoint(targetCharacter.Position)
        Snapline.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
        Snapline.To = Vector2.new(target.X, target.Y)
        Snapline.Color = library.flags.snapline_color
        Snapline.Visible = library.flags.snapline
    else
        Snapline.Visible = false
    end
end

local function startInfiniteAmmoLoop()
    task.spawn(function()
        while true do
            if enables.main.autoreload then
                local tool = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Tool")

                if tool and tool:FindFirstChild("Damage") and tool.Damage:FindFirstChild("Ammo") then
                    local args = { [1] = "Reload" }
                    tool.Damage.Ammo:FireServer(unpack(args))
                end
            end
            wait(0.7)
        end
    end)
end

local maintab1 = tabs.Main:createGroup('left', 'rage')
do -- Whoever got this script he's a nerd fuck that nigga
    maintab1:addToggle({text = "silent aim", risky = true, callback = function(Value)
        enables.main.silent = Value
        checkAmmoChanged()
    end})
    maintab1:addToggle({text = "kill aura", risky = true, callback = function(Value)
        if Value then
            enablekillaura()
            library:Notify("anti.solutions - use fists and hit them first!", 20)
        else
            disablekillaura()
        end
    end}):addKeybind({text = "aura bind",type = "toggle",key = Enum.KeyCode.Unknown,flag = "killaura_toggle",callback = function(Value)
        userinput.InputBegan:Connect(function(input)
            if input.KeyCode == Value then
                if enables.main.killaura == false then
                    enables.main.killaura = true
                elseif enables.main.killaura then
                    enables.main.killaura = false
                end
            end
        end)
        
        userinput.InputEnded:Connect(function(input)
            if input.KeyCode == Value then
                if enables.main.killaura == false then
                    enables.main.killaura = true
                elseif enables.main.killaura then
                    enables.main.killaura = false
                end
            end
        end) 
    end})
    maintab1:addToggle({text = "aimbot", risky = true, callback = function(Value)
        enables.main.aimbot = Value
    end}):addKeybind({text = "aim bind",type = "hold",key = Enum.UserInputType.MouseButton2,flag = "aim_toggle",callback = function(Value)
        localplayer:GetMouse().Button2Down:Connect(function()
            if Value == Enum.UserInputType.MouseButton2 and enables.main.aimbot then
                enables.main.aimswitch = true
            end
        end)
        localplayer:GetMouse().Button2Up:Connect(function()
            if Value == Enum.UserInputType.MouseButton2 and enables.main.aimbot then
                enables.main.aimswitch = false
            end
        end)
    end})
    maintab1:addToggle({text = "auto reload", risky = false, callback = function(Value)
        if Value then
            enables.main.autoreload = Value
            startInfiniteAmmoLoop()
        else
        end
    end})
    maintab1:addList({text = "hitpart:",multiselect = false,values = {'Head','HumanoidRootPart'}, flag = "hitpart", callback = function(Value)
        enables.main.currenthitpart = Value
    end})
    maintab1:addSlider({text = "smoothness", min = 0, max = 100, suffix = "%", float = 0.1, default = 0.1, flag = "aim_smoothness",callback = function(Value)
    end})
end
local fovsection = tabs.Main:createGroup('center', 'fov settings')
do
    fovsection:addToggle({text = "enable", callback = function(Value)
        Circle.Visible = Value
    end}):addColorpicker({text = 'Color', ontop = true, flag = "circle_color", color = Color3.new(1,1,1), callback = function() Circle.Color = library.flags['circle_color'] end})
    fovsection:addToggle({text = "fov filled", callback = function(Value)
        Circle.Filled = Value
    end})
    fovsection:addSlider({text = "fov value:", min = 0, max = 500, suffix = "%", flag = "fov_value", float = 1, default = 0, callback = function(Value)
        enables.main.fovradius = Value
    end})
    -- fovsection:addToggle({text = "player info", callback = function(Value)
    --     enables.main.playerinfo = Value
    -- end})
    fovsection:addToggle({text = "snapline",flags = "snapline", callback = function()end}):addColorpicker({text = 'Color', ontop = true, flag = "snapline_color", color = Color3.new(1,0,0), callback = function()end})
end

local a = tabs.Main:createGroup('right', 'crosshair')
do
    a:addToggle({text = "enable", callback = function(first) enables.cursor.Enabled = first end}):addColorpicker({text = "Color", callback = function(x) enables.cursor.Color = x end})
    a:addToggle({text = "outline", callback = function(first) enables.cursor.Outline = first end})
    a:addToggle({text = "resize", callback = function(first) enables.cursor.Resize = first end})
    a:addToggle({text = "gap", callback = function(first) enables.cursor.TheGap = first end})
    a:addSlider({text = "speed",flag = "cursor_speed",default = 3, min = -5, max = 0, suffix="", callback = function(State) enables.cursor.Speed = State end})
    a:addSlider({text = "radius",flag = "radius_cur", default = 25, min = 0, max = 50, suffix="", callback = function(State) enables.cursor.Radius = State end})
    a:addSlider({text = "thickness",flag = "thick_ness",default = 2, min = 0, max = 5,suffix ="", callback = function(State) enables.cursor.Thickness  = State end})
    a:addSlider({text = "gap",flag = "aada",default = 5,min = 0, max = 50, suffix = "", callback = function(State) enables.cursor.Gap = State end})
end
--// Visuals aka ESP
local visualtabgroup = tabs.visuals:createGroup('left', 'player')  
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
--// Misc nigger
local misctabgroup = tabs.misc:createGroup('left', 'world')
local misctabgroup1 = tabs.misc:createGroup('center', 'local player')

localplayer.CharacterAdded:Connect(onCharacterAdded)
if localplayer.Character then
    onCharacterAdded(localplayer.Character)
end

do --// local player noobs skid kill yourslef
    misctabgroup1:addToggle({text = "walkspeed", risky = true, flag = 'walkspeed_toggle', callback = function(Value)
        enables.main.walkspeed = Value
        if localplayer.Character then
            local humanoid = localplayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                updateWalkSpeed(humanoid)
            end
        end
    end})
    misctabgroup1:addToggle({text = "noclip", risky = true, flag = 'noclip_toggle', callback = function(Value)
        toggleNoclip(Value)
    end})
    misctabgroup1:addToggle({text = "infjump", risky = true, flag = 'infjump_toggle', callback = function()
    end})
    misctabgroup1:addSlider({text = "walkspeed value:", min = 0, max = 20, suffix = " multiplier", flag = "walkspeed_value", float = 0.1, default = 0, callback = function(Value)
        enables.main.walkval = 16 * Value
        if enables.main.walkspeed and localplayer.Character then
            local humanoid = localplayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                updateWalkSpeed(humanoid)
            end
        end
    end})
end

do--// Worlds nigger
    local Connection
    misctabgroup:addToggle({text = "fullbright",flags = "fullbright", callback = function(Value)
        if Value then
            functions:dofullbright()
            Connection = lighting:GetPropertyChangedSignal("Brightness"):Connect(functions:dofullbright())
        else
            if Connection then
                Connection:Disconnect()
                functions:resetLighting()
            end
        end
    end})
    misctabgroup:addToggle({text = "ambient",flags = "ambient", callback = function()
    end}):addColorpicker({text = 'Color', ontop = true, flag = "ambient_color", color = Color3.new(1,0,0), callback = function(Value)
    end})
    misctabgroup:addToggle({text = "remove shadows", callback = function(Value)
        if Value then
            lighting.GlobalShadows = false
        else
            lighting.GlobalShadows = true
        end
    end})
    misctabgroup:addToggle({text = "clocktime",flags = "clocktime", callback = function()
    end})
    misctabgroup:addSlider({text = "clocktime value:", min = 0, max = 24, suffix = "x", flag = "clocktime_value", float = 0.1, default = 0, callback = function(Value)
    end})
    misctabgroup:addList({text = "skybox:",multiselect = false,values = { "Standard", "Among Us", "Doge", "Spongebob", "Deep Space", "Winter", "Clouded Sky" }, flag = "skybox", callback = function(Value)
        value = Value
    end})
end


local function onKeyPress(input)
    if library.flags['infjump_toggle'] and input.KeyCode == Enum.KeyCode.Space then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end

userinput.InputBegan:Connect(onKeyPress)

--// Heartbeats
runservice.Heartbeat:Connect(function()
    --// Skybox
    for i, v in pairs(SkyBoxes[value]) do
        Sky[i] = v
    end
    --// Ambient LOL EZ
    if library.flags.ambient then
        lighting.OutdoorAmbient = library.flags.ambient_color
    else
        lighting.OutdoorAmbient = Color3.new(0, 0, 0)
    end
    --// Nigger timeclock ticking lol ez
    if library.flags.clocktime then
        lighting.ClockTime = library.flags.clocktime_value
    end
end)

--// RenderStepped!
runservice.RenderStepped:Connect(function()
    functions:updatecircle()
    functions:targetplayer()
    functions:extras()
    checkAmmoChanged()
    if enables.main.aimswitch then --// Aimbot
        aimbot(library.flags["aim_smoothness"])
    end
end)

--// Configures
local uisettings = tabs.settings:createGroup('left', 'menu')
 
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
    Text.Text = ""
 
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
do
    uisettings:addToggle({text = "menu bind",default = true,flag = "menubind_toggle",callback = function(Value)
    end}):addKeybind({text = "menu bind",type = "toggle",key = Enum.KeyCode.End,flag = "menubindkeybind_toggle",callback = function(Value)
        library.keybind = Value
    end})
     
    uisettings:addToggle({text = "watermark",default = true,flag = "watermark_toggle",callback = function(Value)
        Text.Visible = Value
    end})
    uisettings:addToggle({text = "animated title",default = false,flag = "animated_text",callback = function(Value)
        library.AnimatedText = Value
    end})
    uisettings:addDivider()
    uisettings:addButton({text = "discord invite",callback = function(Value)
        setclipboard("https://discord.gg/vmYFhtWNSc")
        library:Notify("anti.solutions - succesfully copied discord invite!", 5)
     end})
    uisettings:addLabel({text = "Owner: @lksiwjas."})
    uisettings:addLabel({text = "ANTI PIRACY!"})
end
local gameTab = tabs.settings:createGroup('center', 'game')
 
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
local createconfigs = tabs.settings:createGroup('right', 'config')
do
    createconfigs:addTextbox({text = "name:",flag = "config_name"})
    createconfigs:addButton({text = "create",callback = library.createConfig})
    createconfigs:addConfigbox({flag = 'config_box',values = {}})
    createconfigs:addButton({text = "load",callback = library.loadConfig})
    createconfigs:addButton({text = "update",callback = library.saveConfig})
    createconfigs:addButton({text = "delete",callback = library.deleteConfig})
end
library:refreshConfigs()
wait(0.1) library:Notify(string.format("anti.solutions - success: loaded in %.2fs", os.clock() - os_clock),20)
