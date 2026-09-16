extends VBoxContainer

@export var luz_direccional : DirectionalLight3D

func _on_rx_value_changed(value: float) -> void:
	luz_direccional.rotation_degrees.x = value

func _on_ry_value_changed(value: float) -> void:
	luz_direccional.rotation_degrees.y = value

func _on_luz_value_changed(value: float) -> void:
	luz_direccional.light_energy = value
