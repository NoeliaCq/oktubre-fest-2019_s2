class Cerveza {
	var property contenidoDeLupulo
	var property paisDeOrigen
	method graduacion()
}

class Rubia inherits Cerveza {
	var property graduacion
}

class Negra inherits Cerveza {
	
	override method graduacion() {
		return graduacionReglamentaria.graduacionMundial().min(self.contenidoDeLupulo() * 2)
	}
}

class Roja inherits Negra {	
	
	override method graduacion() {
		return super() * 1.25
	}
}

object graduacionReglamentaria {
	var property graduacionMundial = 0
}
