PLANE_F8E  = 0
PLANE_F20  = 1
PLANE_F14D = 2
PLANE_A10A = 3
PLANE_YF23 = 4
PLANE_F200 = 5

img = love.graphics.newImage("res/images/f8e.png")
q = love.graphics.newQuad(32, 0, 32, 16, img)

Player = class("Player", Entity)

function Player:initialize(x, y)
  self.speedY = METER * 3
  self.speedX = METER * 4
  self.shotFrequency = 0.1
  self.shotTimer = self.shotFrequency
  self.magazineSize = 40
  self.shotsTaken = 0
  Entity.initialize(self, 200, 100, 32, 5)
end

function Player:update(dt)
  local vx = 0
  local vy = 0

  if love.keyboard.isDown("d") then
    vx = self.speedX
  elseif love.keyboard.isDown("a") then
    vx = -self.speedX
  end

  if love.keyboard.isDown("w") then
    vy = -self.speedY
  elseif love.keyboard.isDown("s") then
    vy = self.speedY
  end

  if love.keyboard.isDown("space") then
    if (self.shotTimer > self.shotFrequency) then
      self.shotTimer = 0
      print "shot"
    end

    self.shotTimer = self.shotTimer + dt
  else
    self.shotTimer = self.shotFrequency
  end

  self.body:setLinearVelocity(vx, vy)
end

function Player:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(img, q, self.body:getX() - 16, self.body:getY() - 8)
  love.graphics.setColor(0,1,1)
  love.graphics.polygon("line", self.body:getWorldPoints(self.shape:getPoints()))
end

