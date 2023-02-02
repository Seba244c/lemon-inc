extends Node2D

var buildMode = false
onready var floorTiles = get_node("Floor Tiles/Floor TileMap")
onready var shopGUI = get_node("ShopGUI")
onready var floorTileSelect = get_node("ShopGUI/Panel/TabContainer/Floor Tiles/ScrollContainer/HBoxContainer")

func _input(event):
	if event.is_action_pressed("BuildModeToggle"):
		var player = get_node("Objs/Player")
		buildMode = !buildMode
		
		# Change to correct mode
		if(buildMode):
			player.hide()
		else:
			player.show()
		shopGUI.buildMode(buildMode)

func _unhandled_input(e):
	if(!buildMode): return
	
	# Non Floor Mode
	#if e is InputEventMouseButton:
	#	if e.button_index == 1:
	#		var mouse_pos = get_global_mouse_position()
	#		var cell = floorTiles.getMapMousePos(mouse_pos)
	#		
	#		var currentTile = floorTiles.get_cellv(cell)
	#		floorTiles.set_cellv(cell, 1);
	
	
	# Floor Mode
	if e is InputEventMouse:
		if e.button_mask == 1:
			if floorTileSelect.currentTileID == -1: return
			var mouse_pos = get_global_mouse_position()
			var cell = floorTiles.getMapMousePos(mouse_pos)
			
			var currentTile = floorTiles.get_cellv(cell)
			floorTiles.set_cellv(cell, floorTileSelect.currentTileID);


