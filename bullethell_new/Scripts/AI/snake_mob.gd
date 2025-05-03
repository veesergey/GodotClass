extends CharacterBody2D

var isAlive: bool = true
var mob: bool = true
var speed: int = 20
var health: int = 1

@onready var player: Node = get_node("../../Player")
@onready var sprite: Sprite2D = get_node("GuardianSerpentOld")
func _physics_process(delta: float) -> void:
	
	if isAlive:
		var direction: Vector2 = (player.global_position - self.global_position).normalized()
		velocity = speed*direction
		move_and_slide()
		
		if direction.x > 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
	pass
