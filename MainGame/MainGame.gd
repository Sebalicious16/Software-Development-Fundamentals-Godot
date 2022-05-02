extends Control

export(int) var countdownMax
var currentTimer

# Called when the node enters the scene treenfor the first time.
func _ready():
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)

	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		$HUD/currentScore.text = ("Score: " + str(GlobalVariables.scoringInformation["currentScore"]))
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("GAME OVER")
	get_tree().change_scene("res://lose scene.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/currentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	if get_tree().get_nodes_in_group("Enemy").size() == 0:
		get_tree().change_scene("res://win scene.tscn")
#	pass

