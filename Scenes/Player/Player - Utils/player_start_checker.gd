extends Node2D

func _process(_delta : float) -> void:
	if Input.is_action_just_pressed("jump"):
		send_player_pressed_start_signal()
		despawn_checker_component()

func send_player_pressed_start_signal() -> void:
	EventBus.player_pressed_start.emit()

func despawn_checker_component() -> void:
	queue_free()
