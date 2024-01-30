extends CharacterBody2D

var aim_pos 
@onready var player = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var attack_sound = $attack_sound

var speed = 200
var controller = null

func _ready():
	player.play("flying")
	attack_sound.play()
	if(velocity.x) < 0:
		sprite.flip_h = true
	await get_tree().create_timer(2).timeout
	queue_free()
	#Explote etc...

func _physics_process(delta):
	if aim_pos:
		global_position.y = aim_pos.y
		global_position.x += speed * delta

func _on_hit_box_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
