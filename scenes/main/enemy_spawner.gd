extends Node2D


@export var spawn : PackedScene
@export var tile_map : TileMap
var spawns = 0
var possible_spawns = []

func _ready():
	possible_spawns = tile_map.get_used_cells(0)


func _on_timer_timeout():
	spawn_enemy()
	
func spawn_enemy():
	var spawn_inst = spawn.instantiate()
	spawn_inst.position = tile_map.map_to_local(possible_spawns.pick_random()) + Vector2(0, -5)
	add_child(spawn_inst)
	
