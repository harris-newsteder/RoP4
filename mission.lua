

mission = {}

mission.world = love.physics.newWorld(0, 0, true)

function mission:initialize()
  self.player = Player:new()
end

function mission:update(dt)
  self.world:update(dt)
  self.player:update(dt)
end

function mission:draw()
  self.player:draw()
end