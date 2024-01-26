extends TextureButton





func _on_pressed():
	queue_free()


func _on_timer_timeout():
	queue_free() # Replace with function body.
