extends Node2D

const LIFE_SPACING = 8
var lives: Array[Node] = []
var life_scene = preload("res://Scenes/life.tscn")
signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	_add_a_life()
	_add_a_life()
	_add_a_life()


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

func _on_ground_body_entered(body):
	_lose_a_life()
