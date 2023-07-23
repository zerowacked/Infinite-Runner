extends Node2D

#@onready var platformA = preload("res://Scenes/Platform Sections/platform_a.tscn")
#@onready var platformB = preload("res://Scenes/Platform Sections/platform_b.tscn")
#@onready var platformC = preload("res://Scenes/Platform Sections/platform_c.tscn")

@export var platform_limit = 20 # configurable number of platforms allowed to exist at one time before despawn

var x_coordinate = 0 # this is the x coordinate of the last pixel of the start platform
var platform_count = 0 # number of platforms currently spawned

@onready var platforms = [
	preload("res://Scenes/Platform Sections/Platforms/platform_a.tscn"),
	preload("res://Scenes/Platform Sections/Platforms/platform_b.tscn"),
	preload("res://Scenes/Platform Sections/Platforms/platform_c.tscn")
]

func _ready():
	randomize()

func _physics_process(_delta):
	if can_new_platform_spawn(platform_count, platform_limit) == true:
		spawn_platform()
	else:
		pass

func increment_spawn_x_value(platform_length):
	x_coordinate = randomize_blank_space(x_coordinate)
	x_coordinate = x_coordinate + platform_length
	return x_coordinate

func spawn_platform():
	var randomPlatformSelect = randi_range(0,2)
	var newPlatform = platforms[randomPlatformSelect].instantiate()
	var spawn_y = randomize_y()
	get_tree().current_scene.add_child(newPlatform) 
	var platform_length_increment = newPlatform.pixel_length
	var spawn_x = increment_spawn_x_value(platform_length_increment)
	newPlatform.position = Vector2(spawn_x,spawn_y)
	platform_count = platform_count+1

func can_new_platform_spawn(count, limit):
	if count >= limit:
		return false
	else:
		return true

func randomize_y():
	var random_y = randi_range(-50,50)
	return random_y

func randomize_blank_space(x):
	var random_addition = randi_range(150,250)
	var new_x = random_addition + x
	return new_x

func despawn_platform():
	pass
