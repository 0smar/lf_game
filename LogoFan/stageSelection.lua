----------------------------------------------- Home
local composer = require("composer")

local game = composer.newScene() 
----------------------------------------------- Variables

local backgroundLayer
local textLayer

local level
local parameters
local stagesGrp

----------------------------------------------- Constants

local color_bg = {26/255, 29/255, 38/255}
local color_button = {41/255, 44/255, 53/255}
local color_buttonStroke = {119/255, 122/255, 129/255}
local color_font = {213/255, 218/255, 186/255}

local PADDING_STAGE = 140
local VPADDING_STAGE = 140

local STAGES = {
	[1] = {
		[1] = {name = "Nutrisa", image = "nutrisa.jpg"},
		[2] = {name = "Alpura", image = "alpura.jpg"},
		[3] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[4] = {name = "Coppel", image = "coppel.jpg"},
		[5] = {name = "Costanzo", image = "costanzo.jpg"},
		[6] = {name = "Aeromexico", image = "aeromexico.jpg"},
		[7] = {name = "Dico", image = "dico.jpg"},
		[8] = {name = "Iusacell", image = "iusacell.jpg"},
		[9] = {name = "Jumex", image = "jumex.jpg"},
		[10] = {name = "Nivea", image = "nivea.jpg"},
		[11] = {name = "Oxxo", image = "oxxo.jpg"},
		[12] = {name = "Telcel", image = "telcel.jpg"},
		[13] = {name = "Televisa", image = "televisa.jpg"},
		[14] = {name = "Sushi Roll", image = "sushiroll.jpg"},
		[15] = {name = "Tia Rosa", image = "tiarosa.jpg"},
		[16] = {name = "Petalo", image = "petalo.jpg"},
		[17] = {name = "Santa Clara", image = "santaclara.jpg"},
		[18] = {name = "Lala", image = "lala.jpg"},
		[19] = {name = "Cemex", image = "cemex.jpg"},
		[20] = {name = "Comercial Mexicana", image = "comercialmexicana.jpg"}
	},
	[2] = {
		[1] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[2] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[3] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[4] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[5] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[6] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[7] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[8] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[9] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[10] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[11] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[12] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[13] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[14] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[15] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[16] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[17] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[18] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[19] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[20] = {name = "Cinepolis", image = "cinepolis.jpg"}
	},
	[3] = {
		[1] = {name = "Oxxo", image = "oxxo.jpg"},
		[2] = {name = "Oxxo", image = "oxxo.jpg"},
		[3] = {name = "Oxxo", image = "oxxo.jpg"},
		[4] = {name = "Oxxo", image = "oxxo.jpg"},
		[5] = {name = "Oxxo", image = "oxxo.jpg"},
		[6] = {name = "Oxxo", image = "oxxo.jpg"},
		[7] = {name = "Oxxo", image = "oxxo.jpg"},
		[8] = {name = "Oxxo", image = "oxxo.jpg"},
		[9] = {name = "Oxxo", image = "oxxo.jpg"},
		[10] = {name = "Oxxo", image = "oxxo.jpg"},
		[11] = {name = "Oxxo", image = "oxxo.jpg"},
		[12] = {name = "Oxxo", image = "oxxo.jpg"},
		[13] = {name = "Oxxo", image = "oxxo.jpg"},
		[14] = {name = "Oxxo", image = "oxxo.jpg"},
		[15] = {name = "Oxxo", image = "oxxo.jpg"},
		[16] = {name = "Oxxo", image = "oxxo.jpg"},
		[17] = {name = "Oxxo", image = "oxxo.jpg"},
		[18] = {name = "Oxxo", image = "oxxo.jpg"},
		[19] = {name = "Oxxo", image = "oxxo.jpg"},
		[20] = {name = "Oxxo", image = "oxxo.jpg"}
	},
	[4] = {
		[1] = {name = "Jumex", image = "jumex.jpg"},
		[2] = {name = "Jumex", image = "jumex.jpg"},
		[3] = {name = "Jumex", image = "jumex.jpg"},
		[4] = {name = "Jumex", image = "jumex.jpg"},
		[5] = {name = "Jumex", image = "jumex.jpg"},
		[6] = {name = "Jumex", image = "jumex.jpg"},
		[7] = {name = "Jumex", image = "jumex.jpg"},
		[8] = {name = "Jumex", image = "jumex.jpg"},
		[9] = {name = "Jumex", image = "jumex.jpg"},
		[10] = {name = "Jumex", image = "jumex.jpg"},
		[11] = {name = "Jumex", image = "jumex.jpg"},
		[12] = {name = "Jumex", image = "jumex.jpg"},
		[13] = {name = "Jumex", image = "jumex.jpg"},
		[14] = {name = "Jumex", image = "jumex.jpg"},
		[15] = {name = "Jumex", image = "jumex.jpg"},
		[16] = {name = "Jumex", image = "jumex.jpg"},
		[17] = {name = "Jumex", image = "jumex.jpg"},
		[18] = {name = "Jumex", image = "jumex.jpg"},
		[19] = {name = "Jumex", image = "jumex.jpg"},
		[20] = {name = "Jumex", image = "jumex.jpg"}
	},
	[5] = {
		[1] = {name = "Lala", image = "lala.jpg"},
		[2] = {name = "Lala", image = "lala.jpg"},
		[3] = {name = "Lala", image = "lala.jpg"},
		[4] = {name = "Lala", image = "lala.jpg"},
		[5] = {name = "Lala", image = "lala.jpg"},
		[6] = {name = "Lala", image = "lala.jpg"},
		[7] = {name = "Lala", image = "lala.jpg"},
		[8] = {name = "Lala", image = "lala.jpg"},
		[9] = {name = "Lala", image = "lala.jpg"},
		[10] = {name = "Lala", image = "lala.jpg"},
		[11] = {name = "Lala", image = "lala.jpg"},
		[12] = {name = "Lala", image = "lala.jpg"},
		[13] = {name = "Lala", image = "lala.jpg"},
		[14] = {name = "Lala", image = "lala.jpg"},
		[15] = {name = "Lala", image = "lala.jpg"},
		[16] = {name = "Lala", image = "lala.jpg"},
		[17] = {name = "Lala", image = "lala.jpg"},
		[18] = {name = "Lala", image = "lala.jpg"},
		[19] = {name = "Lala", image = "lala.jpg"},
		[20] = {name = "Lala", image = "lala.jpg"}
	}
}

----------------------------------------------- Functions

local function gotoLevelSelection(event)
	composer.gotoScene("levelSelection")
end

local function startGame(event)
	local target = event.target
	parameters = {
		[1] = target.name,
		[2] = target.image,
		[3] = target.level
	}
	composer.gotoScene("gameStart", { params = parameters })
end

local function generateStages()
	local totalWidth = 3 * PADDING_STAGE
	local startX = display.contentCenterX - totalWidth * 0.5
	
	local totalHeight = 4 * VPADDING_STAGE
	local startY = display.viewableContentHeight*0.42 - totalHeight*0.5
	
	stagesGrp = display.newGroup()
	
	local elementCount = 1
	
	for index = 1, 5 do
		for j = 1, 4 do
			local stage = display.newImage("img/logos/"..STAGES[level][elementCount].image)
			stage.xScale = 0.25
			stage.yScale = 0.25
			stage.x = startX + (j - 1) * PADDING_STAGE
			stage.y = startY + (index - 1) * VPADDING_STAGE
			stage.alpha = 0.6
			stage.name = STAGES[level][elementCount].name
			stage.image = STAGES[level][elementCount].image
			stage.level = level
			stage:addEventListener("tap", startGame)
			stagesGrp:insert(stage)

			if elementCount < 20 then
				elementCount = elementCount + 1
			end
		end
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
	back:addEventListener("tap", gotoLevelSelection)
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
		level = event.params
		
		generateStages()
		parameters = ""

    elseif ( phase == "did" ) then
        
    end
end

function game:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
		
		display.remove(stagesGrp)
        
	elseif ( phase == "did" ) then
    end
end
----------------------------------------------- Execution
game:addEventListener( "create" )
game:addEventListener( "destroy" )
game:addEventListener( "hide" )
game:addEventListener( "show" )

return game






