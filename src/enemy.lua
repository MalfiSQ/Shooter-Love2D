enemies = {}

function enemies.load()
    
end

function enemies.update(dt)
    enemyMovement(dt)
end

function enemies.draw()
    for i, enemy in ipairs(enemies) do
        love.graphics.rectangle('fill', enemy.x, enemy.y, 75, 50)
    end
end

-- Enemy functions

function enemySpawn()
    local enemy = {}
    enemy.x = 700
    enemy.y = 510
    enemy.speed = 200
    enemy.dead = false
    table.insert(enemies, enemy)
end

function enemyMovement(dt)
    for i, enemy in ipairs(enemies) do
        enemy.x = enemy.x - enemy.speed * dt
    end

    for i, enemy in ipairs(enemies) do
        if distanceBetween(enemy.x, enemy.y, player.x, player.y) < 70 then
            for i, enemy in ipairs(enemies) do
                enemies[i] = nil
            end
        end
    end
end

function love.keypressed(key)
    if key == 'space' then
        enemySpawn()
    end
end