extends KinematicBody2D

var movement_speed = 200

var bulletSource = preload("res://Bullet/Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)
	GlobalVariables.Player = self

	
# player shooting process
func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var bulletInstance = bulletSource.instance()
		bulletInstance.position = Vector2(position.x, position.y-40)
		get_tree().get_root().add_child(bulletInstance)
# Player movement process
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		if position.x > 0:
			move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		if position.x < 1280:
			move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(0, -movement_speed * delta))
	if Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(0, movement_speed * delta))




