extends Node2D

var pressed : bool
@onready var transition : CanvasLayer = $Transition

func _ready():
	transition.hide()

func _on_start_pressed():
	if !pressed:
		pressed = true
		transition.show()
		transition.get_node("AnimationPlayer").play("fade_in")
		await get_tree().create_timer(1.2).timeout
		get_tree().change_scene_to_file("res://scenes/main/main.tscn")

func _on_quit_pressed():
	get_tree().quit()
