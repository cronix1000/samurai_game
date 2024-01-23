extends Entity
class_name EnemyBase
@export var aggro:= true
var aggro_target : Entity


func _on_aggro_range_body_entered(body):
	if(body.is_in_group("player")):
		aggro_target = body


func _on_aggro_range_body_exited(body):
	aggro_target = null
