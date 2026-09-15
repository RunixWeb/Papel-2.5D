extends VBoxContainer

# Obtenemos la referencia de los nodos que modificaran el valor de rotacion y posicion de su objeto #
# Ademas de obtener la referencia del objeto en la variable objeto modificado #

@onready var etiqueta_objeto = $Nombre_objeto
@onready var pos_x = $HBoxContainer/modificador_x
@onready var pos_y = $HBoxContainer/modificador_y
@onready var pos_z = $HBoxContainer/modificador_z

@onready var rot_x = $HBoxContainer3/rotacion_x
@onready var rot_y = $HBoxContainer3/rotacion_y
@onready var rot_z = $HBoxContainer3/rotacion_z

var objeto_modificado : Sprite3D

func configurar_caja(nombre_objeto : String, objeto_asignado : Sprite3D):
	# Configuramos la caja del objeto asignandole el objeto a modificar #
	
	etiqueta_objeto.text = nombre_objeto
	objeto_modificado = objeto_asignado
	
	pos_x.value = objeto_modificado.position.x
	pos_y.value = objeto_modificado.position.y
	pos_z.value = objeto_modificado.position.z
	
	rot_x.value = objeto_modificado.rotation_degrees.x
	rot_y.value = objeto_modificado.rotation_degrees.y
	rot_z.value = objeto_modificado.rotation_degrees.z

func _on_aplicar_pressed() -> void:
	# Apilamos el objeto dentro del lienzo aplicando las transformaciones del objeto deseadas #
	
	if is_instance_valid(objeto_modificado):
		objeto_modificado.position = Vector3(pos_x.value, pos_y.value, pos_z.value)
		objeto_modificado.rotation_degrees = Vector3(rot_x.value, rot_y.value, rot_z.value)
		print("Se han aplicado los cambios al objeto: ", etiqueta_objeto.text)

func _on_eliminar_pressed() -> void:
	# Eliminamos el objeto y su caja de modificaciones #
	
	if is_instance_valid(objeto_modificado):
		objeto_modificado.queue_free()
	self.queue_free()
