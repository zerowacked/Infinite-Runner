extends ParallaxLayer

@export var parallax_layer_3_offset_speed: float = -30

func _process(delta) -> void:
	self.motion_offset.x += parallax_layer_3_offset_speed * delta
