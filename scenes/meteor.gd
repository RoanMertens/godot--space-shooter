# Meteor
extends Area2D
const DIRECTION_Y: float = 1.0
const START_POSITION_Y: int = -50
const MIN_MOVEMENT_SPEED: int = 100
const MAX_MOVEMENT_SPEED: int = 400
const MAX_ROTATION_SPEED: int = 10

var added_movement_start_speed: int
var movement_speed: int
var rotation_speed: int
var direction_x: float

signal collision_with(body: Node2D)

func _ready() -> void:
	position = generate_start_position()
	movement_speed = randi_range(MIN_MOVEMENT_SPEED + added_movement_start_speed, MAX_MOVEMENT_SPEED + added_movement_start_speed)
	rotation_speed = randi_range(-MAX_ROTATION_SPEED, MAX_ROTATION_SPEED)
	direction_x = randf_range(-1, 1)

func _process(delta: float) -> void:
	position += Vector2(direction_x, DIRECTION_Y) * movement_speed * delta
	rotation += rotation_speed * delta
	
	# Remove meteor when it goes off-screen
	if position.y > get_viewport_rect().size.y + 100:
		queue_free()

func generate_start_position() -> Vector2:
	var rng := RandomNumberGenerator.new()
	var viewport_width = get_viewport().get_visible_rect().size[0]
	var start_position_x = rng.randi_range(0, viewport_width)
	
	return Vector2(start_position_x, START_POSITION_Y)

func _on_body_entered(body: Node2D) -> void:
	collision_with.emit(body)
