extends Camera2D

func _ready():
	pass

func _on_platform_delete_area_area_entered(area):
	EventBus.platform_delete_area_entered.emit()
