# player
extends CharacterBody2D
 
@export var SPEED := 700
var direction: Vector2

signal shoot(shot_from, direction)

func _ready() -> void:
	position = Vector2(300,300)
	direction = Vector2.UP

func _process(_delta: float) -> void:
	var new_direction = Input.get_vector("left", "right", "up","down")

	if new_direction.length() > 0:
		direction = new_direction
		rotation = direction.angle() + PI/2
		velocity = direction * SPEED
		move_and_slide()

	if Input.is_action_pressed("shoot"):
		shoot.emit($ShooterStartPosition.global_position, direction) 
