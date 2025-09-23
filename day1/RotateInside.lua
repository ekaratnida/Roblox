local part = script.Parent

while true do
    -- Rotate 2 degrees around Y axis every frame
    local currentCFrame = part:GetPivot()
	local rotation = CFrame.Angles(math.rad(6),math.rad(6), 0)
    part:PivotTo(currentCFrame * rotation)
    task.wait(0.001)
end
