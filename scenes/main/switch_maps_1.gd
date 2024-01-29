extends Area2D

@onready var camera : Camera2D = $"../Camera2D"

@export var leftCords1 : int
@export var rightCords1 : int

@export var leftCords2 : int
@export var rightCords2 : int

func _on_body_exited(body):
	if body.is_in_group("player"):
		if body.position.x - global_position.x > 0:
			camera.limit_left = leftCords1
			camera.limit_right = rightCords1
		else:
			camera.limit_left = leftCords2
			camera.limit_right = rightCords2
