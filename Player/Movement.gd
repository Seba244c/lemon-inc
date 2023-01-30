extends KinematicBody2D
#const ACCELERATION = 400
const MAX_SPEED = 90
#const FRICTION = 650
var velocity = Vector2.ZERO

#onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_move_right") - Input.get_action_strength("ui_move_left")
	input_vector.y = Input.get_action_strength("ui_move_down") - Input.get_action_strength("ui_move_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
#		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		velocity = input_vector * MAX_SPEED
	else:
		animationState.travel("Idle")
		velocity = Vector2.ZERO
#		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta) 
	
	move_and_slide(velocity)

func tpToTransition(trans):
	position.x = trans.global_position.x
	position.y = trans.global_position.y
