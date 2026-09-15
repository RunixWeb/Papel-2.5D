extends Node

# Obtenemos referencia de los nodos que modificaran el tamaño del viewport o lienzo y el lienzo #

@onready var size_x = $"../HBoxContainer/X"
@onready var size_y = $"../HBoxContainer/Y"

@onready var lienzo = $"../../../SubViewportContainer/SubViewport"

func _on_aplicar_pressed() -> void:
	# Al presionar el boton ajustamos los valores con respecto a lo visto en los textos #
	# Transformando los valores colocados en Int #
	var nueva_anchura : int = size_x.text.to_int()
	var nueva_altura : int = size_y.text.to_int()
	
	# Evitamos hacer que el lienzo sea de 0 pixeles #
	
	if nueva_altura > 0 and nueva_anchura > 0:
		lienzo.size = Vector2i(nueva_anchura, nueva_altura)
	else:
		return
