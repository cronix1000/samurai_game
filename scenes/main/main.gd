extends Node2D

var pressed : bool
@onready var transition : CanvasLayer = $Transition

func _ready():
	transition.show()
	transition.get_node("AnimationPlayer").play("fade_out")
	await get_tree().create_timer(1).timeout
	transition.hide()
