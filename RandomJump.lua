include(".mlib/main")

function OnSnapInput()
	NoJump()
	local RandomJump = math.random(1, 50)
	if RandomJump == 25 then
		Jump()
	end
end
