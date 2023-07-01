GFX_BASE_WIDTH = 256
GFX_BASE_HEIGHT = 224
GFX_SCALE = 4
GFX_WIDTH = GFX_BASE_WIDTH * GFX_SCALE
GFX_HEIGHT = GFX_BASE_HEIGHT * GFX_SCALE

METER = 16

function love.load()
  love.window.setMode(GFX_WIDTH, GFX_HEIGHT)
  love.physics.setMeter(METER)
  love.graphics.setDefaultFilter("nearest", "nearest")

  class = require "middleclass"

  require "mission"
  require "entity"
  require "player"

  mission:initialize()
end

function love.update(dt)
  mission:update(dt)
end

function love.draw()
  love.graphics.push()
  love.graphics.scale(GFX_SCALE, GFX_SCALE)
  mission:draw()
  love.graphics.pop()
end