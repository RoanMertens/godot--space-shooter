extends Timer

@onready var generate_meteor_timer: Timer = $"../GenerateMeteorTimer"
@export var added_movement_start_speed_increment: int = 5

func _on_timeout() -> void:
	generate_meteor_timer.added_movement_start_speed += added_movement_start_speed_increment

	if generate_meteor_timer.wait_time > 0.05:
		generate_meteor_timer.wait_time -= 0.005
