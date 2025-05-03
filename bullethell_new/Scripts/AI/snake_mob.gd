extends CharacterBody2D

var isAlive: bool = true
var mob: bool = true
var speed: int = 20
var health: int = 5

@onready var player: Node = get_node("../../Player")
@onready var sprite: Sprite2D = get_node("GuardianSerpentOld")
@onready var bar: ProgressBar = get_node("HealthBar")
@onready var animation: AnimatedSprite2D = get_node("Animation")
@onready var bullet_pool: Node = get_node("Bullets")

func _ready():
		bar.max_value = health

func _physics_process(delta: float) -> void:
	if isAlive:
		bar.value = health
		var direction: Vector2 = (player.global_position - self.global_position).normalized()
		velocity = speed*direction
		move_and_slide()
		
		if direction.x > 0:
			sprite.flip_h = true
			get_node("SnakeHead").position = Vector2(+10, -11)
		else:
			sprite.flip_h = false
			get_node("SnakeHead").position = Vector2(-10, -11)

	else:
		animation.show()
		sprite.hide()
		bar.hide()

func get_hit(body: Node) -> void:
	if health > 1:
		health -= 1
	else:
		isAlive = false
		animation.play("Death")
		await animation.animation_finished
		get_parent().reset_mob(body)


func _on_player_detection_body_entered(body: Node2D) -> void:
	if "Player" in body.name:
		if visible and body.visible:
			Game.playerHP -= 1
			print(Game.playerHP)
			
	
func shoot_bullet() -> void:
	if self.visible and self.isAlive:
		var bulletTemp: Node = bullet_pool.get_bullet()
		var direction: Vector2 = (player.global_position - self.global_position).normalized()

		bulletTemp.velocity = direction * 100
		bulletTemp.global_position = get_node("SnakeHead").global_position
		bulletTemp.show()
	pass

func _on_shoot_bullet_timeout() -> void:
	shoot_bullet()
	pass # Replace with function body.
