extends Node

var lives = 2
var current_level = 1
var score = 0
var high_score = 0

@onready var GameOver = get_node("/root/Main/GameOver")
@onready var ScoreLabel = get_node("/root/Main/ScoreLabel")
@onready var HighScoreLabel = get_node("/root/Main/HighScoreLabel")

func _ready():
	pass

# Lives
func _get_lives():
	return lives
	
func _lose_a_life():
	lives -= 1

func _reset_lives():
	lives = 2
	
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
	if score > high_score:
		high_score = score
		HighScoreLabel = get_node("/root/Main/HighScoreLabel")
		HighScoreLabel.text = "High Score: " + str(high_score)

func _reset_score():
	score = 0
