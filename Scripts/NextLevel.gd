extends Node2D

var current_level = 1

var level_2 = preload("res://Levels/level-2.tscn")
var level_3 = preload("res://Levels/level-3.tscn")
var levels = [level_2, level_3]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_level_completed():
	visible = true


func _on_next_level_button_pressed():
	current_level += 1
	var next_level = levels[current_level - 2]
	get_tree().change_scene_to_packed(next_level)
