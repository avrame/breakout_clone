extends CenterContainer

signal restart_game

@onready var global = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_over():
	visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _restart_game():
	visible = false
	restart_game.emit()
	global._reset_lives()
	global._reset_level()
	global._reset_score()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _unhandled_input(event):
	if visible and event.is_action_pressed("fire"):
		_restart_game()
