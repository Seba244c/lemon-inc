extends Camera2D

onready var topLeft = $"Limits/Top Left"
onready var botRight = $"Limits/Bottom Right"

func _ready():
	limit_top = topLeft.position.y
	limit_left = topLeft.position.x
	limit_bottom = botRight.position.y
	limit_right = botRight.position.x
