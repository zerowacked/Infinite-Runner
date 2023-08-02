extends ParallaxLayer

@export var parallax_layer_4_offset_speed: float = -60

func _process(delta) -> void:
	self.motion_offset.x += parallax_layer_4_offset_speed * delta
