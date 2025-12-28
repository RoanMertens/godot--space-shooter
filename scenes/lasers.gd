extends Node2D

var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var cooling_down: bool = false

func _on_player_shoot(shot_from: Variant, direction: Variant) -> void:
	if not cooling_down:
		shoot_laser(shot_from, direction)
		cool_down_laser()

func _on_laser_cooldown_timer_cooled_down() -> void:
	cooling_down = false

func shoot_laser(shot_from: Variant, direction: Variant) -> void:
	var laser = laser_scene.instantiate()
	
	laser.hit.connect($".."._on_laser_hit)
	
	laser.shot_from = shot_from
	laser.direction = direction
	add_child(laser) 

func cool_down_laser() -> void:
	cooling_down = true
	$"../Timers/LaserCooldownTimer".start()
