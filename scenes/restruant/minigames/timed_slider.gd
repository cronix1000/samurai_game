extends CanvasLayer

const TIME_OUT = 0.0000001
@onready var slider = $HSlider
@onready var output_label = $Output
var reverse
var time = 0


func _physics_process(delta):
	time += delta
	if time > TIME_OUT:
		if(slider.value == 100):
			reverse = true
		
		if(!reverse):
			slider.value += 1
		elif(reverse):
			slider.value -= 1
			if(slider.value == 0):
				reverse = false
		time = 0
		
func _unhandled_input(event):
	if(Input.is_action_just_pressed("Attack")):
		if(slider.value > 40 && slider.value < 60):
			output_label.text = "perfect"
			get_parent().queue_free()
		else:
			output_label.text = "so close"
			
