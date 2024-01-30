extends CharacterBody2D

@export var menu : bool

var item 
@onready var animation = $AnimationPlayer
@onready var sprite = $CharacterSprite

const SPEED = 30
var direction
var reached : bool
var hit : bool
var health = 3

func _ready():
	animation.play("idle")
	if !menu:
		direction = get_parent().position + Vector2(randi_range(-150,150),0)

func _process(_delta):
	if !menu:
		if global_position.x - direction.x < 0:
			sprite.flip_h = true
		elif global_position.x - direction.x  > 0 :
			sprite.flip_h = false
		
		if reached:
			getDestination()

func _physics_process(delta):
	if !hit and !menu:
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
		item = GameManager.get_item_by_key("lettuce")
		inventory.add_item(item)
		queue_free()
	
	hit = false
