extends Node

var lives = 3

@onready var GameOver = get_node("/root/Main/GameOver")

func _ready():
	GameOver.restart_game.connect(_reset_lives)
	
func _get_lives():
	return lives
	
func _lose_a_life():
	lives -= 1

func _reset_lives():
	lives = 3
