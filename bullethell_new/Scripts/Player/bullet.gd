extends CharacterBody2D

func _process(delta):
	self.rotation += 1
	move_and_slide()
