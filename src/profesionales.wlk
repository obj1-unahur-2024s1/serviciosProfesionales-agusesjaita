// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var property universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() = [universidad.provincia()]
	method honorariosPorHora() { return 3000 }
	method puedeAtender(solicitante) = self.provinciasDondePuedeTrabajar().contains(solicitante.provincia())
	method cobrar(monto) {
		asociacionPL.donar(monto)
	}
}

object asociacionPL {
	var recaudado = 0
	
	method donar(importe) {recaudado = recaudado + importe}
}

// a esta clase le faltan métodos
class ProfesionalVinculado {
	var property universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method honorariosPorHora() = universidad.honorariosPorHora()
	method provinciasDondePuedeTrabajar() = universidad.provincia()
	method puedeAtender(solicitante) = self.provinciasDondePuedeTrabajar().contains(solicitante.provincia())
	method cobrar(monto) {
		universidad.donar(monto/2)
	}
}



// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var property universidad
	const property provincias = []
	var property honorariosPorHora
	
}


class Universidad {
	var donaciones = 0
	var property honorariosPorHora
	var property provincia
	
	method donar(importe) {donaciones = donaciones + importe}
	
}

class Empresa {
	const empleados = []
	const clientes = []
	
	method contratar(emp) = empleados.add(emp)
	method puedeSatisfacer(solicitante) = empleados.any({e => solicitante.puedeSerAtendido(e)})
	method darServicio(unSolicitante) {
		if (self.puedeSatisfacer(unSolicitante)) (const elegido = empleados.anyOne())
		elegido.cobrar(elegido.honorarioPorHora())
		clientes.add(unSolicitante) else {}
	}
}


class Persona {
	var property provincia 
	
	method puedeSerAtendido(profesional) = profesional.provinciaDondePuedeTrabajar()
}


class Institucion {
	const reconocidas = []
	
	method agregarReconocida(uni) = reconocidas.add(uni)
	method puedeSerAtendido(profesional) = reconocidas.contains(profesional.universidad())
}




















