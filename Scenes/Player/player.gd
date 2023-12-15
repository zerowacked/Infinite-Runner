extends CharacterBody2D

const jump_effect = preload("res://Scenes/VFX/jump effect/jump effect.tscn")
const land_effect = preload("res://Scenes/VFX/land effect/land effect.tscn")

var y_death_zone : int = 150

enum STATES {
	JUMP,
	FALL,
	RUN,
	IDLE
}

var state : STATES = STATES.IDLE:
	get:
		return state
	set(value):
		state = value

@export var move_speed : int = 0
@export var acceleration :int  = 1  

@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

@onready var animationPlayer : AnimationPlayer = $AnimationPlayer
@onready var landing_ray : RayCast2D = $LandingRay

func _ready() -> void:
	EventBus.player_pressed_start.connect(on_player_start_button_pressed)

func _physics_process(delta : float) -> void:
	velocity.y += get_gravity() * delta
	velocity.x = get_input_velocity() * move_speed
	if Input.is_action_just_pressed("jump") and is_on_floor() and velocity.x > 0:
		jump()
	move_and_slide()
	if Input.is_action_just_released("jump") and state == STATES.JUMP and velocity.y < -125:
		velocity.y = (jump_velocity / 2)
	if velocity.y < 0:
		state = STATES.JUMP
		animationPlayer.play("JUMP")
	if velocity.x > 0 and is_on_floor():
		state = STATES.RUN
		animationPlayer.play("FAST_RUN")
	if velocity.y > 0: 
		state = STATES.FALL
		animationPlayer.play("FALL")
	if velocity.x == 0:
		state = STATES.IDLE
		animationPlayer.play("IDLE")
	if landing_ray.enabled == true:
		print("landing ray enabled")
		check_landing_collider()
	if check_y_value() > y_death_zone:
		player_death()

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump() -> void:
	velocity.y = jump_velocity
	spawn_jump_effect()
	landing_ray.enabled = true

func get_input_velocity() -> float:
	var horizontal = acceleration
	return horizontal

func spawn_jump_effect() -> void:
	var jump = jump_effect.instantiate()
	get_tree().current_scene.add_child(jump)
	jump.position = self.position
	jump.position.y = self.position.y + 8

func check_y_value() -> float:
	var y_value = self.position.y
	return y_value

func player_death() -> void:
	var meters_run = roundf((self.position.x / 30) * 1.8)
	EventBus.player_death.emit(meters_run)
	queue_free()

func on_player_start_button_pressed() -> void:
	move_speed = 400

func spawn_land_effect(landing_ray_collision_point : Vector2) -> void:
	var land = land_effect.instantiate()
	get_tree().current_scene.add_child(land)
	land.position = landing_ray_collision_point
	#land.position.y = self.position.y + 8

func check_landing_collider() -> void:
	if landing_ray.is_colliding() == true:
		spawn_land_effect(landing_ray.get_collision_point())
		landing_ray.enabled = false
