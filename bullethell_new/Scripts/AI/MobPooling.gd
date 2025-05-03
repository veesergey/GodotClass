extends Node2D

var mob_scene: PackedScene = preload("res://AI/snake_mob.tscn")
var pool_size: int = 10
var mob_pool: Array = []
@onready var timer: Timer = get_node("Timer")


func _ready() -> void:
	for i in range(pool_size):
		var mobTemp: Node = mob_scene.instantiate()
		mobTemp.hide()
		mob_pool.append(mobTemp)
		add_child(mobTemp)
		
		
func get_mob() -> Node:
	for mob in mob_pool:
		if not mob.visible:
			return mob
	var new_mob: Node = mob_scene.instantiate()
	new_mob.hide()
	mob_pool.append(new_mob)
	add_child(new_mob)
	return new_mob
	
func reset_mob(mob: Node) -> void:
	mob.position = Vector2(-1000, -1000)
	mob.isAlive = false
	mob.get_node("CollisionShape2D").disabled = false
	mob.hide()


func _on_timer_timeout() -> void:
	var mobTemp: Node = get_mob()
	mobTemp.global_position = self.global_position
	mobTemp.show()
	pass # Replace with function body.
