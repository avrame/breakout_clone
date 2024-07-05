extends Node2D

signal level_completed

var blue_material = preload("res://Materials/light-blue-overlay.tres")
var green_material = preload("res://Materials/green-overlay.tres")
var red_material = preload("res://Materials/red-overlay.tres")

var hp_materials_map = {
	1: blue_material,
	2: green_material,
	3: red_material,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _get_material(hitpoints):
	return hp_materials_map[hitpoints]


func _on_brick_died():
	if get_child_count() == 1:
		level_completed.emit()
