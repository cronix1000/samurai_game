extends CanvasLayer

var tomato = preload("res://scenes/restruant/minigames/falling_lemon.tscn")

const TOMATO_SPAWN_TIMER = 1.3
var time = 0
@onready var spawn_points = $spawn_points
@onready var label = $Label
var points = 0
signal completed

func _process(delta):
	time += delta
	if(time > TOMATO_SPAWN_TIMER):
		var tomato_inst = tomato.instantiate()
		var point = spawn_points.get_point_position(randi_range(0, spawn_points.get_point_count() -1 ))
		tomato_inst.global_position = point
		tomato_inst.get_child(2).connect("mouse_entered", Callable(self, "add_point"))
		add_child(tomato_inst)
		time = 0
	if(points > 5):
		label.text = "Congrats you cut the tomatos"
		await get_tree().create_timer(1.5).timeout
		emit_signal("completed")
		queue_free()
		get_parent().queue_free()
		
func add_point():
	points += 1
	
