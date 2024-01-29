extends Area2D



func _on_body_entered(body):
	if body.is_in_group("player"):
		GameManager.switch_to_restruant()
		get_parent().free()
	
