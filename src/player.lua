player = {}
bullets = {}

function player.load()
    player.x = 50
    player.y = 510
    player.speed = 400
end

function player.update(dt)
    playerMovement(dt)
    bulletMovement(dt)
    destroyBullet(dt)
    killEnemy(dt)
end

function player.draw()
    love.graphics.setColor(255, 255, 0)
    love.graphics.rectangle('fill', 0, 560, 1000, 50)

    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('fill', player.x, player.y, 75, 50)

    for i, bullet in ipairs(bullets) do
        love.graphics.rectangle('fill', bullet.x, bullet.y, 10, 10)
    end
end

-- Player functions

function playerMovement(dt)
    if love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end

    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    end
end

function spawnBullet()
    local bullet = {}
    bullet.x = player.x + 50
    bullet.y = player.y + 20
    bullet.speed = 500
    bullet.dead = false
    table.insert(bullets, bullet)
end

function bulletMovement(dt)
    for i, bullet in ipairs(bullets) do
        bullet.x = bullet.x + bullet.speed * dt
    end
end

function destroyBullet(dt)
    for i = #bullets, 1, -1 do
        local b = bullets[i]
        if b.x < 0 or b.x > love.graphics.getWidth() then
            table.remove(bullets, i)
            print(b.x)
        end
    end
end

function killEnemy(dt)
    for i, enemy in ipairs(enemies) do
        for j, bullet in ipairs(bullets) do
            if distanceBetween(enemy.x, enemy.y, bullet.x, bullet.y) < 30 then
                enemy.dead = true
                bullet.dead = true
            end
        end
    end

    for i = #bullets, 1, -1 do
        local b = bullets[i]
        if b.dead == true then table.remove(bullets, i) end
    end

    for i = #enemies, 1, -1 do
        local e = enemies[i]
        if e.dead == true then table.remove(enemies, i) end
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        spawnBullet()
    end
end