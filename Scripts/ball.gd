extends CharacterBody2D

const INITIAL_BALL_SPEED = -125

@onready var sprite = $Sprite2D
var brick_width
var brick_height
var game_in_play = false
var game_over = false
var initial_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	brick_width = sprite.texture.get_width()
	brick_height = sprite.texture.get_height()
	initial_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("fire"):
		if not game_in_play and not game_over:
			_start_moving()
		
	move_and_collide(velocity * delta)
		
func _start_moving():
	velocity.y = INITIAL_BALL_SPEED
	game_in_play = true
	
func _bounce_off_paddle(paddle):
	var relative_position = position.x - paddle.position.x
	var speed = velocity.length()
	velocity.y = -velocity.y
	velocity.x = relative_position * 10
	velocity.normalized()

func _on_side_wall_collision(_body):
	velocity.x = -velocity.x

func _on_top_wall_collision(_body):
	velocity.y = -velocity.y
	
func _on_brick_collision(brick):
	if position.x >= brick.position.x + brick_width / 2:
		velocity.x = abs(velocity.x)
	elif position.x <= brick.position.x - brick_width / 2:
		velocity.x = -abs(velocity.x)
	
	if position.y >= brick.position.y + brick_height / 2:
		velocity.y = abs(velocity.y)
	elif position.y <= brick.position.y - brick_height / 2:
		velocity.y = -abs(velocity.y)

func _on_ground_body_entered(body):
	velocity = Vector2.ZERO
	position = initial_position
	game_in_play = false


func _on_game_over():
	game_over = true


func _on_level_completed():
	queue_free()
