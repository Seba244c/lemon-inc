extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var startingSceneResource = load("res://scenes/shop.tscn")
	var startingScene = startingSceneResource.instance()

	add_child(startingScene)
	#load_game()

func changeSceneTo(sceneName, posGoal):
	var current = get_child(0)
	remove_child(current)
	current.call_deferred("free")
	
	var sceneResource = load("res://scenes/"+sceneName+".tscn")
	var scene = sceneResource.instance()
	
	scene.get_node("./Objs/Player")
	
	add_child(scene)
	
	var pos = get_node(sceneName+"/Transitions/"+posGoal + "/EnterSpot")
	var player = get_node(sceneName+"/Objs/Player")
	player.tpToTransition(pos)
