extends Node2D

signal score_updated(new_score)
signal life_updated(lives)

var score: int = 0
@export var lives: int = 3 

func _ready() -> void:
	life_updated.emit(lives)

func _on_laser_hit() -> void:
	increase_score()
	
	if score == 100:
		increase_life()

func _on_player_hit() -> void:
	decrease_life()
	if lives <= 0:
		get_tree().call_deferred("change_scene_to_file","res://scenes/game_over.tscn")
	else:
		$PlayerHurtSound.play()

func increase_score() -> void:
	score += 1
	score_updated.emit(score)
	Global.score += 1

func increase_life() -> void:
	lives += 1
	life_updated.emit(lives)

func decrease_life() -> void:
	lives -= 1
	life_updated.emit(lives)
