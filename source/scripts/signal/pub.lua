local pd <const> = playdate
local gfx <const> = pd.graphics

class('Pub').extends(gfx.sprite)

function Pub:init()
    self.score = 0
    self:add()
end

function Pub:update()
    if pd.buttonJustPressed(pd.kButtonB) then
        self.score += 1
        Signal:notify("game_score", self.score, score_delta)
    end
end
