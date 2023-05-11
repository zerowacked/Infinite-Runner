extends Node2D

@onready var platform = preload("res://Scenes/Platform Sections/platform.tscn")
@onready var startPlatformSpawn = preload("res://start_platform_spawn.tscn")
@onready var spawn = $SpawnLocation

func _ready():
	pass
	#var initialPlatform = platform.instantiate()
	#add_child(initialPlatform)
	#initialPlatform.position = Vector2(-400,0)
	#print(initialPlatform.position)

func platformDespawnEvent():
	pass
	#print("Spawn Event")
	#var newPlatform = platform.instantiate()
	#add_child(newPlatform)
	#newPlatform.position = spawn.position


func _on_timer_timeout():
	pass
	#print("Spawn Event")
	#var newPlatform = platform.instantiate()
	#add_child(newPlatform)
	#newPlatform.position = spawn.position
