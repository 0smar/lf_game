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
		[1] = {name = "UVM", image = "uvm.jpg"},
		[2] = {name = "De la Rosa", image = "delarosa.jpg"},
		[3] = {name = "Conacyt", image = "conacyt.jpg"},
		[4] = {name = "Bardahl", image = "bardahl.jpg"},
		[5] = {name = "Mastretta", image = "mastretta.jpg"},
		[6] = {name = "Tortas Hipocampo", image = "tortaslocashipocampo.jpg"},
		[7] = {name = "Tia Rosa", image = "tiarosa.jpg"},
		[8] = {name = "Manzanita Sol", image = "manzanitasol.jpg"},
		[9] = {name = "Partido Verde", image = "verde.jpg"},
		[10] = {name = "Prendalana", image = "prendalana.jpg"},
		[11] = {name = "Manhattan", image = "manhattan.jpg"},
		[12] = {name = "Kumon", image = "kumon.jpg"},
		[13] = {name = "Omnilife", image = "omnilife.jpg"},
		[14] = {name = "Latincasa", image = "latincasa.jpg"},
		[15] = {name = "Ilusion", image = "ilusion.jpg"},
		[16] = {name = "D Paul", image = "dpaul.jpg"},
		[17] = {name = "Aeromexico", image = "aeromexico.jpg"},
		[18] = {name = "Mens Factory", image = "mensfactory.jpg"},
		[19] = {name = "Don Julio", image = "donjulio.jpg"},
		[20] = {name = "Devlyn", image = "devlyn.jpg"}
	},
	[2] = {
		[1] = {name = "Flexi", image = "flexi.jpg"},
		[2] = {name = "Gandhi", image = "gandhi.jpg"},
		[3] = {name = "Iberia", image = "iberia.jpg"},
		[4] = {name = "Las Alitas", image = "lasalitas.jpg"},
		[5] = {name = "Potzollcalli", image = "potzollcalli.jpg"},
		[6] = {name = "La Chata", image = "lachata.jpg"},
		[7] = {name = "Prendamex", image = "prendamex.jpg"},
		[8] = {name = "Dolphy", image = "dolphy.jpg"},
		[9] = {name = "Sello Rojo", image = "sellorojo.jpg"},
		[10] = {name = "Italian Coffee", image = "italiancoffee.jpg"},
		[11] = {name = "Dico", image = "dico.jpg"},
		[12] = {name = "Iusacell", image = "iusacell.jpg"},
		[13] = {name = "La Sierra", image = "lasierra.jpg"},
		[14] = {name = "La Botana", image = "labotana.jpg"},
		[15] = {name = "Cafe Oro", image = "cafeoro.jpg"},
		[16] = {name = "Grupo Senda", image = "Gruposenda.jpg"},
		[17] = {name = "La Moderna", image = "lamoderna.jpg"},
		[18] = {name = "Muebles Troncoso", image = "mueblestroncoso.jpg"},
		[19] = {name = "Mexicana", image = "amexicana.jpg"},
		[20] = {name = "El Mayorista", image = "elmayorista.jpg"}
	},
	[3] = {
		[1] = {name = "Futura", image = "futura.jpg"},
		[2] = {name = "Viana", image = "viana.jpg"},
		[3] = {name = "Vitacilina", image = "vitacilina.jpg"},
		[4] = {name = "Colchones Atlas", image = "colchonesatlas.jpg"},
		[5] = {name = "La Europea", image = "laeuropea.jpg"},
		[6] = {name = "Carranco", image = "carranco.jpg"},
		[7] = {name = "Nacional Monte de Piedad", image = "montedepiedad.jpg"},
		[8] = {name = "Mr Fish", image = "mrfish.jpg"},
		[9] = {name = "Nutrisa", image = "nutrisa.jpg"},
		[10] = {name = "Caballitos", image = "caballitos.jpg"},
		[11] = {name = "Verde Valle", image = "verdevalle.jpg"},
		[12] = {name = "Tintoreria Max", image = "tintoreriamax.jpg"},
		[13] = {name = "Jiffy Express", image = "jiffyexpress.jpg"},
		[14] = {name = "Mixup", image = "mixup.jpg"},
		[15] = {name = "Lala", image = "lala.jpg"},
		[16] = {name = "Cinepolis", image = "cinepolis.jpg"},
		[17] = {name = "Fundacion Donde", image = "fundaciondonde.jpg"},
		[18] = {name = "Tec Milenio", image = "tecmilenio.jpg"},
		[19] = {name = "Pressto", image = "pressto.jpg"},
		[20] = {name = "Nivea", image = "nivea.jpg"}
	},
	[4] = {
		[1] = {name = "Bodega Aurrera", image = "bodegaaurrera.jpg"},
		[2] = {name = "Cemex", image = "cemex.jpg"},
		[3] = {name = "Herdez", image = "herdez.jpg"},
		[4] = {name = "Circo Atayde Hermanos", image = "circoataydehermanos.jpg"},
		[5] = {name = "Misternnis", image = "misternnis.jpg"},
		[6] = {name = "3 Hermanos", image = "treshermanos.jpg"},
		[7] = {name = "Volaris", image = "volaris.jpg"},
		[8] = {name = "Universidad Anahuac", image = "universidadanahuac.jpg"},
		[9] = {name = "Morena", image = "morena.jpg"},
		[10] = {name = "El Almacen", image = "elalmacen.jpg"},
		[11] = {name = "Star", image = "star.jpg"},
		[12] = {name = "Montes", image = "montes.jpg"},
		[13] = {name = "Cementos Fortaleza", image = "cementosfortaleza.jpg"},
		[14] = {name = "Alpura", image = "alpura.jpg"},
		[15] = {name = "Hermanos Vazquez", image = "hermanosvazquez.jpg"},
		[16] = {name = "Televisa", image = "televisa.jpg"},
		[17] = {name = "Elektra", image = "elektra.jpg"},
		[18] = {name = "Costanzo", image = "costanzo.jpg"},
		[19] = {name = "Sushilito", image = "sushilito.jpg"},
		[20] = {name = "Famsa", image = "famsa.jpg"}
	},
	[5] = {
		[1] = {name = "Farmacias ABC", image = "farmaciasabc.jpg"},
		[2] = {name = "Interjet", image = "interjet.jpg"},
		[3] = {name = "Cablecom", image = "cablecom.jpg"},
		[4] = {name = "Rotoplas", image = "rotoplas.jpg"},
		[5] = {name = "Oxxo", image = "oxxo.jpg"},
		[6] = {name = "Farmatodo", image = "farmatodo.jpg"},
		[7] = {name = "Freddy", image = "freddy.jpg"},
		[8] = {name = "Steren", image = "steren.jpg"},
		[9] = {name = "Aldo Conti", image = "aldoconti.jpg"},
		[10] = {name = "Padrisimo", image = "padrisimo.jpg"},
		[11] = {name = "La Gloria", image = "lagloria.jpg"},
		[12] = {name = "El Pollo Loco", image = "elpolloloco.jpg"},
		[13] = {name = "Jarritos", image = "jarritos.jpg"},
		[14] = {name = "Caritas", image = "caritas.jpg"},
		[15] = {name = "Inmaculada", image = "inmaculada.jpg"},
		[16] = {name = "Roshfrans", image = "roshfrans.jpg"},
		[17] = {name = "Tony Papelerias", image = "papeleriastony.jpg"},
		[18] = {name = "Fresh Salads", image = "freshsalads.jpg"},
		[19] = {name = "Santa Clara", image = "santaclara.jpg"},
		[20] = {name = "Salinas y Rocha", image = "salinasyrocha.jpg"}
	}
}

----------------------------------------------- Functions

local function gotoLevelSelection(event)
	composer.gotoScene("levelSelection", {effect ="fromLeft"})
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
		
		

    elseif ( phase == "did" ) then
        generateStages()
		parameters = ""
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






