# idle_state.gd

extends State

class_name IdleState	

func _ready():
	animation_player.play("idle")

func _process(delta):
		if !persistent_state.is_on_floor():
			persistent_state.velocity.y += 30
		else:
			persistent_state.velocity.y += 0	

func _flip_direction():
	character_sprite.flip_h = not character_sprite.flip_h

func move_left():
	if character_sprite.flip_h:
		change_state.call("run")
	else:
		_flip_direction()

func move_right():
	if not character_sprite.flip_h:
		change_state.call("run")
	else:
		_flip_direction()
