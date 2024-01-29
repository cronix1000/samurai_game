extends Area2D

var inrange : bool

func _process(_delta):
	if Input.is_action_just_pressed("Interact") and inrange:
		get_tree().change_scene_to_file("res://scenes/restruant/restruant.tscn")

func _on_body_entered(body):
	if body.is_in_group("player"):
		inrange = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		inrange = false
