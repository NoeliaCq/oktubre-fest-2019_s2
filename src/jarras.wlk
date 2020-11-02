class Jarra {
	var property capacidad = 0.5
	var property marca
	
	method contenidoDeAlcohol() {
		return capacidad * marca.graduacion()
	}
	method paisDeOrigen() { return marca.paisDeOrigen() }
}