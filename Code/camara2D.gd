extends Camera2D

# aplicamos las velocidades respectivas para zoom y movimiento de la camara #

var velocidad_movimiento = 200.0
var velocidad_zoom = 2.0

# declaramos el minimo y el maximo de zoom que puede tener la camara base #

var zoom_minimo = Vector2(0.2, 0.2)
var zoom_maximo = Vector2(5.0, 5.0)
# Aplicacion de edicion de imagen 3D #

func _process(delta: float) -> void:
	
	# Aplicamos movimiento de la camara en 8 direcciones #
	
	var direccion = Input.get_vector("A","D","W","S")
	if direccion != Vector2.ZERO:
		position += direccion * velocidad_movimiento * delta
	
	# Aplicamos zoom in y zoom out visualmente #
	
	if Input.is_action_pressed("ZOOM IN"):
		zoom += Vector2(velocidad_zoom, velocidad_zoom) * delta
	elif Input.is_action_pressed("ZOOM OUT"):
		zoom -= Vector2(velocidad_zoom, velocidad_zoom) * delta
	
	# aplicamos un limite de la camara #
	
	zoom = zoom.clamp(zoom_minimo, zoom_maximo)
