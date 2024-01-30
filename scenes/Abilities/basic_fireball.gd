extends CharacterBody2D

@onready var aim_pos 
@onready var self_pos
@onready var player = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var attack_sound = $attack_sound


var speed = 200
var controller = null

# Called when the node enters the scene tree for the first time.
func _ready():
	self_pos = self.global_position
	aim_pos = controller.get_aim_position()
	velocity = self_pos.direction_to(aim_pos) * speed
	player.play("flying")
	attack_sound.play()
	if(velocity.x) < 0:
		sprite.flip_h = true
	await get_tree().create_timer(2).timeout
	queue_free()
	#Explote etc...

func _on_hurt_box_area_entered(hitbox):
	queue_free()

func _on_hit_box_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
