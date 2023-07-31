extends Control

#@onready var start_button = $VBoxContainer/StartButton

func ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main/world.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
