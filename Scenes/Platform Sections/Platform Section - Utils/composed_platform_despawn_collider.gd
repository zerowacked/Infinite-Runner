extends Area2D

func _ready():
	pass

func _on_platform_despawn_collider_area_entered(_area):
	despawn_parent_scene()

func despawn_parent_scene():
	EventBus.platform_delete_area_entered.emit()
	get_parent().queue_free()
