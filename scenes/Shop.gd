extends Node2D

var buildMode = false
onready var floorTiles = get_node("Floor Tiles/TileMap")

func _input(event):
	if event.is_action_pressed("BuildModeToggle"):
		var player = get_node("Objs/Player")
		buildMode = !buildMode
		
		# Change to correct mode
		if(buildMode):
			player.hide()
		else:
			player.show()

func _process(delta):
	if(!buildMode): return
	
	
	
	# Floor Mode
	if(Input.is_mouse_button_pressed(1)):
		var mouse_pos = get_global_mouse_position()
		var cell = floorTiles.getMapMousePos(mouse_pos)
		
		var currentTile = floorTiles.get_cellv(cell)
		floorTiles.set_cellv(cell, 1);
