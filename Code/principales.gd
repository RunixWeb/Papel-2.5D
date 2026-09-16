extends Node

@onready var luz_direccional = $"../../SubViewportContainer/SubViewport/SCENE/DirectionalLight3D"
var activado : bool = false

func _on_salir_app_pressed() -> void:
	# Al presionar el boton salimos de la aplicacion #
	
	get_tree().quit()

func _on_check_box_pressed() -> void:
	if activado == false:
		luz_direccional.shadow_enabled = true
		activado = true
	else:
		luz_direccional.shadow_enabled = false
		activado = false
