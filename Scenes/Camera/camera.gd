extends Camera2D

signal delete_area_entered

func _on_platform_delete_area_area_entered(area):
	emit_signal("delete_area_entered")
