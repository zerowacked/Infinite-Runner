extends Control

@onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer
@onready var quitSoundPlayer : AudioStreamPlayer = $QuitSoundPlayer

func _on_start_button_pressed() -> void:
	audio_player.play()
	Transition.change_scene("res://Scenes/Main/world.tscn")

func _on_quit_button_pressed() -> void:
	quitSoundPlayer.play()
	Transition.quit()

func _on_credit_button_pressed() -> void:
	quitSoundPlayer.play()
	Transition.change_scene("res://Scenes/Menu/credits.tscn")
