extends Control

func _ready() -> void:
	$CenterContainer/VBoxContainer/Score.text = 'Score: ' + str(Global.score)
 
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		Global.score = 0
		get_tree().change_scene_to_file("res://scenes/level.tscn")
