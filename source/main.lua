import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "entities/player"
import "entities/knight"
import "entities/giant"

import "source/scripts/signal/signal"

local pd <const> = playdate
local gfx <const> = playdate.graphics

-- to make it work show be initiated here
Signal = Signal()

-- local function initialize()
--     local knightImage = gfx.image.new("images/knight")
--     local playerInstance = Player(200, 200, knightImage)
--     playerInstance:add()
-- end

local function initialize()
    local playerInstance = Knight(200, 200)
    playerInstance:add()
end

-- local function initialize()
--     local playerInstance = Giant(200, 200)
--     playerInstance:add()
-- end

initialize()

function playdate.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end
