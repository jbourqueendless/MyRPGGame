extends CharacterBody2D

@onready var animated_sprite = $AnimatedPlayer
const SPEED = 300.0
# Exported variables for speed
@export var speed: float = 300.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2.ZERO
	
	# Get input direction
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		
	if Input.is_action_pressed("ui_right")||Input.is_action_pressed("ui_left" )|| \
	Input.is_action_pressed("ui_down")||Input.is_action_pressed("ui_up"):
		animated_sprite.play("walk")
	else: 
		animated_sprite.stop()
	
	# Normalize the direction vector to prevent faster diagonal movement
	direction = direction.normalized()
	
	# Move the character
	velocity = direction * speed
	move_and_slide()
