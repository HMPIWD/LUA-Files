include(".mlib/main")

function OnSnapInput()
	local ID = GetClosestPlayer(380, false, false, false, false)
	if ID == -1 then
		return
	end
	if Engine.Input:KeyIsPressed("j") then
		local Pos = Game.Players(ID).Tee.Pos
		local Vel = Game.Players(ID).Tee.Vel
		local PosPred = Pos + Vel * vec2(3.6, 3.6)
		SetAimVec(PosPred - Game.LocalTee.Pos)
		Game.Input.Fire = (Game.Input.Fire == 0) and 1 or 0
		Game.Console:ExecuteLine("emote 12", -1, true)
	end
end
