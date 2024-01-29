extends Node2D

@export var spawn : PackedScene
@export var possible_spawns : Array = []
@export var childrenCount : int
@export var outsideCordLeft : int
@export var outsideCordRight : int
@onready var player = $"../player"
var children = []

func _ready():
	var points = get_children()
	for point in points:
		if point is Marker2D:
			possible_spawns.append(point)

func _process(_delta):
	children = get_children()
	
	if player.position.x < outsideCordLeft or player.position.x > outsideCordRight:
		for child in children:
			if child is CharacterBody2D:
				child.queue_free()

func _on_timer_timeout():
	if player.position.x > outsideCordLeft and player.position.x < outsideCordRight:
		spawn_enemy()

func spawn_enemy():
	if children.size() < childrenCount:
		var spawn_inst = spawn.instantiate()
		add_child(spawn_inst)
		spawn_inst.position = possible_spawns.pick_random().position
