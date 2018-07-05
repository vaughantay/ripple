local ripple = require 'ripple'

love.audio.setEffect('cavern', {
	type = 'reverb',
	decaytime = 5,
	gain = .5,
})

local sfx = ripple.newTag()
sfx:setEffect 'cavern'

local testSound = ripple.newSound {
	source = love.audio.newSource('bloop.ogg', 'static'),
	tags = {sfx},
}
local testSound2 = ripple.newSound {
	source = love.audio.newSource('bloop2.ogg', 'static'),
	tags = {},
}

function love.keypressed(key)
	if key == '1' then testSound:play() end
	if key == '2' then testSound2:play() end

	if key == 'return' then sfx:setEffect() end
	if key == 'space' then testSound2:tag(sfx) end
end

function love.draw()
	love.graphics.print(#testSound._instances)
end
