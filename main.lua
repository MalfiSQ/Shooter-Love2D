require('src/player')
require('src/enemy')

function love.load()
    player.load()
    enemies.load()
end

function love.update(dt)
    player.update(dt)
    enemies.update(dt)
end

function love.draw()
    player.draw()
    enemies.draw()
end

-- Functions

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end