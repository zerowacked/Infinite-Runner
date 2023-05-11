extends Node2D

@onready var platform = preload("res://Scenes/Platform Sections/platform.tscn")

#build an array of 10 or so platforms and each time a platform is removed, bump it off the array. Then add a new platform at coordinates far away.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_platform():
	pass
