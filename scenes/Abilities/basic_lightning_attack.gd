extends Node

var cooldown: int = 1
@onready var timer: Timer = $Timer
var bullets: int =  0

func basic_attack(s, _cooldown: float):
	if(timer.is_stopped()):
		timer.start()
	if(bullets > 0):
		timer.wait_time = _cooldown
		var f : PackedScene = load("res://scenes/Abilities/basic_lightning.tscn")
		var f_node_right : Node = f.instantiate()
		var f_node_left : Node = f.instantiate()
		f_node_right.controller = s
		f_node_right.position = s.global_position
		f_node_right.add_collision_exception_with(s)
		f_node_left.controller = s
		f_node_left.opposite = -1
		f_node_left.position = s.global_position
		f_node_left.add_collision_exception_with(s)
		
		get_node("/root").add_child(f_node_right)
		get_node("/root").add_child(f_node_left)
		bullets -= 1



func _on_timer_timeout():
		bullets+=1
