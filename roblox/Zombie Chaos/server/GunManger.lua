--!nocheck
local rs: ReplicatedStorage = game:GetService("ReplicatedStorage")
local events: Instance = rs:WaitForChild("Events")
local pistolFireEvent: Instance = events:WaitForChild("PistolFired")

local match = string.match
--this is temporary
local function getMultiplier(partName: string): number
	partName = string.lower(partName)
	if match(partName, "head") then
		return 2
	end
	
	if match(partName, "torso") or match(partName, "rootpart") then
		return 1.45
	end
	
	if partName.match(partName, "arm") or partName.match(partName, "leg") then
		return 1.2
	end
	
	return 1
end

local function getTool(player: Player)
	local char = player.Character
	return char:FindFirstChildOfClass("Tool")
end

local function pistolFired(player: Player, mouseposition: Vector3, tool: Tool)
	local tool: Tool? = getTool(player)
	local params: RaycastParams = RaycastParams.new()
	params.FilterDescendantsInstances = {player.Character, tool}
	params.FilterType = Enum.RaycastFilterType.Blacklist
	params.IgnoreWater = true
	
	print(string.format("Player: %s, X:%i, Y:%i, Z:%i", player.Name, mouseposition.X, mouseposition.Y, mouseposition.Z))
	local origin: Attachment = tool.Configuration.Muzzle.Value

	local directionVector: Vector3 = (origin.WorldCFrame.Position - mouseposition).Unit * 1000
	
	local raycastResult: RaycastResult = workspace:Raycast(origin.WorldCFrame.Position, -directionVector)
	local raycastInstance: BasePart? = raycastResult.Instance
	local char: Model = raycastInstance:FindFirstAncestorOfClass("Model")
	local humanoid: Humanoid = char:FindFirstChildWhichIsA("Humanoid")
	
	if raycastResult then
		local damage: number = 35 * getMultiplier(raycastInstance.Name) 
    
		print(string.format("SOMETHING!: %s", raycastResult.Instance.Name))
		print(string.format("Parent: %s", raycastResult.Instance.Parent.Name))
		if char and humanoid then
			humanoid.Health -= damage
			
		end
	end
end

pistolFireEvent.OnServerEvent:Connect(pistolFired)
