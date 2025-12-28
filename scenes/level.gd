extends Node2D

signal score_updated()

func _on_laser_hit() -> void:
	increase_score()

func _on_meteors_on_player_hit() -> void:
	$Player.take_damage()

	if $Player.is_dead():
		get_tree().call_deferred("change_scene_to_file","res://scenes/game_over.tscn")

func increase_score() -> void:
	Global.score += 1
	score_updated.emit()
