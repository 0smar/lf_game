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
local function gotoMainMenu()
	composer.gotoScene("mainMenu", {effect ="fromLeft"})
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
	
	local back = display.newImage("img/back.png")
	back.x = 80
	back.y = 80
	back.xScale = 1.7
	back.yScale = 1.7
	back:addEventListener("tap", gotoMainMenu)
	backgroundLayer:insert(back)
	
	local logo = display.newImage("img/logolf.png")
	logo.x = display.contentCenterX
	logo.y = display.viewableContentHeight * 0.3
	backgroundLayer:insert(logo)
	
	local strAOptions = {
		text = "Desarrollado por Muaya",	 
		y = display.viewableContentHeight*0.6,
		x = display.contentCenterX,
		font = native.systemFontBold,   
		fontSize = 36,
		align = "center"
	}
	
	local stringA = display.newText(strAOptions)
	stringA:setFillColor(unpack(color_font))
	textLayer:insert(stringA)
	
	local strBOptions = {
		text = "Diseño Kamui Colors",	 
		y = display.viewableContentHeight*0.7,
		x = display.contentCenterX,
		font = native.systemFontBold,   
		fontSize = 36,
		align = "center"
	}

	local stringB= display.newText(strBOptions)
	stringB:setFillColor(unpack(color_font))
	textLayer:insert(stringB)
    
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




