import marcas.*
import personas.*
import jarras.*
class CarpaCervecera {
	var property limiteDeGente
	var property tieneBanda
	var property marcaQueVende
	var property personasEnLaCarpa = #{}
	
	method cantPersonasDentro() {
		return personasEnLaCarpa.size()
	}
	method dejaIngresarA(persona) {
		return limiteDeGente > self.cantPersonasDentro() and not persona.estaEbria()
	}
	method venderJarraA(capacidad, persona) {
		if(personasEnLaCarpa.contains(persona)) {
			persona.comprarJarra(new Jarra(marca= self.marcaQueVende(), capacidad= capacidad))
		}
		else {
			self.error("Error: esta persona no está en la carpa")
		}
	}	
	method cantDeEbriosEmpedernidos() {
		return personasEnLaCarpa.count({persona=>persona.esEbriaEmpedernida()})
	}

}
