extends Timer

signal cooled_down

func _on_timeout() -> void:
	cooled_down.emit()
