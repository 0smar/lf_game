----------------------------------------------- Home
local composer = require("composer")
local loadsave = require("loadsave")
local ads = require("ads")
local widget = require("widget")

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
local numLvls = 16

local appID = "ca-app-pub-6677050964748392/6761561861"
local adProvider = "admob"

----------------------------------------------- Functions

local function gotoMainMenu()
	composer.gotoScene("mainMenu", {effect ="fromLeft"})
end

local function stageSelection(event)
	local btnTapped = event.target
	composer.gotoScene("stageSelection", { params = btnTapped.id })
end

local function scrollListener( event )

    local phase = event.phase
    

    return true
end



local function createLevelBtns()
	
		local lvlBtnsGroup = display.newGroup()
	
	local scrollView = widget.newScrollView(
		{
			top = 400,
			left = 0,
			hideBackground = true,
			width = display.viewableContentWidth,
			height = display.viewableContentHeight*0.63,
			scrollWidth = 0,
			scrollHeight = 110*(numLvls+1),
			horizontalScrollDisabled = true,
			listener = scrollListener
		}
	)
	
	backgroundLayer:insert(scrollView)
	scrollView:insert(lvlBtnsGroup)
	
	local totalWidth = 4 * PADDING_LVL_BTN
	local startY = display.viewableContentHeight*0.28 - totalWidth * 0.5
	
	for index = 1, numLvls do
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
		
		if lvlBtn.id == 16 then
			lvlBtn.alpha = 0
			lvlBtnTextOptions.text = ""
		end

		local btnStartText= display.newText(lvlBtnTextOptions)
		btnStartText:setFillColor(unpack(color_font))
		lvlBtnsGroup:insert(btnStartText)
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
	bg:setFillColor(unpack(color_bg))
	backgroundLayer:insert(bg)
	
	local back = display.newImage("img/back.png")
	back.x = 80
	back.y = 80
	back.xScale = 1.7
	back.yScale = 1.7
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




