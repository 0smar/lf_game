----------------------------------------------- Home
local composer = require("composer")
local loadsave = require("loadsave")

local game = composer.newScene() 
----------------------------------------------- Variables

local backgroundLayer
local textLayer

local nameField

local stageName
local stageImage
local stageLevel
local stageParams
local stageGroup
local answer
local stagesList
local stageId
----------------------------------------------- Constants

local color_bg = {26/255, 29/255, 38/255}
local color_button = {41/255, 44/255, 53/255}
local color_buttonStroke = {119/255, 122/255, 129/255}
local color_font = {213/255, 218/255, 186/255}
local color_green = {205/255, 220/255, 57/255}

----------------------------------------------- Functions

local function gotoStageSelection()
	native.setKeyboardFocus( nil )
	
	loadsave.saveTable( stagesList, "stages.json" )
	composer.gotoScene("stageSelection", { params = stageParams[3] })
end

local function compAnimation()
	
	local correctLabelOpt = {
		text = "CORRECTO",	 
		x = display.contentCenterX,
		y = display.viewableContentHeight*0.4,
		font = native.systemFontBold,   
		fontSize = 44,
		align = "center"
	}

	local correctLabel = display.newText(correctLabelOpt)
	correctLabel:setFillColor(unpack(color_green))
	stageGroup:insert(correctLabel)
	correctLabel.alpha = 0
	
	transition.to(correctLabel, { delay = 100, time = 800, alpha = 1, transition = easing.outExpo, y = display.viewableContentHeight*0.6, 
	onComplete = function()
		gotoStageSelection()
	end
		})
end

local function checkAnswer()
	native.setKeyboardFocus( nil )
	if string.lower(answer) == string.lower(stageName) then
		stagesList[stageId].clared = true
		loadsave.saveTable( stagesList, "stages.json" )
		compAnimation()
	else
		nameField:setTextColor(1,0,0)
	end
	
end

local function userWrite( event )
    if ( "began" == event.phase ) then
        -- This is the "keyboard appearing" event.
        -- In some cases you may want to adjust the interface while the keyboard is open.
		print("Key")

    elseif ( "submitted" == event.phase ) then
        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
		answer = event.target.text
		native.setKeyboardFocus( nil )
		checkAnswer()
    end
end

local function setStageComplete()
	local img
	img = display.newImage("img/logosc/"..stageImage)
	img.x = display.contentCenterX
	img.y = display.viewableContentHeight * 0.35
	img.xScale = 0.9
	img.yScale = 0.9
	stageGroup:insert(img)
	
	local compNameOptions = {
		text = string.upper(stageName),	 
		x = display.contentCenterX,
		y = display.viewableContentHeight*0.6,
		font = native.systemFontBold,   
		fontSize = 50,
		align = "center"
	}
	
	local completedName = display.newText(compNameOptions)
	completedName:setFillColor(unpack(color_font))
	stageGroup:insert(completedName)
end

local function setStage()
	local img
	img = display.newImage("img/logos/"..stageImage)
	img.x = display.contentCenterX
	img.y = display.viewableContentHeight * 0.3
	img.xScale = 0.7
	img.yScale = 0.7
	stageGroup:insert(img)
	
	nameField = native.newTextField( display.contentCenterX, display.viewableContentHeight*0.5, 500, 60 )
	nameField.font = native.newFont( native.systemFontBold, 36 )
	nameField.text = ""
	nameField:addEventListener( "userInput", userWrite )
	stageGroup:insert(nameField)

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
	back:addEventListener("tap", gotoStageSelection)
	backgroundLayer:insert(back)
	
	local logo = display.newImage("img/logolf.png")
	logo.x = display.contentCenterX
	logo.y = display.viewableContentHeight * 0.85
	logo.xScale = 0.7
	logo.yScale = 0.7
	backgroundLayer:insert(logo)
	
end

function game:destroy()
    
end

function game:show( event )
    local sceneGroup = self.view
    local phase = event.phase
        
    if ( phase == "will" ) then
        --print("will show - levels")
		stageParams = event.params	
		
		stageName = stageParams[1]
		stageImage = stageParams[2]
		stageLevel = stageParams[3]
		stagesList = stageParams[4]
		stageId = stageParams[5]
		
		stageGroup = display.newGroup()
		
		if stagesList[stageId].clared then
			setStageComplete()
		else
			setStage()
		end

    elseif ( phase == "did" ) then
        
    end
end

function game:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
		display.remove(stageGroup)
	elseif ( phase == "did" ) then
		
    end
end
----------------------------------------------- Execution
game:addEventListener( "create" )
game:addEventListener( "destroy" )
game:addEventListener( "hide" )
game:addEventListener( "show" )

return game








