extends Control

@onready var audio_player = $AudioStreamPlayer

func _on_start_button_pressed():
	audio_player.play()


func _on_quit_button_pressed():
	get_tree().quit()


func _on_audio_stream_player_finished():
	get_tree().change_scene_to_file("res://Scenes/Main/world.tscn")
