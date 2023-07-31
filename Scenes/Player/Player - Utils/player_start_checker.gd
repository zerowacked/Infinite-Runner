extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("jump"):
		send_player_pressed_start_signal()
		despawn_checker_component()

func send_player_pressed_start_signal():
	EventBus.player_pressed_start.emit()

func despawn_checker_component():
	queue_free()
