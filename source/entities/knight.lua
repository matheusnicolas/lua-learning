import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Knight').extends(Player)

function Knight:init(xPosition, yPosition)
    local knightImage = gfx.image.new("images/kenney")
    Knight.super.init(self, xPosition, yPosition, knightImage)
    self.moveSpeed = 5
    self.projectileSpeed = 5
end

function Knight:ability()
    Knight.super.ability(self)
    local function timerCallback()
        self:shoot(self.x, self.y)
    end
    pd.timer.performAfterDelay(250, timerCallback)
    pd.timer.performAfterDelay(350, timerCallback)
end
