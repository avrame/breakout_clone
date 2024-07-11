extends Node2D

@onready var current_level = 1
@onready var level_2 = "res://Levels/level-2.tscn"
@onready var level_3 = "res://Levels/level-3.tscn"
@onready var levels = [level_2, level_3]
@onready var lives = get_node("/root/Lives")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_level_completed():
	visible = true

func _get_current_level():
	return current_level

func _on_next_level_button_pressed():
	current_level += 1
	var next_level = levels[current_level - 2]
	get_tree().change_scene_to_file(next_level)
