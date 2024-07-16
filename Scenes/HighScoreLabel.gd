extends Label

@onready var global = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "High Score: " + str(global.high_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
