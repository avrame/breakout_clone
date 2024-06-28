extends Node2D

var window_width
var window_height

func _ready():
	var window_size = DisplayServer.window_get_size()
	window_width = window_size[0]
	window_height = window_size[1]


func _process(delta):
	pass
	
func _draw():
	draw_rect(Rect2(0, 0, window_width, window_height), Color.from_string("#BBB", Color.BLACK))
