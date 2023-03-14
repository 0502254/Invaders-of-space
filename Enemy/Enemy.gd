extends KinematicBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("area_entered", self, "colliding")

func _colliding(area):
	if area.is_in_group("right"):
		#print("enemies collide right")
		get_parent().global_position.y += 10
		get_parent().speed = get_parent().speed * -1
	if area.is_in_group("left"):
		#print("enemies collide left")
		get_parent().global_position.y += 10
		get_parent().speed = get_parent().speed * -1
