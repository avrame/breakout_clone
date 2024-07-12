extends Sprite2D

@onready var bricks_container = get_parent()
@onready var global = get_node("/root/Global")
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

func _on_ball_collision():
	hitpoints -= 1
	if hitpoints > 0:
		_set_material()
	else:
		bricks_container._on_brick_died()
		global._increase_score(max_hitpoints * 5)
		queue_free()
