// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad = null
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrarImporte(cantidad) {asociacionProfeLitoral.recibirDonacion(cantidad)}
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad = null
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() = universidad.provinciaLocal()
	method honorariosPorHora() = universidad.honorariosRecomendados()
	
	method cobrarImporte(cantidad) {universidad.recibirDonacion(cantidad / 2)}
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad = null
	const provincia = #{}
	var honorarios = 0
	var cobros = 0
		
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar(provincias) = provincia.addAll(provincias)
	method provinciasDondePuedeTrabajar() = provincia
	
	method honorariosPorHora(cantidad) {honorarios = cantidad}
	method honorariosPorHora() = honorarios
	
	method cobrarImporte(cantidad) {cobros = cantidad}
	method pasarDinero(cantidad, profesional) {
		cobros = 0.max(cobros - cantidad)
		profesional.cobrarImporte(cantidad)
	}	
}


class Universidad {
	var provincia = null
	var honorarios = 0
	var donaciones = 0 
	
	method provinciaLocal(provincias) {provincia = provincias}
	method provinciaLocal() = provincia
	
	method honorariosRecomendados(cantidad) {honorarios = cantidad}
	method honorariosRecomendados() = honorarios
	
	method recibirDonacion(cantidad) {donaciones = cantidad}
}


class EmpresaDeServicios {
	const profesionales = []
	var honorario = 0
	
	method contratar(profesionaless) = profesionales.addAll(profesionaless)
	
	method honorarioDePreferencia(cantidad) {honorario = cantidad}
	method honorarioDePreferencia() = honorario
	
	method cuantosEstudiaronEn(uni) = profesionales.count({profesional => profesional.universidad() == uni})
	
	method profesionalesCaros() = profesionales.filter({profesional => profesional.honorariosPorHora() > honorario})
	
	method universidadesFormadoras() {
		const formadoras = #{}
		profesionales.forEach({profesional => formadoras.add(profesional.universidad())})
		return formadoras
	}
	
	method profesionalBarato() = profesionales.min({profesional => profesional.honorariosPorHora()})
	
	method esDeGenteAcotada() = profesionales.all({profesional => profesional.provinciasDondePuedeTrabajar().size() == 3}) or 
								profesionales.all({profesional => profesional.provinciasDondePuedeTrabajar().size() < 3})
	
	method puedeSatisfacerA(solicitante) = profesionales.any({profesional => solicitante.puedeSerAtendidoPor(profesional)})
	
}


// solicitantes
class Persona {
	var property provincia = ''
	
	method puedeSerAtendidoPor(profesional) = 
	profesional.provinciasDondePuedeTrabajar().contains(provincia)
}


class Institucion {
	var property universidadesReconocidas = #{}
	
	method puedeSerAtendidoPor(profesional) = 
	universidadesReconocidas.contains(profesional.universidad())
}


class Club {
	var property provinciasDondeEsta = #{}
	
	method puedeSerAtendidoPor(profesional) =
		provinciasDondeEsta.any({provincia => profesional.provinciasDondePuedeTrabajar().contains(provincia)})
	
}


// cobros
object asociacionProfeLitoral {
	var donaciones = 0
	
	method recibirDonacion(cantidad) {donaciones = cantidad}
}















