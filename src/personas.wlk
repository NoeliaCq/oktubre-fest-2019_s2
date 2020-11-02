import marcas.*
import carpas.*

class Persona {
	var property peso
	var property jarrasCompradas = []
	var property escuchaMusicaTradi
	var property nivelDeAguante
	var property paisDeOrigen
	
	method totalDeAlcohol() {
		return jarrasCompradas.sum({jarra => jarra.contenidoDeAlcohol()})
	}
	method estaEbria() {
		return self.totalDeAlcohol() * peso > nivelDeAguante
	}
	method leGustaEstaCerveza(cerveza) {
		return true
	}
	method quiereEntrarALaCarpa(carpa) {
		return self.leGustaEstaCerveza(carpa.marcaQueVende()) and (carpa.tieneBanda() == self.escuchaMusicaTradi())
	}
	method puedeEntrarA(carpa) {
		return self.quiereEntrarALaCarpa(carpa) && carpa.dejaIngresarA(self)
	}
	method entrarACarpa(carpa) {
		if(self.puedeEntrarA(carpa)) {
			carpa.personasEnLaCarpa().add(self)
		}
		else {
			self.error("Error: No se permite el ingreso de esta persona a la carpa")
		}
	}
	method comprarJarra(jarra) {
		jarrasCompradas.add(jarra)
	}
	method comprarJarras(listaDeJarras) {
		jarrasCompradas.addAll(listaDeJarras)
	}
	method esEbriaEmpedernida() {
		return jarrasCompradas.all({jarra=> jarra.capacidad() >= 1})
	}
	method esPatriota() {
		return jarrasCompradas.all({jarra=> jarra.paisDeOrigen() == self.paisDeOrigen()})
	}
}

class Belga inherits Persona {
	
	override method leGustaEstaCerveza(cerveza) {
		return cerveza.contenidoDeLupulo() > 4
	}
	
}

class Checo inherits Persona {
	override method leGustaEstaCerveza(cerveza) {
		return cerveza.graduacion() > 0.08
	}
	
}

class Aleman inherits Persona {
	override method quiereEntrarALaCarpa(carpa) {
		return super(carpa) and carpa.cantPersonasDentro().even()
	}
	
}
/////paises////
object belgica {}	//Stella
object republicaCheca {}	// Hofbrau??
object alemania {}	//Warsteiner
object holanda {}	//Heineken
object mexico {}	//Corona
object irlanda {}	//Guinness


