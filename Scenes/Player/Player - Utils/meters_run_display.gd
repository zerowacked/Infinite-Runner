extends Control

@onready var label = $TextureRect/Label

func _ready():
	EventBus.player_death.connect(on_player_death)

func on_player_death(meters_run):
	label.text = "You ran : %s meters before falling!" % meters_run
	visible = true


func _on_restart_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main/world.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
