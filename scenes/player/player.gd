extends Entity


func _process(delta):
	if(Input.is_action_pressed("Left")):
		move_left()
	if(Input.is_action_pressed("Right")):
		move_right()
	
