extends Node

var lives = 3
var current_level = 1

@onready var GameOver = get_node("/root/Main/GameOver")

func _ready():
	GameOver.restart_game.connect(_reset_lives)
	
func _get_lives():
	return lives
	
func _lose_a_life():
	lives -= 1

func _reset_lives():
	lives = 3
	
func _get_current_level():
	return current_level

func _next_level():
	current_level += 1
	return current_level
