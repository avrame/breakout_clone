extends Node

const LIFE_SPACING = 8

var lives: Array[Node] = []
var life_scene = preload("res://Scenes/life.tscn")
@onready var global = get_node("/root/Global")
signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_starting_lives()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _add_a_life():
	var life = life_scene.instantiate()
	life.position.x = lives.size() * LIFE_SPACING
	add_child(life)
	lives.push_back(life)
	
func _lose_a_life():
	if lives.size() == 0:
		game_over.emit()
	else:
		var life = lives.pop_back()
		life.queue_free()
		global._lose_a_life()
		
func _set_starting_lives():
	var num_lives = global._get_lives()
	for i in num_lives:
		_add_a_life()

func _on_ground_body_entered(body):
	if body.name == "Ball":
		_lose_a_life()
