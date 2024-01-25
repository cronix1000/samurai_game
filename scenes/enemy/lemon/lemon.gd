extends EnemyBase
@export var attack_range := 150

var item 
var look_direction = 1
var fire_ball = load_ability("basic_lemon_attack")

func _physics_process(delta):
	if aggro_target:
		if global_position.distance_to(aggro_target.position) <= attack_range : 
			attack()
		else:
			move_to_player()
			change_state("run")

func attack():
	fire_ball.basic_attack(self, 1.2)
	
func get_aim_position():
	if(aggro_target):
		return aggro_target.position
	
		
func move_to_player():
	if aggro_target.position.x > global_position.x:
		move_right()	
	else:
		move_left()	


func _on_has_died():
	item = GameManager.get_item_by_key("lemon")
	inventory.add_item(item)
	queue_free()
