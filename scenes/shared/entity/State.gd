# state.gd

extends Node

class_name State

var change_state
var animation_player : AnimationPlayer
var character_sprite : Sprite2D
var persistent_state
var velocity := Vector2(0,0)
 
# Writing _delta instead of delta here prevents the unused variable warning.
func _physics_process(_delta):
	
	persistent_state.move_and_slide()

func setup(change_state : Callable, animation_player, character_sprite,persistent_state):
	self.change_state = change_state
	self.animation_player = animation_player
	self.character_sprite = character_sprite
	self.persistent_state = persistent_state

func move_left():
	pass

func move_right():
	pass
