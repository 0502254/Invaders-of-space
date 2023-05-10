extends Control

export(int) var countDownMax
var currentTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	currentTimer = countDownMax
	$HUD/Countdown.text = str(currentTimer)
	
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		$HUD/CurrentScore.text = str (GlobalVariables.scoringInformation["currentScore"])
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("Bad Lol Try Again")
	# Load the main menu again
	
