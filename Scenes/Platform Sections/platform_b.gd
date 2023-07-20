extends Node2D

@onready var pixel_length = 448:
	get:
		return pixel_length
	set(value):
		pixel_length = pixel_length + value
