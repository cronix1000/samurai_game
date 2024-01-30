extends CharacterBody2D

@onready var attack_sound = $attack_sound
@onready var animation = $AnimationPlayer
@onready var sprite = $CharacterSprite
@onready var hitbox = $HitBox

const SPEED = 200
var direction
var attacking : bool

func _ready():
	animation.play("idle")
	sprite.flip_h = true
	hitbox.scale.x = -1
	hitbox.monitoring = false

func _process(_delta):
	if Input.is_action_just_pressed("Attack") and !attacking:
		attacking = true
		hitbox.monitoring = true
		attack()
		attack_sound.play()

func _physics_process(_delta):
	direction = Input.get_axis("Left", "Right")
	
	if direction < 0:
		sprite.flip_h = true
		hitbox.scale.x = -1
	elif direction > 0 :
		sprite.flip_h = false
		hitbox.scale.x = 1

	if direction and !attacking:
		velocity.x = direction * SPEED
		animation.play("move")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if !attacking:
			animation.play("idle")
	
	move_and_slide()

func attack():
	animation.play("attack")
	await get_tree().create_timer(0.35).timeout
	attacking = false
	hitbox.monitoring = false
	animation.play("idle")

func _on_hit_box_body_entered(body):
	if body.has_method("takeDamage"):
		body.takeDamage(GameManager.attack_damage)
