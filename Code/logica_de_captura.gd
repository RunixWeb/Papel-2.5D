extends Node

# seleccionamos el lienzo que podra tomar la imagen #
# al igual que seleccionamos el sistema de archivos o panel de archivos #

@onready var camara_capturadora = $"../../SubViewportContainer/SubViewport"
@onready var save_dialog = $"../FileDialog"

# Presionar un boton es vital para poder tener la imagen de forma correcta #
# Hacemos que la carpeta que aparezca por defecto sea Pictures o Imagenes #
# hacemos aparecer la ventana en el centro para seleccionar #

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("EXPORT"):
		save_dialog.current_dir = OS.get_system_dir(OS.SYSTEM_DIR_PICTURES)
		save_dialog.popup_centered()

# tomamos la imagen y la guardamos en la ruta que tenemos del nodo #

func _on_file_dialog_file_selected(path: String) -> void:
	_take_picture(path)

# la funcion existe gracias a que obtenemos la textura del lienzo #
# convertimos esos datos a una imagen #
# error nos sirve para obtener la ruta de guardado que haya dado el error y/o para guardar el archivo #

func _take_picture(ruta_guardado : StringName):
	await RenderingServer.frame_post_draw
	var textura = camara_capturadora.get_texture()
	var imagen = textura.get_image()
	var error = imagen.save_png(ruta_guardado)
	if error == OK:
		print("La imagen ha sido guardada en: ", ruta_guardado)
	else:
		print("Hubo un error al guardar la imagen", error)
