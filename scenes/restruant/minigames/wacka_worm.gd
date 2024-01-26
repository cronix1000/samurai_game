extends CanvasLayer

var worm = preload("res://scenes/restruant/minigames/worm.tscn")
@onready var spawn_points = $WormPoints
const WORM_TIMER = 1.5
var time = 0
var worm_spawned
var points = 0
signal completed

func _process(delta):
	time += delta
	if(time > WORM_TIMER):
		var inst_worm = worm.instantiate()
		var point = spawn_points.get_point_position(randi_range(0, spawn_points.get_point_count() -1 ))
		inst_worm.position = point
		add_child(inst_worm)
		time = 0
		inst_worm.connect("pressed", Callable(self, "add_point"))
	if(points > 5):
		await get_tree().create_timer(1.5).timeout
		emit_signal("completed")
		queue_free()
	
		
func add_point():
	points += 1
	
	
