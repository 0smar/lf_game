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

local PADDING_LVL_BTN = 140

----------------------------------------------- Functions

local function gotoMainMenu()
	composer.gotoScene("mainMenu")
end

local function stageSelection(event)
	local btnTapped = event.target
	
	composer.gotoScene("stageSelection", { params = btnTapped.id })
end

local function createLevelBtns()
	
	local totalWidth = 4 * PADDING_LVL_BTN
	local startY = display.viewableContentHeight*0.6 - totalWidth * 0.5
	
	local lvlBtnsGroup = display.newGroup()
	backgroundLayer:insert(lvlBtnsGroup)
	
	for index = 1, 5 do
		local lvlBtn = display.newRect(display.contentCenterX, display.viewableContentHeight, display.viewableContentWidth * 0.7, 100)
		lvlBtn.x = display.viewableContentWidth*0.5
		lvlBtn.y = startY + (index - 1) * PADDING_LVL_BTN
		lvlBtn:setFillColor(unpack(color_button))
		lvlBtn.strokeWidth = 5
		lvlBtn:setStrokeColor( unpack(color_buttonStroke) )
		lvlBtn.id = index
		lvlBtn:addEventListener("tap", stageSelection)
		lvlBtnsGroup:insert(lvlBtn)
		
		local lvlBtnTextOptions = {
			text = "Nivel "..index,	 
			x = lvlBtn.x,
			y = lvlBtn.y,
			font = native.systemFontBold,   
			fontSize = 36,
			align = "center"
		}

		local btnStartText= display.newText(lvlBtnTextOptions)
		btnStartText:setFillColor(unpack(color_font))
		textLayer:insert(btnStartText)
	end
	
	
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
	back.x = 60
	back.y = 60
	back:addEventListener("tap", gotoMainMenu)
	backgroundLayer:insert(back)
	
	local logo = display.newImage("img/logolf.png")
	logo.x = display.contentCenterX
	logo.y = display.viewableContentHeight * 0.2
	logo.xScale = 0.7
	logo.yScale = 0.7
	backgroundLayer:insert(logo)
	
	createLevelBtns()
    
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




