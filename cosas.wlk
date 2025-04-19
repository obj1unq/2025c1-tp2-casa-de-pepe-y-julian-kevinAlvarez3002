object electrodomestico {
	
}

object mueble {
	
}

object comida {
	
}

object heladera {
	const categoria = electrodomestico
	
	method precio() = 20000
	
	method categoria() = categoria
	
	method esDeCategoria(_categoria) = categoria == _categoria
}

object cama {
	const categoria = mueble
	
	method precio() = 8000
	
	method categoria() = categoria
	
	method esDeCategoria(_categoria) = categoria == _categoria
}

object tiraDeAsado {
	const categoria = comida
	
	method precio() = 350
	
	method categoria() = categoria
	
	method esDeCategoria(_categoria) = categoria == _categoria
}

object paqueteDeFideos {
	const categoria = comida
	
	method precio() = 50
	
	method categoria() = categoria
	
	method esDeCategoria(_categoria) = categoria == _categoria
}

object plancha {
	const categoria = electrodomestico
	
	method precio() = 1200
	
	method categoria() = categoria
	
	method esDeCategoria(_categoria) = categoria == _categoria
}