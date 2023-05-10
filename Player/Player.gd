extends KinematicBody2D

var movement_speed = 200
var bulletSource = preload("res://Bullet/Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func ready():
	set_process(true)
	set_physics_process(true)
	
func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var bulletInstance = bulletSource.instance()
		bulletInstance.position = Vector2(position.x, position.y-20)
		get_tree().get_root().add_child(bulletInstance)

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

func _input(event):
	if event.is_action_pressed("weapon_1"):
		current_weapon = 1
		get_node("weapon 1").set_opacity(1)
		get_node("weapon 2").set_opacoty(0)
		get_node("weapon 3").set_opacity(0)
		get_node("weapon 4").set_opacoty(0)
		
	elif event.is_action_pressed("weapon_2"):
		current_weapon = 2
		get_node("weapon 1").set_opacity(0)
		get_node("weapon 2").set_opacoty(1)
		get_node("weapon 3").set_opacity(0)
		get_node("weapon 4").set_opacoty(0)
		
	elif event.is_action_pressed("weapon_3"):
		current_weapon = 3
		get_node("weapon 1").set_opacity(0)
		get_node("weapon 2").set_opacoty(0)
		get_node("weapon 3").set_opacity(1)
		get_node("weapon 4").set_opacoty(0)
		
	elif event.is_action_pressed("weapon_4"):
		current_weapon = 4
		get_node("weapon 1").set_opacity(0)
		get_node("weapon 2").set_opacoty(0)
		get_node("weapon 3").set_opacity(0)
		get_node("weapon 4").set_opacoty(1)


const BULLET_SCENE = preload("res://Bullet.tscn")

var aim_direction + Vector2.RIGHT

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_SPACE:
			shoot()
