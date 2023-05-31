extends KinematicBody2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, -speed*delta))
	if (collidedObject):
		print(collidedObject.collider.name)
		if "Enemy" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
			GlobalVariables.scoringInformation["currentScore"] +=10
		queue_free()
		GlobalVariables.bulletInstanceCount -= 1

var bllets_num

func onareabodyentered(body):
	if area isingroup("player"):
	bullets_num += 1
	
	text = bullets_num
