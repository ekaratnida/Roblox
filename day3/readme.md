Related script https://docs.google.com/document/d/1nqvpP9jcNUm6zwnsexTvaZDK5jyNVU-RBncPlNWtIqQ/edit?tab=t.0

# Day3,

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

2.2 Tween
```Lua
local clickDetector = script.Parent.ClickDetector
local TweenService = game:GetService("TweenService")
clickDetector.MouseClick:Connect(function()
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
end)
```
