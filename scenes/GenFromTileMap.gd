extends HBoxContainer

onready var floorTileSet = load("res://Assets/TilesSets/InnerTiles.tres")
var currentTileID = -1

func tileFromTileSet(tileId: int, tileSet: TileSet):
	var tileSetTexture = tileSet.tile_get_texture(tileId)
	var rect = tileSet.tile_get_region(tileId)
	var atlas = AtlasTexture.new()
	#var texture = ImageTexture.new()
	atlas.atlas = tileSetTexture
	atlas.region = rect
	return atlas
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var tiles = floorTileSet.get_tiles_ids()
	for tile in tiles:
		var button = Button.new()
		button.size_flags_horizontal = SIZE_FILL
		button.size_flags_vertical = SIZE_FILL
		button.icon = tileFromTileSet(tile, floorTileSet)
		button.connect("pressed", self, "_button_pressed", [tile])

		add_child(button)

		button.rect_min_size = Vector2(100,100)


func _button_pressed(tileId):
	currentTileID = tileId
