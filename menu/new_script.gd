extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $"Layout/Main/Buttons/GameScenes".get_children():
	button.connect("pressed", self, "_on Button_Pressed", [button.scene_to_load])

func _on_Button_Pressed(scene_to_load):
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
