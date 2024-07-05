extends Sprite2D

@onready var audio = $AudioStreamPlayer2D
@onready var bricks_container = get_parent()
@export var max_hitpoints = 1
var hitpoints

# Called when the node enters the scene tree for the first time.
func _ready():
	hitpoints = max_hitpoints
	_set_material()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _set_material():
	material = bricks_container._get_material(hitpoints)

func _on_ball_collision(ball):
	ball._on_brick_collision(self)
	audio.play()
	print(hitpoints)
	hitpoints -= 1
	print(hitpoints)
	if hitpoints > 0:
		_set_material()


func _on_clink_sound_finished():
	if hitpoints == 0:
		queue_free()
		bricks_container._on_brick_died()
