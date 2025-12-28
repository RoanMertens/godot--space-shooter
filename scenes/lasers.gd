extends Node2D

var laser_scene: PackedScene = load("res://scenes/laser.tscn")

func _on_player_shoot(shot_from: Vector2, direction: Vector2) -> void:
	shoot_laser(shot_from, direction)

func shoot_laser(shot_from: Vector2, direction: Vector2) -> void:
	var laser = laser_scene.instantiate()
	
	laser.hit.connect($".."._on_laser_hit)
	
	laser.shot_from = shot_from
	laser.direction = direction
	add_child(laser) 
