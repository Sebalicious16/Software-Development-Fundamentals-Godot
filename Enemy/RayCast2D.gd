extends RayCast2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if self.is_colliding():
		get_parent().canShoot = false
	else:
		get_parent().canShoot = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass