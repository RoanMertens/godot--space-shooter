extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var meteor1: String = "res://kenney_space-shooter-redux/PNG/Meteors/meteorGrey_big1.png"
	var meteor2: String = "res://kenney_space-shooter-redux/PNG/Meteors/meteorGrey_big2.png"
	var meteor3: String = "res://kenney_space-shooter-redux/PNG/Meteors/meteorBrown_big1.png"
	var meteor4: String = "res://kenney_space-shooter-redux/PNG/Meteors/meteorBrown_big2.png"
	var meteors = [meteor1, meteor2, meteor3, meteor4]
	texture = load(meteors.pick_random())
