local shadow = {}
shadow.__index = shadow

function newShadow(object)
	local n = object
	n.type = "shadow"
	n.width = 16
	n.height = 16
	n.img = lutro.graphics.newImage("assets/shadow.png")

	return setmetatable(n, shadow)
end

function shadow:draw()
	lutro.graphics.draw(self.img, self.x, self.y)
end