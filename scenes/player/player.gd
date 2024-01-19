extends Entity
var limb_state
var state : State
var state_factory

func _ready():
	state_factory = StateFactory.new()
	change_state("idle")


func _process(delta):
	if(Input.is_action_pressed("Left")):
		move_left()
	if(Input.is_action_pressed("Right")):
		move_right()
	
func move_left():
	state.move_left()

func move_right():
	state.move_right()

func change_state(new_state_name):
	if state != null:
		state.queue_free()
	state = state_factory.get_state(new_state_name).new()
	state.setup(Callable(self, "change_state"), $AnimationPlayer,$CharacterSprite ,self)
	state.name = "current_state"
	add_child(state)

