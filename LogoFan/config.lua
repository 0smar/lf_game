local aspectRatio = display.pixelHeight / display.pixelWidth
application = {
	content = {
		width = aspectRatio > 1.5 and 720 or math.ceil( 1080 / aspectRatio ),
		height = aspectRatio < 1.5 and 1080 or math.ceil( 720 * aspectRatio ),
		scale = "letterBox",
		fps = 60,
		
		imageSuffix = {
			["@1x"] = 1,
            ["@2x"] = 1,
        }
	},
	notification = {
		iphone = {
			types = { "badge", "sound", "alert" }
		}
	},
}