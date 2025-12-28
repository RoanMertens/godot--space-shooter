extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/Score.text = 'Score: ' + str(Global.score)
 
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		restart_game()

func restart_game() -> void:
	Global.reset_state()
	get_tree().change_scene_to_file("res://scenes/level.tscn")
