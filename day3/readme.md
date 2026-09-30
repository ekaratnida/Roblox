# Day3

- Students will learn to develop a mini gameplay based on the game objectives. When a player spawn, he needs to escape from zombies, cross unstable bridge, and go to open the door.

## 2.1 simple
```lua
local clickDetector = script.Parent

local function onClicked(player)
	-- Show a message to the player
	print("click")
end

-- Connect the function to the MouseClick event
clickDetector.MouseClick:Connect(onClicked)
```
In class
```lua
local clickDetector = script.Parent

local part = script.Parent.Parent
print(part.Name)

local function whenClicked()
	-- Show a message to the player
	print("click")
	part.Rotation = Vector3.new(0,0,60)
	part.Size = Vector3.new(10,10,10)
end

local function whenHovering()
	-- Show a message to the player
	print("hover")
	part.Color = Color3.new(0.666667, 0, 0)
	part.Material = Enum.Material.Neon
	part.Transparency = 0.8
	
end

local function whenLeaving()
	-- Show a message to the player
	print("leave")
	part.Color = Color3.new(0,0.666667, 0) -- R, G, B
	part.Material = Enum.Material.Neon
	part.Transparency = 0.2
end

-- Connect the function to the MouseClick event
clickDetector.MouseClick:Connect(whenClicked)
clickDetector.MouseHoverEnter:Connect(whenHovering)
clickDetector.MouseHoverLeave:Connect(whenLeaving)
```


## 2.2 ClickDetector

```Lua
--print("Hello world!")
local clickDetector = script.Parent

local function onClicked(player)
	-- Show a message to the player
	local msg = Instance.new("Message")
	msg.Parent = player:FindFirstChild("PlayerGui")
	msg.Text = "Hello, " .. player.Name
	wait(2.5)
	msg:Destroy()
end
-- Connect the function to the MouseClick event
clickDetector.MouseClick:Connect(onClicked)
```

## 2.3 Anchor Toggle
```Lua
local part = script.Parent

-- Create a ClickDetector so we can tell when the part is clicked
local cd = Instance.new("ClickDetector", part)

-- This function updates how the part looks based on its Anchored state
local function updateVisuals()
	if part.Anchored then
		-- When the part is anchored...
		part.BrickColor = BrickColor.new("Bright red")
		part.Material = Enum.Material.DiamondPlate
	else
		-- When the part is unanchored...
		part.BrickColor = BrickColor.new("Bright yellow")
		part.Material = Enum.Material.Wood
	end
end

local function onToggle()
	-- Toggle the anchored property
	part.Anchored = not part.Anchored

	-- Update visual state of the brick
	updateVisuals()
end

-- Update, then start listening for clicks
updateVisuals()
cd.MouseClick:Connect(onToggle)
```

<img width="381" height="304" alt="image" src="https://github.com/user-attachments/assets/e2e521ed-45a3-4991-a735-c76401cd82a4" />

## 2.4 Tween https://create.roblox.com/docs/en-us/reference/engine/classes/ClickDetector

```Lua
local part = script.Parent

-- Create a ClickDetector so we can tell when the part is clicked
local cd = Instance.new("ClickDetector", part)

local TweenService = game:GetService("TweenService")

local function clickMe()
	
	print("click me.")
	
	for i = 1, 5, 1 do -- for i = 10, 1, -1 do
		local part = Instance.new('Part')
		part.Size = Vector3.new(1,1,1)
		part.Shape = Enum.PartType.Block
		part.Anchored = true
		part.Material = "Plastic"
		part.Position = Vector3.new(
			script.Parent.Position.X + math.random(1,10),
			script.Parent.Position.Y + math.random(1,5),
			script.Parent.Position.Z + math.random(1,10))
		part.Orientation = Vector3.new(
			math.random(0,360),
			math.random(0,360),
			math.random(0,360)
		)
		part.Parent = workspace
		part.CanCollide = true
		part.Name = "Part"..i
		local goal = {}
		goal.Position = Vector3.new(
			script.Parent.Position.X + math.random(1,10),
			script.Parent.Position.Y + math.random(1,5),
			script.Parent.Position.Z + math.random(1,10))
		goal.Color = Color3.new(math.random(0,10),math.random(0,10),math.random(0,10))
		local tweenInfo = TweenInfo.new(5)
		local tween = TweenService:Create(part,tweenInfo,goal)
		tween:Play()
		--task.wait(0.1)
	end
end

cd.MouseClick:Connect(clickMe)

```
