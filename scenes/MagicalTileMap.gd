extends TileMap

func getMapMousePos(mouse):
	var tile_pos = world_to_map(mouse)
	return tile_pos
