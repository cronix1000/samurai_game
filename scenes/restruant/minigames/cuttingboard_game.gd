extends CanvasLayer

@onready var top_points : Line2D = $line_top
@onready var bottom_points : Line2D = $line_bottom
@onready var done_cutting_image = $done_cutting
@onready var cutting_image = $pre_cutting
@onready var label = $Label
@onready var lines = $lines
var button = preload("res://scenes/restruant/minigames/timed_click.tscn")
const button_spawn_time = 1.5
var time = 0
var generate_new_sequence = true
var hits = 0
var top_point = Vector2(0,0)
var bottom_point = Vector2(0,0)
var bottom_button
var top_button 
var success = 0
signal completed

func _process(delta):
	if success < 3:
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
	else:
		cutting_image.visible = false
		done_cutting_image.visible = true
		label.text = "Congrats"
		remove_child(lines)
		await get_tree().create_timer(1.5).timeout
		emit_signal("completed")
		get_parent().queue_free()
		
func button_pressed():
	hits +=1 
	print(hits)
	if(hits >= 2):
		var line = Line2D.new()
		line.add_point(top_point)
		line.add_point(bottom_point)
		line.width = 10
		line.default_color = "#000000"
		lines.add_child(line)
		hits= 0
		success += 1
		generate_new_sequence = true
	
func reset():
	hits = 0
	generate_new_sequence = true
