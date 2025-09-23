-- print("Hello world!")
-- local loopPart = workspace.LoopPart
local x =1
for i = 1, 10, 1 do -- for i = 10, 1, -1 do
	local part = game.Workspace.LoopPart:Clone() --Instance.new('Part') -- สร้าง new part
	part.Size = Vector3.new(5,1,5) -- ขนาดของ part x,y,z
	part.Shape = Enum.PartType.Block
	part.Anchored = true -- ให้วัตถุลอยอยู่ในอากาศ
	part.Position = Vector3.new(i*2,i*2,0) -- ตำแหน่งของ new part, x,y,z
	part.Parent = workspace
	part.Rotation = Vector3.new(i*5,0,0) -- หมุน object ไปยังทิศทางที่กำหนด
	part.CanCollide = true -- สามารถชนได้
	part.Name = "Part"..i -- ตั้งชื่อให้แต่ละ object
	if i % 2 == 0 then
		part.Color = Color3.fromRGB(255, 0, 0) -- เปลี่ยนสีของแต่ละ object
	else	
		part.Color = Color3.fromRGB(0, 255, 0)
	end
	part.Material = Enum.Material.Neon
	task.wait(1)
end
--[[
if condition then
	 Code to execute if condition is true
 else
	 Code to execute if condition is false
end
--]]





