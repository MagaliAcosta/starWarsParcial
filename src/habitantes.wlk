import planeta.*

class Persona {
	var property edad
	var property potencia = 20
	
	method inteligencia() = if (edad.between(20,40)) 12 else 8
	
	method esDestacada() = edad == 25 or edad == 35
	
	method ofrecerTributo(planeta) {}
	
	method valor() = self.potencia() + self.inteligencia()
	
}

class Atleta inherits Persona {
	var property masaMuscular = 4
	var property cantidadTecnicas = 2
	
	override method potencia() = super() + self.masaMuscular() * self.cantidadTecnicas()
	
	override method esDestacada() = super() or cantidadTecnicas > 5
	
	method entrenar(dias) {	masaMuscular += dias.div(5) }
	
	method aprenderTecnica() { cantidadTecnicas += 1 }
	
	override method ofrecerTributo(planeta) { planeta.construirMurallas(2) }
	
}

class Docente inherits Persona {
	var property cantidadCursos = 0
	
	override method inteligencia() = super() + cantidadCursos * 2
	
	override method esDestacada() = cantidadCursos > 3
	
	override method ofrecerTributo(planeta) { planeta.fundarMuseo() }
	
	override method valor() = super() + 5
	
}

class Soldado inherits Persona {
	var property armas = []
	
	override method potencia() = super() + armas.sum({ arma => arma.potencia(self) })
	
	override method ofrecerTributo(planeta) { planeta.construirMurallas(5) }
	
}

class Armas {
	method potencia(soldado)
	
}

class Pistolete inherits Armas {
	var property largo
	
	override method potencia(soldado) = if (soldado.edad() > 30) largo * 3 else largo * 2
	
}

class Espadon inherits Armas {
	var property peso
	
	override method potencia(soldado) = if (soldado.edad() < 30) peso / 2 else 6
	
}