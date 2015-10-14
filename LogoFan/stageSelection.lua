----------------------------------------------- Home
local composer = require("composer")
local json = require("json")
local loadsave = require("loadsave")

local game = composer.newScene() 
----------------------------------------------- Variables

local backgroundLayer
local textLayer

local level
local parameters
local stagesGrp
local stagesList

----------------------------------------------- Constants

local color_bg = {26/255, 29/255, 38/255}
local color_button = {41/255, 44/255, 53/255}
local color_buttonStroke = {119/255, 122/255, 129/255}
local color_font = {213/255, 218/255, 186/255}

local PADDING_STAGE = 140
local VPADDING_STAGE = 140

--local STAGES = {
--	[1] = {
--		[1] = {name = "UVM", image = "uvm.jpg"},
--		[2] = {name = "De la Rosa", image = "delarosa.jpg"},
--		[3] = {name = "Conacyt", image = "conacyt.jpg"},
--		[4] = {name = "Bardahl", image = "bardahl.jpg"},
--		[5] = {name = "Mastretta", image = "mastretta.jpg"},
--		[6] = {name = "Tortas Hipocampo", image = "hipocampo.jpg"},
--		[7] = {name = "Tia Rosa", image = "tiarosa.jpg"},
--		[8] = {name = "Manzanita Sol", image = "manzanitasol.jpg"},
--		[9] = {name = "Partido Verde", image = "verde.jpg"},
--		[10] = {name = "Prendalana", image = "prendalana.jpg"},
--		[11] = {name = "Manhattan", image = "manhattan.jpg"},
--		[12] = {name = "Kumon", image = "kumon.jpg"},
--		[13] = {name = "Omnilife", image = "omnilife.jpg"},
--		[14] = {name = "Latincasa", image = "latincasa.jpg"},
--		[15] = {name = "Ilusion", image = "ilusion.jpg"},
--		[16] = {name = "D Paul", image = "dpaul.jpg"},
--		[17] = {name = "Aeromexico", image = "aeromexico.jpg"},
--		[18] = {name = "Mens Factory", image = "mensfactory.jpg"},
--		[19] = {name = "Don Julio", image = "donjulio.jpg"},
--		[20] = {name = "Devlyn", image = "devlyn.jpg"}
--	},
--	[2] = {
--		[1] = {name = "Flexi", image = "flexi.jpg"},
--		[2] = {name = "Gandhi", image = "gandhi.jpg"},
--		[3] = {name = "Iberia", image = "iberia.jpg"},
--		[4] = {name = "Las Alitas", image = "lasalitas.jpg"},
--		[5] = {name = "Potzollcalli", image = "potzollcalli.jpg"},
--		[6] = {name = "La Chata", image = "lachata.jpg"},
--		[7] = {name = "Prendamex", image = "prendamex.jpg"},
--		[8] = {name = "Dolphy", image = "dolphy.jpg"},
--		[9] = {name = "Sello Rojo", image = "sellorojo.jpg"},
--		[10] = {name = "Italian Coffee", image = "italiancoffee.jpg"},
--		[11] = {name = "Dico", image = "dico.jpg"},
--		[12] = {name = "Iusacell", image = "iusacell.jpg"},
--		[13] = {name = "La Sierra", image = "lasierra.jpg"},
--		[14] = {name = "La Botana", image = "labotana.jpg"},
--		[15] = {name = "Cafe Oro", image = "cafeoro.jpg"},
--		[16] = {name = "Grupo Senda", image = "Gruposenda.jpg"},
--		[17] = {name = "La Moderna", image = "lamoderna.jpg"},
--		[18] = {name = "Muebles Troncoso", image = "mueblestroncoso.jpg"},
--		[19] = {name = "Mexicana", image = "amexicana.jpg"},
--		[20] = {name = "El Mayorista", image = "elmayorista.jpg"}
--	},
--	[3] = {
--		[1] = {name = "Futura", image = "futura.jpg"},
--		[2] = {name = "Viana", image = "viana.jpg"},
--		[3] = {name = "Vitacilina", image = "vitacilina.jpg"},
--		[4] = {name = "Colchones Atlas", image = "colchonesatlas.jpg"},
--		[5] = {name = "La Europea", image = "laeuropea.jpg"},
--		[6] = {name = "Carranco", image = "carranco.jpg"},
--		[7] = {name = "Nacional Monte de Piedad", image = "montedepiedad.jpg"},
--		[8] = {name = "Mr Fish", image = "mrfish.jpg"},
--		[9] = {name = "Nutrisa", image = "nutrisa.jpg"},
--		[10] = {name = "Caballitos", image = "caballitos.jpg"},
--		[11] = {name = "Verde Valle", image = "verdevalle.jpg"},
--		[12] = {name = "Tintoreria Max", image = "tintoreriamax.jpg"},
--		[13] = {name = "Jiffy Express", image = "jiffyexpress.jpg"},
--		[14] = {name = "Mixup", image = "mixup.jpg"},
--		[15] = {name = "Lala", image = "lala.jpg"},
--		[16] = {name = "Cinepolis", image = "cinepolis.jpg"},
--		[17] = {name = "Fundacion Donde", image = "fundaciondonde.jpg"},
--		[18] = {name = "Tec Milenio", image = "tecmilenio.jpg"},
--		[19] = {name = "Pressto", image = "pressto.jpg"},
--		[20] = {name = "Nivea", image = "nivea.jpg"}
--	},
--	[4] = {
--		[1] = {name = "Bodega Aurrera", image = "bodegaaurrera.jpg"},
--		[2] = {name = "Cemex", image = "cemex.jpg"},
--		[3] = {name = "Herdez", image = "herdez.jpg"},
--		[4] = {name = "Circo Atayde Hermanos", image = "circoataydehermanos.jpg"},
--		[5] = {name = "Misternnis", image = "misternnis.jpg"},
--		[6] = {name = "3 Hermanos", image = "treshermanos.jpg"},
--		[7] = {name = "Volaris", image = "volaris.jpg"},
--		[8] = {name = "Universidad Anahuac", image = "universidadanahuac.jpg"},
--		[9] = {name = "Morena", image = "morena.jpg"},
--		[10] = {name = "El Almacen", image = "elalmacen.jpg"},
--		[11] = {name = "Star", image = "star.jpg"},
--		[12] = {name = "Montes", image = "montes.jpg"},
--		[13] = {name = "Cementos Fortaleza", image = "cementosfortaleza.jpg"},
--		[14] = {name = "Alpura", image = "alpura.jpg"},
--		[15] = {name = "Hermanos Vazquez", image = "hermanosvazquez.jpg"},
--		[16] = {name = "Televisa", image = "televisa.jpg"},
--		[17] = {name = "Elektra", image = "elektra.jpg"},
--		[18] = {name = "Costanzo", image = "costanzo.jpg"},
--		[19] = {name = "Sushilito", image = "sushilito.jpg"},
--		[20] = {name = "Famsa", image = "famsa.jpg"}
--	},
--	[5] = {
--		[1] = {name = "Farmacias ABC", image = "farmaciasabc.jpg"},
--		[2] = {name = "Interjet", image = "interjet.jpg"},
--		[3] = {name = "Cablecom", image = "cablecom.jpg"},
--		[4] = {name = "Rotoplas", image = "rotoplas.jpg"},
--		[5] = {name = "Oxxo", image = "oxxo.jpg"},
--		[6] = {name = "Farmatodo", image = "farmatodo.jpg"},
--		[7] = {name = "Freddy", image = "freddy.jpg"},
--		[8] = {name = "Steren", image = "steren.jpg"},
--		[9] = {name = "Aldo Conti", image = "aldoconti.jpg"},
--		[10] = {name = "Padrisimo", image = "padrisimo.jpg"},
--		[11] = {name = "La Gloria", image = "lagloria.jpg"},
--		[12] = {name = "El Pollo Loco", image = "elpolloloco.jpg"},
--		[13] = {name = "Jarritos", image = "jarritos.jpg"},
--		[14] = {name = "Caritas", image = "caritas.jpg"},
--		[15] = {name = "Inmaculada", image = "inmaculada.jpg"},
--		[16] = {name = "Roshfrans", image = "roshfrans.jpg"},
--		[17] = {name = "Tony Papelerias", image = "papeleriastony.jpg"},
--		[18] = {name = "Fresh Salads", image = "freshsalads.jpg"},
--		[19] = {name = "Santa Clara", image = "santaclara.jpg"},
--		[20] = {name = "Salinas y Rocha", image = "salinasyrocha.jpg"}
--	}
--}

local STAGES = {
	[1] = {name = "UVM", image = "uvm.jpg", clared = false},
	[2] = {name = "De la Rosa", image = "delarosa.jpg", clared = false},
	[3] = {name = "Conacyt", image = "conacyt.jpg", clared = false},
	[4] = {name = "Bardahl", image = "bardahl.jpg", clared = false},
	[5] = {name = "Mastretta", image = "mastretta.jpg", clared = false},
	[6] = {name = "Tortas Hipocampo", image = "hipocampo.jpg", clared = false},
	[7] = {name = "Tia Rosa", image = "tiarosa.jpg", clared = false},
	[8] = {name = "Manzanita Sol", image = "manzanitasol.jpg", clared = false},
	[9] = {name = "Partido Verde", image = "verde.jpg", clared = false},
	[10] = {name = "Prendalana", image = "prendalana.jpg", clared = false},
	[11] = {name = "Manhattan", image = "manhattan.jpg", clared = false},
	[12] = {name = "Kumon", image = "kumon.jpg", clared = false},
	[13] = {name = "Omnilife", image = "omnilife.jpg", clared = false},
	[14] = {name = "Latincasa", image = "latincasa.jpg", clared = false},
	[15] = {name = "Ilusion", image = "ilusion.jpg", clared = false},
	[16] = {name = "D Paul", image = "dpaul.jpg", clared = false},
	[17] = {name = "Aeromexico", image = "aeromexico.jpg", clared = false},
	[18] = {name = "Mens Factory", image = "mensfactory.jpg", clared = false},
	[19] = {name = "Don Julio", image = "donjulio.jpg", clared = false},
	[20] = {name = "Devlyn", image = "devlyn.jpg", clared = false},
	[21] = {name = "Flexi", image = "flexi.jpg", clared = false},
	[22] = {name = "Gandhi", image = "gandhi.jpg", clared = false},
	[23] = {name = "Iberia", image = "iberia.jpg", clared = false},
	[24] = {name = "Las Alitas", image = "lasalitas.jpg", clared = false},
	[25] = {name = "Potzollcalli", image = "potzollcalli.jpg", clared = false},
	[26] = {name = "La Chata", image = "lachata.jpg", clared = false},
	[27] = {name = "Prendamex", image = "prendamex.jpg", clared = false},
	[28] = {name = "Dolphy", image = "dolphy.jpg", clared = false},
	[29] = {name = "Sello Rojo", image = "sellorojo.jpg", clared = false},
	[30] = {name = "Italian Coffee", image = "italiancoffee.jpg", clared = false},
	[31] = {name = "Dico", image = "dico.jpg", clared = false},
	[32] = {name = "Iusacell", image = "iusacell.jpg", clared = false},
	[33] = {name = "La Sierra", image = "lasierra.jpg", clared = false},
	[34] = {name = "La Botana", image = "labotana.jpg", clared = false},
	[35] = {name = "Cafe Oro", image = "cafeoro.jpg", clared = false},
	[36] = {name = "Grupo Senda", image = "Gruposenda.jpg", clared = false},
	[37] = {name = "La Moderna", image = "lamoderna.jpg", clared = false},
	[38] = {name = "Muebles Troncoso", image = "mueblestroncoso.jpg", clared = false},
	[39] = {name = "Mexicana", image = "amexicana.jpg", clared = false},
	[40] = {name = "El Mayorista", image = "elmayorista.jpg", clared = false},
	[41] = {name = "Futura", image = "futura.jpg", clared = false},
	[42] = {name = "Viana", image = "viana.jpg", clared = false},
	[43] = {name = "Vitacilina", image = "vitacilina.jpg", clared = false},
	[44] = {name = "Colchones Atlas", image = "colchonesatlas.jpg", clared = false},
	[45] = {name = "La Europea", image = "laeuropea.jpg", clared = false},
	[46] = {name = "Carranco", image = "carranco.jpg", clared = false},
	[47] = {name = "Nacional Monte de Piedad", image = "montedepiedad.jpg", clared = false},
	[48] = {name = "Mr Fish", image = "mrfish.jpg", clared = false},
	[49] = {name = "Nutrisa", image = "nutrisa.jpg", clared = false},
	[50] = {name = "Caballitos", image = "caballitos.jpg", clared = false},
	[51] = {name = "Verde Valle", image = "verdevalle.jpg", clared = false},
	[52] = {name = "Tintoreria Max", image = "tintoreriamax.jpg", clared = false},
	[53] = {name = "Jiffy Express", image = "jiffyexpress.jpg", clared = false},
	[54] = {name = "Mixup", image = "mixup.jpg", clared = false},
	[55] = {name = "Lala", image = "lala.jpg", clared = false},
	[56] = {name = "Cinepolis", image = "cinepolis.jpg", clared = false},
	[57] = {name = "Fundacion Donde", image = "fundaciondonde.jpg", clared = false},
	[58] = {name = "Tec Milenio", image = "tecmilenio.jpg", clared = false},
	[59] = {name = "Pressto", image = "pressto.jpg", clared = false},
	[60] = {name = "Nivea", image = "nivea.jpg", clared = false},
	[61] = {name = "Bodega Aurrera", image = "bodegaaurrera.jpg", clared = false},
	[62] = {name = "Cemex", image = "cemex.jpg", clared = false},
	[63] = {name = "Herdez", image = "herdez.jpg", clared = false},
	[64] = {name = "Circo Atayde Hermanos", image = "circoataydehermanos.jpg", clared = false},
	[65] = {name = "Misternnis", image = "misternnis.jpg", clared = false},
	[66] = {name = "3 Hermanos", image = "treshermanos.jpg", clared = false},
	[67] = {name = "Volaris", image = "volaris.jpg", clared = false},
	[68] = {name = "Universidad Anahuac", image = "universidadanahuac.jpg", clared = false},
	[69] = {name = "Morena", image = "morena.jpg", clared = false},
	[70] = {name = "El Almacen", image = "elalmacen.jpg", clared = false},
	[71] = {name = "Star", image = "star.jpg", clared = false},
	[72] = {name = "Montes", image = "montes.jpg", clared = false},
	[73] = {name = "Cementos Fortaleza", image = "cementosfortaleza.jpg", clared = false},
	[74] = {name = "Alpura", image = "alpura.jpg", clared = false},
	[75] = {name = "Hermanos Vazquez", image = "hermanosvazquez.jpg", clared = false},
	[76] = {name = "Televisa", image = "televisa.jpg", clared = false},
	[77] = {name = "Elektra", image = "elektra.jpg", clared = false},
	[78] = {name = "Costanzo", image = "costanzo.jpg", clared = false},
	[79] = {name = "Sushilito", image = "sushilito.jpg", clared = false},
	[80] = {name = "Famsa", image = "famsa.jpg", clared = false},
	[81] = {name = "Farmacias ABC", image = "farmaciasabc.jpg", clared = false},
	[82] = {name = "Interjet", image = "interjet.jpg", clared = false},
	[83] = {name = "Cablecom", image = "cablecom.jpg", clared = false},
	[84] = {name = "Rotoplas", image = "rotoplas.jpg", clared = false},
	[85] = {name = "Oxxo", image = "oxxo.jpg", clared = false},
	[86] = {name = "Farmatodo", image = "farmatodo.jpg", clared = false},
	[87] = {name = "Freddy", image = "freddy.jpg", clared = false},
	[88] = {name = "Steren", image = "steren.jpg", clared = false},
	[89] = {name = "Aldo Conti", image = "aldoconti.jpg", clared = false},
	[90] = {name = "Padrisimo", image = "padrisimo.jpg", clared = false},
	[91] = {name = "La Gloria", image = "lagloria.jpg", clared = false},
	[92] = {name = "El Pollo Loco", image = "elpolloloco.jpg", clared = false},
	[93] = {name = "Jarritos", image = "jarritos.jpg", clared = false},
	[94] = {name = "Caritas", image = "caritas.jpg", clared = false},
	[95] = {name = "Inmaculada", image = "inmaculada.jpg", clared = false},
	[96] = {name = "Roshfrans", image = "roshfrans.jpg", clared = false},
	[97] = {name = "Tony Papelerias", image = "papeleriastony.jpg", clared = false},
	[98] = {name = "Fresh Salads", image = "freshsalads.jpg", clared = false},
	[99] = {name = "Santa Clara", image = "santaclara.jpg", clared = false},
	[100] = {name = "Salinas y Rocha", image = "salinasyrocha.jpg", clared = false}
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
		[3] = target.level,
		[4] = stagesList, 
		[5] = target.id
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
			local stageStep = elementCount + 20*(level-1)
			local stage = display.newImage("img/logos/"..stagesList[stageStep].image)
			stage.xScale = 0.25
			stage.yScale = 0.25
			stage.x = startX + (j - 1) * PADDING_STAGE
			stage.y = startY + (index - 1) * VPADDING_STAGE
			if stagesList[stageStep].cleared then
				stage.alpha = 1
			else
				stage.alpha = 0.5
			end
			stage.name = STAGES[stageStep].name
			stage.image = STAGES[stageStep].image
			stage.level = level
			stage.id = stageStep
			stage:addEventListener("tap", startGame)
			stagesGrp:insert(stage)

			if elementCount < 20 then
				elementCount = elementCount + 1
			end
		end
	end
	
	loadsave.saveTable( stagesList, "stages.json" )
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
		
		stagesList = loadsave.loadTable( "stages.json" ) or STAGES
		
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






