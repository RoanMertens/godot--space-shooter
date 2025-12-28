# Laser
extends Area2D

var shot_from: Variant
var direction: Variant
@export var bullet_speed: int = 2000
signal hit(area: Area2D)

func _ready() -> void:
	position = shot_from
	rotation = direction.angle() + PI/2
	var tween = create_tween()
	tween.tween_property($LaserImage, 'scale', Vector2(1, 1), 0.03).from(Vector2(0, 0))

func _process(delta: float) -> void:
	position += direction * bullet_speed * delta

func _on_area_entered(area: Area2D) -> void:
	hit.emit(area)
