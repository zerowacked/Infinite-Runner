extends Node2D

@onready var pixel_length = 560

func _ready():
	EventBus.platform_delete_area_entered.connect(on_platform_delete_area_entered)

func on_platform_delete_area_entered():
	print("Area entered!")
	despawn()

func despawn():
	queue_free()
