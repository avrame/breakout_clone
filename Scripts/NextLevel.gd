extends CenterContainer

@onready var level_2 = "res://Levels/level-2.tscn"
@onready var level_3 = "res://Levels/level-3.tscn"
@onready var level_4 = "res://Levels/level-4.tscn"
@onready var level_5 = "res://Levels/level-5.tscn"
@onready var levels = [level_2, level_3, level_4, level_5]
@onready var global = get_node("/root/Global")
@onready var YouWon = get_node("/root/Main/YouWon")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_level_completed():
	visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_next_level_button_pressed():
	var next_level_idx = global._next_level()
	var next_level = levels[next_level_idx - 2]
	if next_level:
		get_tree().change_scene_to_file(next_level)
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:
		YouWon.visible = true
	
func _unhandled_input(event):
	if visible and event.is_action_pressed("fire"):
		_on_next_level_button_pressed()
