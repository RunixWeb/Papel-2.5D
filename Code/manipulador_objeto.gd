extends VBoxContainer

# Obtenemos la referencia de los nodos que modificaran el valor de rotacion y posicion de su objeto #
# Ademas de obtener la referencia del objeto en la variable objeto modificado #

@onready var etiqueta_objeto = $Nombre

var objeto_modificado : Sprite3D

func configurar_caja(nombre_objeto : String, objeto_asignado : Sprite3D):
	# Configuramos la caja del objeto asignandole el objeto a modificar #
	
	etiqueta_objeto.text = nombre_objeto
	objeto_modificado = objeto_asignado

func _on_eliminar_pressed() -> void:
	# Eliminamos el objeto y su caja de modificaciones #
	
	if is_instance_valid(objeto_modificado):
		objeto_modificado.queue_free()
	self.queue_free()

# Modificadores del objeto #

func _on_modificador_x_value_changed(value: float) -> void:
	objeto_modificado.position.x = value

func _on_modificador_y_value_changed(value: float) -> void:
	objeto_modificado.position.y = value

func _on_modificador_z_value_changed(value: float) -> void:
	objeto_modificado.position.z = value

func _on_rotacion_x_value_changed(value: float) -> void:
	objeto_modificado.rotation_degrees.x = value

func _on_rotacion_y_value_changed(value: float) -> void:
	objeto_modificado.rotation_degrees.y = value

func _on_rotacion_z_value_changed(value: float) -> void:
	objeto_modificado.rotation_degrees.z = value

func _on_scale_x_value_changed(value: float) -> void:
	objeto_modificado.scale.x = value

func _on_scale_y_value_changed(value: float) -> void:
	objeto_modificado.scale.y = value
