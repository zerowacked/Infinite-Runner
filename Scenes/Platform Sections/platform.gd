extends StaticBody2D

@onready var logicController = LogicController
@onready var screenNotifier = $VisibleOnScreenNotifier2D

func _ready():
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Queue Free")
	queue_free()
