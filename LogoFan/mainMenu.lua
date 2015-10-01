----------------------------------------------- Home
local composer = require("composer")

local game = composer.newScene() 
----------------------------------------------- Variables

local backgroundLayer
local textLayer


----------------------------------------------- Constants

local color_bg = {26/255, 29/255, 38/255}
local color_button = {41/255, 44/255, 53/255}
local color_buttonStroke = {119/255, 122/255, 129/255}
local color_font = {213/255, 218/255, 186/255}

----------------------------------------------- Functions

local function gotoLevelSelection(event)
	composer.gotoScene( "levelSelection" )
end

local function gotoInfo(event)
	print("INFO")
end

----------------------------------------------- Module functions 

function game:create(event)
    local sceneView = self.view

    backgroundLayer = display.newGroup()
    sceneView:insert(backgroundLayer)

    textLayer = display.newGroup()
    sceneView:insert(textLayer)

    local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.viewableContentWidth, display.viewableContentHeight )
    backgroundLayer:insert(bg)
	
	bg:setFillColor(unpack(color_bg))
	
	local logo = display.newImage("img/logolf.png")
	logo.x = display.contentCenterX
	logo.y = display.viewableContentHeight * 0.3
	backgroundLayer:insert(logo)
	
	local btnStart = display.newRect(display.contentCenterX, display.viewableContentHeight * 0.6, display.viewableContentWidth * 0.7, 100)
	btnStart:setFillColor(unpack(color_button))
	btnStart.strokeWidth = 5
	btnStart:setStrokeColor( unpack(color_buttonStroke) )
	
	btnStart:addEventListener("tap", gotoLevelSelection)
	backgroundLayer:insert(btnStart)
	
	local btnStartTextOptions = {
		text = "EMPEZAR",	 
		x = btnStart.x,
		y = btnStart.y,
		font = native.systemFontBold,   
		fontSize = 36,
		align = "center"
	}

	local btnStartText= display.newText(btnStartTextOptions)
	btnStartText:setFillColor(unpack(color_font))
	textLayer:insert(btnStartText)
	
	local btnInfo = display.newRect(display.contentCenterX, display.viewableContentHeight * 0.71, display.viewableContentWidth * 0.7, 100)
	btnInfo:setFillColor(41/255, 44/255, 53/255)
	btnInfo.strokeWidth = 5
	btnInfo:setStrokeColor( 119/255, 122/255, 129/255 )
	
	btnInfo:addEventListener("tap", gotoInfo)
	backgroundLayer:insert(btnInfo)
	
	local btnInfoTextOptions = {
		text = "INFO",	 
		x = btnInfo.x,
		y = btnInfo.y,
		font = native.systemFontBold,   
		fontSize = 36,
		align = "center"
	}

	local btnInfoText= display.newText(btnInfoTextOptions)
	btnInfoText:setFillColor(unpack(color_font))
	textLayer:insert(btnInfoText)
    
end

function game:destroy()
    
end

function game:show( event )
    local sceneGroup = self.view
    local phase = event.phase
        
    if ( phase == "will" ) then
        --print("will show - levels")

    elseif ( phase == "did" ) then
        
    end
end

function game:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        
    elseif ( phase == "did" ) then
    end
end
----------------------------------------------- Execution
game:addEventListener( "create" )
game:addEventListener( "destroy" )
game:addEventListener( "hide" )
game:addEventListener( "show" )

return game


