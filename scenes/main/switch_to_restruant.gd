extends Area2D



func _on_body_entered(body):
	if body.is_in_group("player"):
		GameManager.return_to_home()
		get_parent().free()
	
