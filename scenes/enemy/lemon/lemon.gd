extends EnemyBase
@export var attack_range := 150

var item 
@onready var animation = $AnimationPlayer
@onready var sprite = $CharacterSprite
@onready var target = $"../../player"

const SPEED = 30
var direction
var reached : bool
var hit : bool
var attacking : bool
var health = 5
var fire_ball = load_ability("basic_lightning_attack")

func _ready():
	animation.play("idle")
	direction = get_parent().position + Vector2(randi_range(-150,150),0)

func _process(_delta):
	if !attacking:
		if global_position.x - direction.x < 0:
			sprite.flip_h = true
		elif global_position.x - direction.x  > 0 :
			sprite.flip_h = false
	
	if reached:
		getDestination()

func _physics_process(delta):
	if !hit and !attacking:
		if global_position.distance_to(direction) > 0.5 and !reached:
			global_position = global_position.move_toward(direction,SPEED * delta)
			animation.play("move")
		else:
			reached = true
			animation.play("idle")

func getDestination():
	await get_tree().create_timer(randi_range(2,5)).timeout
	while global_position.distance_to(direction) < 20:
		direction = get_parent().position + Vector2(randi_range(-150,150),0)
	reached = false

func takeDamage(damage):
	hit = true
	health -= damage
	animation.play("hit")
	
	await get_tree().create_timer(0.2).timeout
	
	if health <= 0:
		item = GameManager.get_item_by_key("lemon")
		inventory.add_item(item)
		queue_free()
	
	hit = false

func attack():
	await get_tree().create_timer(randi_range(2,3)).timeout
	while attacking:
		if !hit:
			animation.play("attack")
			fire_ball.basic_attack(self)
		await get_tree().create_timer(randi_range(2,3)).timeout

func _on_attack_range_body_entered(body):
	if body.is_in_group("player"):
		if body.position.x > global_position.x:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		attacking = true
		attack()

func _on_attack_range_body_exited(body):
	if body.is_in_group("player"):
		attacking = false

func get_aim_position():
	return target.position
