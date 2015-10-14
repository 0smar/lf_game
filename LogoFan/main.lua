--require "CiderDebugger";-----Main 

local composer = require("composer")

-----Variables
 

-----Constants


-----Functions
 
local function initialize()
	display.setStatusBar( display.HiddenStatusBar )
end

local function start()
	initialize()
	composer.gotoScene( "mainMenu" )
end

-----Execution

start()

