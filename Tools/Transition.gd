extends Area2D

export(String) var SceneTo = "World"
export(String) var PosGoal = "1"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func body_entered(body):
	if body.name == "Player":
		var base = get_tree().root.get_child(0)
		base.call_deferred("changeSceneTo", SceneTo, PosGoal)
