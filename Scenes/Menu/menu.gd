extends Control

@onready var audio_player = $AudioStreamPlayer
@onready var quitSoundPlayer = $QuitSoundPlayer

func _on_start_button_pressed():
	audio_player.play()
	Transition.change_scene("res://Scenes/Main/world.tscn")

func _on_quit_button_pressed():
	quitSoundPlayer.play()
	Transition.quit()

func _on_credit_button_pressed():
	quitSoundPlayer.play()
	Transition.change_scene("res://Scenes/Menu/credits.tscn")
