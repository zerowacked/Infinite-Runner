extends Node2D

#@onready var platformA = preload("res://Scenes/Platform Sections/platform_a.tscn")
#@onready var platformB = preload("res://Scenes/Platform Sections/platform_b.tscn")
#@onready var platformC = preload("res://Scenes/Platform Sections/platform_c.tscn")

@export var platform_limit = 10 # configurable number of platforms allowed to exist at one time before despawn
@export var platform_count: int = 0 :
	get:
		return platform_count
	set(value):
		platform_count = value


var x_coordinate = 600 # this is the x coordinate of the last pixel of the start platform

@onready var platforms = [
	preload("res://Scenes/Platform Sections/Platforms/platform_a.tscn"),
	preload("res://Scenes/Platform Sections/Platforms/platform_b.tscn"),
	preload("res://Scenes/Platform Sections/Platforms/platform_c.tscn"),
	preload("res://Scenes/Platform Sections/Platforms/platform_d.tscn"),
	preload("res://Scenes/Platform Sections/Platforms/platform_e.tscn"),
	preload("res://Scenes/Platform Sections/Platforms/platform_f.tscn"),
	preload("res://Scenes/Platform Sections/Platforms/platform_g.tscn"),
	preload("res://Scenes/Platform Sections/Platforms/platform_h.tscn")
]

func _ready():
	randomize()
	EventBus.platform_delete_area_entered.connect(on_platform_delete_area_entered)

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
	var randomPlatformSelect = randi_range(0,7)
	var newPlatformInstance = platforms[randomPlatformSelect].instantiate()
	var newPlatformDuplicate = newPlatformInstance.duplicate()
	
	get_tree().current_scene.add_child(newPlatformDuplicate)
	var spawn_y = randomize_y()
	newPlatformDuplicate.position = Vector2(x_coordinate,spawn_y)
	
	var platform_length_increment = newPlatformDuplicate.pixel_length
	increment_spawn_x_value(platform_length_increment)
	platform_count = platform_count+1

func can_new_platform_spawn(count, limit):
	if count >= limit:
		return false
	else:
		return true

func randomize_y():
	var random_y = randi_range(-25,25)
	return random_y

func randomize_blank_space(x):
	var random_addition = randi_range(100,150)
	var new_x = random_addition + x
	return new_x

func on_platform_delete_area_entered():
	platform_count = platform_count - 1
