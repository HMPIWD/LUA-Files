-- MADE BY HMPIWD
-- UPGRADED BY RBLOKO

include(".mlib/main")
include(".mlib/controls")

Game.Console:ExecuteLine("kill", -1, true)

local PlatformC = 117.53 * 32

function OnSnapInput()
    ResetInput()

    local ID = GetClosestPlayer(380, false, false, false, false)

    local TargetPos = Game.Players(ID).Tee.Pos
    local TargetVel = Game.Players(ID).Tee.Vel
    local TargetPosPred = TargetPos + TargetVel * vec2(3.6, 3.6)
   
    if LocalPosPred.x < PlatformC then Right() end
    if LocalPosPred.x > PlatformC then Left() end
    
    if IsFreeze(Game.LocalTee.Pos.x, Game.LocalTee.Pos.y + 32) then Jump() end
    if Game.LocalTee.FreezeStart ~= 0 then Game.Console:ExecuteLine("kill", -1, true) end

    if ID == -1 then return end

    SetAimVec(TargetPosPred - Game.LocalTee.Pos)
    Hook()
    if Game.LocalTee.HookState == -1 then NoHook() end
end
