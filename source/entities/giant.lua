import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Giant').extends(Player)

function Giant:init(xPosition, yPosition)
    local giantImage = gfx.image.new("images/giant")
    Giant.super.init(self, xPosition, yPosition, giantImage)
    self.moveSpeed = 2
    self.projectileSpeed = 3
end

function Giant:ability()
    self:shoot(self.x, self.y)
    self:shoot(self.x + 10, self.y + 2)
    self:shoot(self.x - 10, self.y + 2)
end
