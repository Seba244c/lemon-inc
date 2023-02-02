extends TileMap

class TileData:
	var pos: Vector2
	var data: int
	
	func toJson():
		return {"pos":var2str(pos),"data":data}
	
	func fromJson(json):
		pos = str2var(json["pos"])
		data = json["data"]

func getMapMousePos(mouse):
	var tile_pos = world_to_map(mouse)
	return tile_pos

func save():
	var cells = get_used_cells()
	var arr = []
	for cell in cells:
		var td = TileData.new()
		td.pos = cell
		td.data = get_cellv(cell)
		arr.append(td.toJson())
	return {"MagicalTileMap": arr}

func loadFromArr(arr):
	var data = TileData.new()
	for cell in arr:
		data.fromJson(cell)
		set_cellv(data.pos, data.data)

func _enter_tree():
	load_game()

func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://"+name+".save"):
		return # We don't have a save to load
	
	# Load the file
	save_game.open("user://"+name+".save", File.READ)
	while save_game.get_position() < save_game.get_len():
		var node_data = parse_json(save_game.get_line())
		loadFromArr(node_data["MagicalTileMap"])
		
	save_game.close()

func _exit_tree():
	var save_game = File.new()
	save_game.open("user://" + name + ".save", File.WRITE)

	save_game.store_line(to_json(save()))
	save_game.close()
