extends Area2D



func _on_body_entered(body):
	if body.is_in_group("player"):
		GameManager.switch_maps_1()
		get_parent().free()
	
