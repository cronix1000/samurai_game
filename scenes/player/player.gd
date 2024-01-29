extends Entity
@onready var hitbox = $hit_box
@onready var attack_sound = $attack_sound

func _process(delta):
	if(Input.is_action_pressed("Left")):
		move_left()
		hitbox.scale.x = -1
	if(Input.is_action_pressed("Right")):
		move_right()
		hitbox.scale.x = 1
	if(Input.is_action_just_pressed("Attack")):
		attack()
		attack_sound.play()
	

func attack():
	player.play("attack")
	await get_tree().create_timer(0.35).timeout
	change_state("idle")
	pass
func _on_has_died():
	queue_free()
	
func _ready():
	state_factory = StateFactory.new()
	change_state("idle")
	hitbox.damage = GameManager.attack_damage
	movement_speed = GameManager.speed

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "attack()"):
		#change_state("idle")
		pass
