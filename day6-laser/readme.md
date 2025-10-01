Day 6 https://shorturl.at/3TX4q

### First code in any part such as block.
```lua
local part = script.Parent

-- Laser settings
local laserColor = Color3.new(1, 0, 0) -- Red
local laserMaterial = Enum.Material.Neon
local laserWidth = 0.5

local minX = -10
local maxX = 10
local minZ = -10
local maxZ = 10

while true do
	-- Wait a random time between 1 and 3 seconds

	-- Generate random direction and distance for X and Z
	local xOffset = math.random(-10, 10)
	local zOffset = math.random(-10, 10)
	local currentCFrame = part:GetPivot()
	local currentPos = currentCFrame.Position

	-- Calculate new position
	local newX = currentPos.X + xOffset
	local newZ = currentPos.Z + zOffset

	-- Clamp new position within boundaries
	if newX < minX then newX = minX end
	if newX > maxX then newX = maxX end
	if newZ < minZ then newZ = minZ end
	if newZ > maxZ then newZ = maxZ end

	local newCFrame = CFrame.new(newX, currentPos.Y, newZ)
	part:PivotTo(newCFrame)
	
	task.wait(math.random(1, 3))

	-- Calculate bottom position of the part
	local partCFrame = part.CFrame
	local partSizeY = part.Size.Y
	local origin = partCFrame.Position - partCFrame.UpVector * (partSizeY / 2)

	-- Fire direction (downward)
	local direction = Vector3.new(0, -500, 0)

	-- Raycast to find where the laser hits
	local raycastParams = RaycastParams.new()
	raycastParams.FilterDescendantsInstances = {part}
	raycastParams.IgnoreWater = true
	raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

	local result = workspace:Raycast(origin, direction, raycastParams)
	local hitPosition = origin + direction
	
	if result then
		hitPosition = result.Position
		-- Traverse up the ancestry to find a Humanoid
		local instance = result.Instance
		
		if instance and instance:IsA("BasePart") then
			-- Optional: Add a delay before destroying
			task.wait(0.5)
			instance:Destroy()
		end
		
		local humanoid = nil
		while instance and instance ~= workspace do
			humanoid = instance:FindFirstChild("Humanoid")
			if humanoid then
				break
			end
			instance = instance.Parent
		end
		if humanoid then
			print("Laser hit player: " .. humanoid.Parent.Name)
			humanoid.Health = 0
		end
	end

	-- Create laser part
	local laser = Instance.new("Part")
	laser.Anchored = true
	laser.CanCollide = false
	laser.Material = laserMaterial
	laser.Color = laserColor
	laser.Transparency = 0
	laser.Size = Vector3.new(laserWidth, (origin - hitPosition).Magnitude, laserWidth)
	laser.CFrame = CFrame.new((origin + hitPosition) / 2, hitPosition)
	laser.Orientation = Vector3.new(0, 90, 0)
	laser.Parent = workspace

	-- Remove laser after short time
	task.wait(2)
	laser:Destroy()
end
```


## Second code ใส่ Script ใน world space ตั้งชื่อ file เป้นอะไรก็ได้
```lua
local Workspace = game:GetService("Workspace")
local gridSize = 20
local spacing = 3
local sphereSize = 2

-- Starting position (centered around origin)
local startX = -(gridSize - 1) * spacing / 2
local startZ = -(gridSize - 1) * spacing / 2
local yPos = 3 -- Height above baseplate

for x = 0, gridSize - 1 do
    for z = 0, gridSize - 1 do
        local sphere = Instance.new("Part")
        sphere.Shape = Enum.PartType.Block
        sphere.Size = Vector3.new(sphereSize, sphereSize, sphereSize)
        sphere.Anchored = true
        sphere.Position = Vector3.new(startX + x * spacing, yPos, startZ + z * spacing)
        sphere.Name = "Sphere"
        sphere.Parent = Workspace
    end
end
```
