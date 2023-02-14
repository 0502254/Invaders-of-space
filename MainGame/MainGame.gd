extends Control

export(int) var countDownMax
var currentTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	currentTimer = countDownMax
	$HUD/Countdown.text = str(currentTimer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
