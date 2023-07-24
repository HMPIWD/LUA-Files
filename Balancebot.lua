include(".mlib/main")
include(".mlib/other")

function OnSnapInput()
	if Engine.Input:KeyIsPressed("h") then
		local ID = GetClosestPlayer(380, false, false, false, false)
		if Game.LocalTee.Pos.x < Game.Players(ID).Tee.Pos.x then
			Right()
		end
		if Game.LocalTee.Pos.x > Game.Players(ID).Tee.Pos.x then
			Left()
		end
	end
end
