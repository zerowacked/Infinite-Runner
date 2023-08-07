extends CharacterBody2D

var y_death_zone = 150

enum {
	JUMP,
	FALL,
	RUN,
	IDLE
}

var state = IDLE

@export var move_speed = 0
@export var acceleration = 1  

@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

@onready var animationPlayer = $AnimationPlayer

func _ready():
	EventBus.player_pressed_start.connect(on_player_start_button_pressed)

func _physics_process(delta):
	velocity.y += get_gravity() * delta
	velocity.x = get_input_velocity() * move_speed
	if Input.is_action_just_pressed("jump") and is_on_floor() and velocity.x > 0:
		jump()
	move_and_slide()
	if Input.is_action_just_released("jump") and state == JUMP and velocity.y < -125:
		velocity.y = -125 
	if velocity.y < 0:
		state = JUMP
		animationPlayer.play("JUMP")
	if velocity.x > 0 and is_on_floor():
		state = RUN
		animationPlayer.play("FAST_RUN")
	if velocity.y > 0: 
		state = FALL
		animationPlayer.play("FALL")
	if velocity.x == 0:
		state = IDLE
		animationPlayer.play("IDLE")
	if check_y_value() > y_death_zone:
		player_death()

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump():
	velocity.y = jump_velocity

func get_input_velocity() -> float:
	var horizontal = acceleration
	return horizontal

func check_y_value() -> float:
	var y_value = self.position.y
	return y_value

func player_death():
	var meters_run = roundf((self.position.x / 30) * 1.8)
	EventBus.player_death.emit(meters_run)
	queue_free()

func on_player_start_button_pressed():
	move_speed = 400
