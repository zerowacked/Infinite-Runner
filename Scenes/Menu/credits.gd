extends Control

@onready var quitSoundPlayer = $QuitSoundPlayer

func _on_return_button_pressed():
	quitSoundPlayer.play()
	Transition.change_scene("res://Scenes/Menu/menu.tscn")
