extends KinematicBody2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
# Player points and scoring system
func _physics_process(delta):
	
	if GlobalVariables.Player == null:
		print(GlobalVariables.Player)
		queue_free()
	var collidedObject = move_and_collide(Vector2(0, -speed*delta))
	if (collidedObject):
		print(collidedObject.collider.name)
		if "Enemy" in collidedObject.collider.name:
			collidedObject.get_collider().queue_free()
			GlobalVariables.scoringInformation["currentScore"] +=10
		queue_free()
		GlobalVariables.bulletInstanceCount -= 1

