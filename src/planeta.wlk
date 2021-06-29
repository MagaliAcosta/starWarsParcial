import habitantes.*

class Planeta {
	var property habitantes = []
	var property cantidadMuseos = 0
	var property longitudMurallas = 0
	
	method delegacionDiplomatica() = habitantes.filter({ habitante => habitante.esDestacada() })
	
	method valorInicialDefensa() = habitantes.count({ habitante => habitante.potencia() >= 30 })
	
	method esCulto() = cantidadMuseos >= 2 and habitantes.all({ habitante => habitante.inteligencia() >= 10 })
	
	method potenciaReal() = habitantes.sum({ habitante => habitante.potencia() })
	
	method construirMurallas(longitud) { longitudMurallas += longitud }
	
	method fundarMuseo() { cantidadMuseos += 1 }
	
	method potenciaAparente() = habitantes.max({ habitante => habitante.potencia() }).potencia() * habitantes.size()
	
	method necesitaReforzarse() = self.potenciaAparente() >= self.potenciaReal() * 2
	
	method recibirTributos() { habitantes.forEach({ habitante => habitante.ofrecerTributo(self) }) }
	
	method habitantesValiosos() = habitantes.filter({ habitante => habitante.valor() >= 40 })
	
	method apaciguar(planeta) { self.habitantesValiosos().forEach({ habitante => habitante.ofrecerTributo(planeta) }) }
	
}