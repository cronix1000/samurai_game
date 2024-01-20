extends State

class_name RunState

var move_speed = 175
var min_move_speed = 0.005
var friction = 0.32

func _ready():
	animation_player.play("move")
	#move_speed = persistent_state.movement_speed
	if character_sprite.flip_h:
		move_speed *= -1
	persistent_state.velocity.x += move_speed

func _physics_process(_delta):
	if !persistent_state.is_on_floor():
			persistent_state.velocity.y += 30
	else:
		persistent_state.velocity.y += 0	
	if abs(persistent_state.velocity.x) < min_move_speed:
		change_state.call("idle")
	persistent_state.velocity.x *= friction
	persistent_state.move_and_slide()

func move_left():
	if character_sprite.flip_h:
		persistent_state.velocity.x += move_speed
	else:
		change_state.call("idle")

func move_right():
	if not character_sprite.flip_h:
		persistent_state.velocity.x += move_speed
	else:
		change_state.call("idle")
