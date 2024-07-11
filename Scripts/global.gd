extends Node

var lives = 3
var current_level = 1
var score = 0

@onready var GameOver = get_node("/root/Main/GameOver")
@onready var ScoreLabel = get_node("/root/Main/ScoreLabel")

func _ready():
	GameOver.restart_game.connect(_reset_lives)
	GameOver.restart_game.connect(_reset_level)
	GameOver.restart_game.connect(_reset_score)

# Lives
func _get_lives():
	return lives
	
func _lose_a_life():
	lives -= 1

func _reset_lives():
	lives = 3
	
# Current Level
func _get_current_level():
	return current_level

func _next_level():
	current_level += 1
	return current_level

func _reset_level():
	current_level = 1
	
# Score
func _increase_score(amount):
	score += amount
	ScoreLabel = get_node("/root/Main/ScoreLabel")
	ScoreLabel.text = "Score: " + str(score)

func _reset_score():
	score = 0
