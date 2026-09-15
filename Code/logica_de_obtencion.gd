extends Node

# Tenemos una ventana que se llamara para poder obtener un inport de la imagen a usar #

@onready var open_dialog = $"../import"
@onready var contenedor = $"../../SubViewportContainer/SubViewport/SCENE"

@onready var apilador_objetos = $"../Apilador de objetos"

@export var sprite_scene : PackedScene
@export var objeto_nuevo : PackedScene

# declaramos una variable para tener las texturas almacenadas de forma interna #

var biblioteca_de_texturas : Array[ImageTexture] = []
var contador_imagenes : int = 1

func _unhandled_input(_event: InputEvent) -> void:
	# Gracias a una tecla hacemos que aparezca la ventana para importar las imagenes #
	
	if Input.is_action_just_pressed("IMPORT"):
		open_dialog.popup_centered()

func _on_import_file_selected(path: String) -> void:
	# Obtenemos la textura seleccionada y la agregamos y apilamos en biblioteca de texturas #
	
	var textura = cargar_imagen_en_el_editor(path)
	if textura:
		biblioteca_de_texturas.append(textura)
		_crear_imagen_en_objeto(textura)

func cargar_imagen_en_el_editor(ruta : StringName) -> ImageTexture:
	# Cargamos la imagen directamente como una imagen y si no se trata de una simplemente damos error #
	
	var imagen = Image.load_from_file(ruta)
	if imagen != null:
		print("La imagen ha sido cargada correctamente")
		return ImageTexture.create_from_image(imagen)
	else:
		print("ERROR DE LA RUTA: ", ruta)
		return null

func _crear_imagen_en_objeto(textura_nueva : ImageTexture):
	# Obtenemos una instancia del objeto que queremos agregar a la escena #
	
	var nueva_instancia = sprite_scene.instantiate()
	nueva_instancia.texture = textura_nueva
	# Agregamos el objeto a un nodo especifico para ello en el entorno 3D #
	
	contenedor.add_child(nueva_instancia)
	nueva_instancia.position = Vector3.ZERO
	
	# A su vez instanciamos en la escena dentro de un panel laeral todos los objetos instanciados #
	# Esto es necesario si queremos hacer que los objetos puedan editarse de forma directa #
	
	var nuevo_panel = objeto_nuevo.instantiate()
	apilador_objetos.add_child(nuevo_panel)
	var nombre_objeto = "OBJETO " + str(contador_imagenes)
	nuevo_panel.configurar_caja(nombre_objeto, nueva_instancia)
	contador_imagenes += 1
	print("la imagen ha sido importada correctamente al editor")
