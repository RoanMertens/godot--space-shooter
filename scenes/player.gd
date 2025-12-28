# player
extends CharacterBody2D

@export var lives: int = 3
@export var SPEED := 700
var direction: Vector2

signal shoot(shot_from: Vector2, direction: Vector2)
signal takes_damage

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

func fire_weapon() -> void:
	shoot.emit($ShooterStartPosition.global_position, direction) 

func take_damage() -> void:
	lives -= 1
	takes_damage.emit()
	
	if lives > 0:
		$PlayerHurtSound.play()

func is_dead() -> bool:
	return lives <= 0
