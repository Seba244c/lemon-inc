extends CanvasLayer

onready var buildModeText = get_node("Shop Inf/Label3")
onready var typeSelection = get_node("Panel")

# Called when the node enters the scene tree for the first time.
func _ready():
	typeSelection.hide()
	pass # Replace with function body.


func buildMode(enabled):
	var t = ""
	if enabled:
		typeSelection.show()
		t = "Press b to exit build mode"
	else:
		typeSelection.hide()
		t = "Press b to enter build mode"
	buildModeText.text = t
