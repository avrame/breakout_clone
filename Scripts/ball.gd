extends CharacterBody2D

const MIN_BALL_SPEED = 150
const MAX_BALL_SPEED = 400

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
			
	velocity.limit_length(MAX_BALL_SPEED)
	if velocity.length() < MIN_BALL_SPEED:
		velocity = velocity.normalized() * MIN_BALL_SPEED
		
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		collision_info.get_collider().emit_signal("ball_hit")
		velocity = velocity.bounce(collision_info.get_normal())
		
func _start_moving():
	var angle = randf_range(.75 * PI, .25 * PI)
	velocity = Vector2.RIGHT.rotated(angle) * -MIN_BALL_SPEED
	game_in_play = true


func _bounce_off_paddle(paddle):
	var relative_position = position.x - paddle.position.x
	velocity.y = -velocity.y
	velocity.x = relative_position * 8
	velocity.normalized()


func _on_ground_body_entered(body):
	velocity = Vector2.ZERO
	position = initial_position
	game_in_play = false


func _on_game_over():
	game_over = true


func _on_level_completed():
	queue_free()
