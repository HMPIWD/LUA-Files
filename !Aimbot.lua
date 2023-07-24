include(".mlib/main")

function OnSnapInput()
    local ID = GetClosestPlayer(380, false, false, false, false)
    if ID == -1 then return end
    local SpoofAmount = vec2(math.random(1, 8), math.random(1, 8))
    local Dir = math.random(1, 2)
    if Engine.Input:KeyIsPressed("mouse2") then
        if Dir == 1 then
            SetAimVec(Game.Players(ID).Tee.Pos - Game.LocalTee.Pos - SpoofAmount)
        else
            SetAimVec(Game.Players(ID).Tee.Pos - Game.LocalTee.Pos + SpoofAmount)
        end
        Hook()
    end
    if not Engine.Input:KeyIsPressed("mouse2") then 
        NoHook()
    end
    if Engine.Input:KeyIsPressed("mouse2") then
        Hook()
    end
    if Engine.Input:KeyIsPressed("mouse1") then
        if Dir == 1 then
            SetAimVec(Game.Players(ID).Tee.Pos - Game.LocalTee.Pos - SpoofAmount)
        else
            SetAimVec(Game.Players(ID).Tee.Pos - Game.LocalTee.Pos + SpoofAmount)
        end
        Fire()
    end
end