extends CharacterBody2D

func _process(delta):
	self.rotation += 1
	move_and_slide()


func _on_area_2d_body_entered(body):
	if "Player" in body.name:
		if visible and body.visible:
			Game.playerHP -= 1
			get_parent().reset_bullet(self)
			print("Player got hit. Player HP: %d" % Game.playerHP)
