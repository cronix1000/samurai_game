extends CharacterBody2D

var aim_pos 
@onready var player = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var attack_sound = $attack_sound

var speed = 200
var setDirection : bool

func _ready():
	player.play("flying")
	attack_sound.play()
	await get_tree().create_timer(2).timeout
	queue_free()
	#Explote etc...

func _physics_process(delta):
	if aim_pos:
		if !setDirection:
			if aim_pos.x > global_position.x:
				sprite.flip_h = false
			else:
				sprite.flip_h = true
				speed = - speed
			setDirection = true
		global_position.y = aim_pos.y
		global_position.x += speed * delta

func _on_hit_box_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
