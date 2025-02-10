extends Node


var dynamic_objects_speed : int = 700

func _process(_delta):	
	for obj in get_tree().get_nodes_in_group("DynamicObjects"):
		obj.position.x -= _delta * dynamic_objects_speed
		pass
	
