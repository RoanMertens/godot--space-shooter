extends Timer

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var added_movement_start_speed: int = 0

func _on_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	meteor.added_movement_start_speed = added_movement_start_speed

	meteor.collision_with.connect($"../.."._on_meteor_collision_with)

	$"../..".add_child(meteor)
