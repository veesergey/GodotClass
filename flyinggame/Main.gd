extends Node
@export var obstacle : PackedScene
@export var coin : PackedScene


var dynamic_objects_speed : int = 700
var health_decrease_speed : int = 3
var health : float = 100
var score : float = 0
var spawned_object_position_x : int = 1700
var last_obstacle_pos : String

func _process(_delta):	
	for obj in get_tree().get_nodes_in_group("DynamicObjects"):
		obj.position.x -= _delta * dynamic_objects_speed
		
	if health > 0: 
		health -= _delta * health_decrease_speed
		$UI/HealthBar.value = health
		
		
	score += _delta
	var formatted_score : String = str(score)
	var decimal_index = formatted_score.find(".")
	formatted_score = formatted_score.left(decimal_index + 3)
	$UI/HealthBar/ScoreLabel.text = "{0}".format([formatted_score])


func _on_spawner_timer_timeout() -> void:
	var random : int = randi() % 2
	var obstacle_y : int = 200 if random == 0 else 800
	var obstacle_instance : Area2D = obstacle.instantiate()
	add_child(obstacle_instance)
	obstacle_instance.position.x = spawned_object_position_x
	
	obstacle_instance.position.y = obstacle_y
	last_obstacle_pos == "up"
	
	if random == 1: # if obstacle spawns at bottom
		obstacle_instance.scale.y *= -1
		last_obstacle_pos = "down"
		
	pass # Replace with function body.


func _on_coin_timer_timeout() -> void:
	var random_pos : int = randi() % 3 #returns 0,1,2
	var coin_instance : Area2D = coin.instantiate()
	add_child(coin_instance)
	coin_instance.position.x = spawned_object_position_x
	coin_instance.position.y = 280 + (random_pos * 200)
	pass # Replace with function body.
