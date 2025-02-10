extends Node2D

func _process(delta):
	print(position.x)
	if position.x <= -1600:
		position.x = 0
	
	
