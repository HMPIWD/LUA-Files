include(".mlib/controls")
include(".mlib/players")
include(".mlib/main")
include(".mlib/other")

function OnSnapInput()
	local ID=GetClosestPlayer(380, false, false, false, false)
	if ID==-1 then
		return
	end
	local SpoofAmount=vec2(math.random(0, 11), math.random(0, 0))
	local Dir=math.random(0, 1)
	if Engine.Input:KeyIsPressed("mouse2") then
		Hook()
		if Dir == 1 then
			SetAimSilentVec(Game.Players(ID).Tee.Pos-Game.LocalTee.Pos+SpoofAmount)
		else
			SetAimSilentVec(Game.Players(ID).Tee.Pos-Game.LocalTee.Pos-SpoofAmount)
			Hook()
		end
		Hook()
		if Game.LocalTee.HookState == -1 then
			NoHook()
		end
	end
end
