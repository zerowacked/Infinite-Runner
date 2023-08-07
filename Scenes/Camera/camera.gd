extends Camera2D

@onready var instructionLabel = $instruction_label

func _ready():
	EventBus.player_pressed_start.connect(on_player_pressed_start)

func on_player_pressed_start():
	instructionLabel.visible = false
