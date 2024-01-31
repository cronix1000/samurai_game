extends Node2D

@onready var tomato = $tomato
@onready var cut_tomato = $cut_tomato

func _ready():
	await get_tree().create_timer(1.5).timeout
	queue_free()

func _process(delta):
	translate(Vector2(0, 5))
	rotate(0.05)

func _on_area_2d_mouse_entered():
	tomato.visible = false
	cut_tomato.visible = true
