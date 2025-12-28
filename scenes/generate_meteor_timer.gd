extends Timer

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var added_movement_start_speed: int = 0

signal on_player_hit

func _on_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	meteor.added_movement_start_speed = added_movement_start_speed

	meteor.collision_with.connect(_on_meteor_collision_with)

	$"../../Meteors".add_child(meteor)

func _on_meteor_collision_with(body: Node2D) -> void:
	if body.name == 'Player':
		on_player_hit.emit()
