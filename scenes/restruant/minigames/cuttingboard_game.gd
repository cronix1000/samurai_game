extends CanvasLayer

@onready var top_points : Line2D = $line_top
@onready var bottom_points : Line2D = $line_bottom
var button = preload("res://scenes/restruant/minigames/timed_click.tscn")
const button_spawn_time = 2
var time = 0
var generate_new_sequence = true
var hits = 0
var top_point = Vector2(0,0)
var bottom_point = Vector2(0,0)
var bottom_button
var top_button 



func _process(delta):
	time += delta
	if generate_new_sequence:
		bottom_point = bottom_points.get_point_position(randi() % bottom_points.get_point_count())
		top_point = top_points.get_point_position(randi() % top_points.get_point_count())
		bottom_button = button.instantiate()	
		bottom_button.position = top_point
		top_button = button.instantiate()
		top_button.position = bottom_point
		add_child(bottom_button)
		add_child(top_button)
		bottom_button.connect("pressed", Callable(self, "button_pressed"))
		top_button.connect("pressed", Callable(self, "button_pressed"))
		bottom_button.get_child(0).connect("timeout", Callable(self, "reset"))
		top_button.get_child(0).connect("timeout", Callable(self, "reset"))
		generate_new_sequence = false
		
		
func button_pressed():
	hits +=1 
	print(hits)
	if(hits >= 2):
		var line = Line2D.new()
		line.add_point(top_point)
		line.add_point(bottom_point)
		line.width = 10
		add_child(line)
		hits= 0
		generate_new_sequence = true
	
func reset():
	hits = 0
