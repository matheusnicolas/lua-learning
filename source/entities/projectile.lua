local pd <const> = playdate
local gfx <const> = pd.graphics

class('Projectile').extends(gfx.sprite)

function Projectile:init(xPosition, yPosition, speed)
    self:moveTo(xPosition, yPosition)
    local projectileImage = gfx.image.new("images/projectile")
    self:setImage(projectileImage)
    self.speed = speed
end

function Projectile:update()
    Projectile.super.update(self)
    self:moveBy(0, self.speed)
end
