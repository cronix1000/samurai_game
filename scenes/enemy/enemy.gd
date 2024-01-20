extends Entity
class_name EnemyBase
@export var aggro:= true
var aggro_target : Entity



func _on_aggro_range_area_entered(area):
	aggro_target = area.get_parent()



func _on_aggro_range_area_exited(area):
	aggro_target = null