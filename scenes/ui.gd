extends CanvasLayer

var image = load("res://.godot/imported/playerLife3_red.png-9ad8590d8b36726ff67a57a103fa6762.ctex")

func _on_player_takes_damage() -> void:
	# remove old displayed of lives
	for child in $Health/Lives.get_children():
		child.queue_free()

	# render new displayed of lives
	for i in $"../Player".lives:
		var text_rectangle = TextureRect.new()
		text_rectangle.texture = image
		text_rectangle.stretch_mode = TextureRect.STRETCH_KEEP
		$Health/Lives.add_child(text_rectangle)

func _on_level_score_updated() -> void:
	# update displayed score
	$Score/ScoreLabel.text = 'Score: ' + str(Global.score)
