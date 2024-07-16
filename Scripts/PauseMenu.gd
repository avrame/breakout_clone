extends CenterContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _pause_game():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true
	visible = true

func _resume_game():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().paused = false
	visible = false

func _on_resume_button_pressed():
	_resume_game()

func _on_quit_button_pressed():
	get_tree().quit()
	
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		if visible:
			_resume_game()
		else:
			_pause_game()
