require "collisions"

local sparkle = {}
sparkle.__index = sparkle

function newSparkle(object)
	local n = object
	n.type = "sparkle"
	n.width = 16
	n.height = 16
	n.anim = newAnimation(lutro.graphics.newImage(
		"assets/sparkle.png"), 16, 16, 1, 20)
	n.t = 0

	return setmetatable(n, sparkle)
end

function sparkle:update(dt)
	self.t = self.t + 1

	self.anim:update(dt)

	if self.t >= 10 then
		for i=1, #entities do
			if entities[i] == self then
				table.remove(entities, i)
			end
		end
	end
end

function sparkle:draw()
	self.anim:draw(self.x, self.y)
end