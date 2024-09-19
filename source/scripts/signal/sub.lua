local pd <const> = playdate
local gfx <const> = pd.graphics

class('Sub').extends(gfx.sprite)

function Sub:init()
    self:add()
    self:sub()
end

function Sub:update()

end

function Sub:updateScore(new_score)
    print(new_score)
end

function Sub:sub()
    Signal:subscribe("game_score", self, function(_, _, new_score, score_delta)
        self:updateScore(new_score)
    end)
end
