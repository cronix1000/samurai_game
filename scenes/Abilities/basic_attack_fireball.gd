extends Node
class_name basic_attack

func basic_attack(s):
	var f : PackedScene = load("res://scenes/Abilities/basic_fireball.tscn")
	var f_node : Node = f.instantiate()
	f_node.controller = s
	f_node.position = s.global_position
	f_node.add_collision_exception_with(s)
	
	get_node("/root").add_child(f_node)
	
