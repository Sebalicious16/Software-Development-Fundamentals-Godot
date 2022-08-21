extends KinematicBody2D
var bullet = preload("res://Bullet-Enemy/Bullet-Enemy.tscn")
var canShoot = false
func _ready():
	$Area2D.connect("area_entered", self, "_colliding")
	

func _colliding(area):
	print("here")
	if area.is_in_group("right"):
		get_parent().global_position.y += 10
		get_parent().speed = -200
	if area.is_in_group("left"):
		get_parent().global_position.y += 10
		get_parent().speed = +200


func _process(delta):
	if canShoot:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var my_random_number = rng.randf_range(2.0, 30.0)
		#print("time: ",my_random_number)
		yield(get_tree().create_timer(my_random_number), "timeout")
		if GlobalVariables.enemyBulletInstanceCount < 5:
			var bulletInstance = bullet.instance()
			
			bulletInstance.position = Vector2(global_position.x, global_position.y+20)
			get_tree().get_root().add_child(bulletInstance)
