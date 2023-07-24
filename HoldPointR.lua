include(".mlib/main")
include(".mlib/controls")
include(".mlib/other")

Game.Console:ExecuteLine("kill", -1, true)

local Point = vec2(145.44 * 32, 82.53 * 32)

function OnSnapInput()
    ResetInput()

    SetWeapon(1)

    local ID = GetClosestPlayer(380, false, false, false, false)

    local TargetPos = Game.Players(ID).Tee.Pos
    local TargetVel = Game.Players(ID).Tee.Vel
    local TargetPosPred = TargetPos + TargetVel * vec2(3.6, 3.6)
   
    if LocalPosPred.x < Point.x then Right() end
    if LocalPosPred.x > Point.x then Left() end
    if LocalPosPred.y > Point.y + 1 then Jump() end
    if LocalPosPred.y < Point.y + 1 then NoJump() end

    if Game.Players(ID).Tee.Pos.y < Game.LocalTee.Pos.y then Fire() end
    if Game.Players(ID).Tee.Pos.y > Game.LocalTee.Pos.y then NoFire() end
    
    if IsFreeze(Game.LocalTee.Pos.x, Game.LocalTee.Pos.y + 32) then Jump() end

    if ID == -1 then return end

    SetAimVec(TargetPosPred - Game.LocalTee.Pos)
    Hook()
    if Game.LocalTee.HookState == -1 then NoHook() end
end
