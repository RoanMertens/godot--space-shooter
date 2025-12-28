extends CanvasLayer

var image = load("res://.godot/imported/playerLife3_red.png-9ad8590d8b36726ff67a57a103fa6762.ctex")

func _on_level_life_updated(lives: Variant) -> void:
	update_displayed_lives(lives)

func _on_level_score_updated(new_score: Variant) -> void:
	update_displayed_score(new_score)

func update_displayed_score(new_score: Variant) -> void:
	$Score/ScoreLabel.text = 'Score: ' + str(new_score)

func update_displayed_lives(new_score: Variant) -> void:
	for child in $Health/Lives.get_children():
		child.queue_free()

	for i in new_score:
		var text_rectangle = TextureRect.new()
		text_rectangle.texture = image
		text_rectangle.stretch_mode = TextureRect.STRETCH_KEEP
		$Health/Lives.add_child(text_rectangle)
