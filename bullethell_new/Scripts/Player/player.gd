extends CharacterBody2D

var speed: int = 75
var direction: Vector2 = Vector2(0,1)
@onready var bullet = preload("res://player/bullet.tscn")


func _physics_process(delta: float) -> void:
	var inputDir: Vector2 = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	
	if inputDir.x > 0:
		#check if player is moving right
		get_node("Player").frame = 1
		get_node("Player").flip_h = false
		direction = inputDir
	elif inputDir.x < 0:
		#check if player is moving left
		get_node("Player").frame = 1
		get_node("Player").flip_h = true
		direction = inputDir
	elif inputDir.y < 0:
		#check if player is moving up
		get_node("Player").frame = 2
		direction = inputDir
	elif inputDir.y > 0:
		#check if player is moving down
		get_node("Player").frame = 0
		direction = inputDir
	
	if Input.is_action_just_pressed("Shoot"):
		var bulletTemp = bullet.instantiate()
		bulletTemp.velocity = direction * 100
		get_node("Bullets").add_child(bulletTemp)
	
	velocity = inputDir * speed
	move_and_slide()
	print(inputDir)
