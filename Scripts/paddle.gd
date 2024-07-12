extends Area2D

const PADDLE_SPEED = 300
const PADDLE_MARGIN = 2

var touching_left_wall = false
var touching_right_wall = false
var freeze_paddle = false

@onready var sprite = $Sprite
var paddle_width
var screen_width

# Called when the node enters the scene tree for the first time.
func _ready():
	paddle_width = $Sprite.texture.get_width()
	screen_width = get_viewport_rect().size.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	var mouse_x_vel = Input.get_last_mouse_velocity().x
	if mouse_x_vel != 0:
		if mouse_x_vel < 0 and position.x - paddle_width / 2 <= PADDLE_MARGIN:
			position.x = paddle_width / 2
		elif mouse_x_vel > 0 and position.x + paddle_width / 2 >= screen_width - PADDLE_MARGIN:
			position.x = screen_width - paddle_width / 2
		elif not freeze_paddle:
			move_local_x((mouse_x_vel / 5) * delta)
	else:
		var move_amount = Input.get_axis("slide-left", "slide-right")
		var stop_move_left = move_amount < 0 and position.x - paddle_width / 2 <= PADDLE_MARGIN
		var stop_move_right = move_amount > 0 and position.x + paddle_width / 2 >= screen_width - PADDLE_MARGIN
		if not freeze_paddle and not stop_move_left and not stop_move_right:
			move_local_x(move_amount * delta * PADDLE_SPEED)

func _on_ball_entered(node):
	if node.name == "Ball":
		node._bounce_off_paddle(self)

func _on_lives_game_over():
	freeze_paddle = true

func _on_level_completed():
	freeze_paddle = true
