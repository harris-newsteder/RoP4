
Entity = class("Entity")

function Entity:initialize(x, y, w, h)
  self.w = w
  self.h = h
  self.body = love.physics.newBody(mission.world, x, y, "dynamic")
  self.shape = love.physics.newRectangleShape(w, h)
  self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Entity:update(dt)

end

function Entity:draw()
  
end