local function cameraHandler()
    local cameraX = ball.x - halfWidth
    local cameraY = ball.y - halfHeight

    -- Check if the ball is outside the offset margin on the x-axis
    if ball.x > cameraX + halfWidth + offsetMarginX then
        cameraX = ball.x - halfWidth - offsetMarginX
    elseif ball.x < cameraX + halfWidth - offsetMarginX then
        cameraX = ball.x - halfWidth + offsetMarginX
    end

    -- Check if the ball is outside the offset margin on the y-axis
    if ball.y > cameraY + halfHeight + offsetMarginY then
        cameraY = ball.y - halfHeight - offsetMarginY
    elseif ball.y < cameraY + halfHeight - offsetMarginY then
        cameraY = ball.y - halfHeight + offsetMarginY
    end

    -- Clamp the camera position to ensure it doesn't go out of bounds of the world
    cameraX = max(0, min(cameraX, worldWidth - displayWidth))
    cameraY = max(0, min(cameraY, worldHeight - displayHeight))
    gfx.setDrawOffset(-cameraX, -cameraY)
end
