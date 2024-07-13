extends Node2D

signal restart_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_over():
	visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_restart_game_pressed():
	visible = false
	restart_game.emit()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
