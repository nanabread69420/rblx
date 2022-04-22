return {
	NearestTarget = function(teamcheck, mouse)
		-- i didnt make this shit
		local players = {}
		local PLAYER_HOLD  = {}
		local DISTANCES = {}
		for i, v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer then
				table.insert(players, v)
			end
		end
		for i, v in pairs(players) do
			if v.Character ~= nil then
				local AIM = v.Character:FindFirstChild("Head")
				if teamcheck == true and v.Team ~= game.Players.LocalPlayer.Team then
					local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
					local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
					local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
					local DIFF = math.floor((POS - AIM.Position).magnitude)
					PLAYER_HOLD[v.Name .. i] = {}
					PLAYER_HOLD[v.Name .. i].dist= DISTANCE
					PLAYER_HOLD[v.Name .. i].plr = v
					PLAYER_HOLD[v.Name .. i].diff = DIFF
					table.insert(DISTANCES, DIFF)
				elseif teamcheck == false and v.Team == game.Players.LocalPlayer.Team then 
					local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
					local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
					local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
					local DIFF = math.floor((POS - AIM.Position).magnitude)
					PLAYER_HOLD[v.Name .. i] = {}
					PLAYER_HOLD[v.Name .. i].dist= DISTANCE
					PLAYER_HOLD[v.Name .. i].plr = v
					PLAYER_HOLD[v.Name .. i].diff = DIFF
					table.insert(DISTANCES, DIFF)
				end
			end
		end

		if unpack(DISTANCES) == nil then
			return nil
		end

		local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
		if L_DISTANCE > 30 then
			return nil
		end

		for i, v in pairs(PLAYER_HOLD) do
			if v.diff == L_DISTANCE then
				return v.plr
			end
		end
		return nil
	end,
}
