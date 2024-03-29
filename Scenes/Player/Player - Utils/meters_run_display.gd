extends Control

@onready var label = $TextureRect/Label
@onready var restartSoundPlayer = $restart_sound_player
@onready var quitSoundPlayer = $quit_sound_player

func _ready() -> void:
	EventBus.player_death.connect(on_player_death)

func on_player_death(meters_run) -> void:
	label.text = "You ran : %s meters before falling!" % meters_run
	visible = true


func _on_restart_button_pressed() -> void:
	restartSoundPlayer.play()
	Transition.change_scene("res://Scenes/Main/world.tscn")

func _on_quit_button_pressed() -> void:
	quitSoundPlayer.play()
	Transition.quit()
