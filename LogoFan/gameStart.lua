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
	composer.gotoScene("stageSelection", { params = stageParams[3] })
end

local function showCompleted()
	local correctNameOptions = {
		text = stageName,	 
		x = display.contentCenterX,
		y = display.viewableContentHeight*0.68,
		font = native.systemFont,   
		fontSize = 52,
		align = "center"
	}

	local correctName = display.newText(correctNameOptions)
	stageGroup:insert(correctName)

	local correctLabelOpt = {
		text = "CORRECTO",	 
		x = display.contentCenterX,
		y = display.viewableContentHeight*0.6,
		font = native.systemFontBold,   
		fontSize = 36,
		align = "center"
	}

	local correctLabel = display.newText(correctLabelOpt)
	correctLabel:setFillColor(unpack(color_green))
	stageGroup:insert(correctLabel)
end

local function checkAnswer()
	if string.lower(answer) == string.lower(stageName) then
		showCompleted()
		stagesList[stageId].cleared = true
		loadsave.saveTable( stagesList, "stages.json" )
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

local function setStage()
	local img = display.newImage("img/logos/"..stageImage)
	img.x = display.contentCenterX
	img.y = display.viewableContentHeight * 0.3
	img.xScale = 0.7
	img.yScale = 0.7
	stageGroup:insert(img)
	
	nameField = native.newTextField( display.contentCenterX, display.viewableContentHeight*0.5, 500, 60 )
	nameField.font = native.newFont( native.systemFontBold, 24 )
	nameField.text = ""
	nameField:addEventListener( "userInput", userWrite )
	stageGroup:insert(nameField)
	
	if stagesList[stageId].cleared then
		showCompleted()
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
		setStage()

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








