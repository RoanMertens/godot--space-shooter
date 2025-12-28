extends Node2D

signal on_player_hit

func _on_meteor_collision_with(body: Node2D) -> void:
	if body.name == 'Player':
		on_player_hit.emit()
