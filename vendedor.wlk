import limites.*
import Centros.*

class Vendedor {
	var property certificaciones= #{}
	
	//Punto 1
	method puedeTrabajar(ciudad) = false
	
	method esVersatil(){return 
			certificaciones >= 3 and self.tieneCertificacionDeProductos() and not (self.tieneCertificacionDeProductos())
	}
	
	method tieneCertificacionDeProductos(){return certificaciones.any{certificacion=> certificacion.esDeProductos()}}
	
	method puntajeDeCertificaciones(){return certificaciones.sum{certificacion => certificacion.cantPuntos()}}
	
	method vendedorFirme() {return self.puntajeDeCertificaciones() >= 30}
	
	
	//Punto 2
	
	method esInfluyente() = false
	
	
	///Punto 4
	
	method agregarCertificacion(certificacion) {certificaciones.add(certificacion)}
	
	
	//Punto 5
	
	method tieneAfinidad(centro){return self.puedeTrabajar(centro.ciudad())}
	
	
	method esCandidato(centro){return self.tieneAfinidad(centro) and self.esVersatil()}
	
	//Punto 6 
	
	method esFisico()= true
}

class VendedorFijo inherits Vendedor {
	
	var property ciudadQueVive
	
	override method puedeTrabajar(ciudad) {return ciudad == ciudadQueVive}
	
//	override method esVersatil(){return certificaciones >= 3}
	
}

class Viajante inherits Vendedor {
	
	var property provincias= #{}
	
	override method puedeTrabajar(ciudad) {return provincias.contains(ciudad.provincia())}
	
	method poblacionTotalProvincias() {return provincias.sum{provincia => provincia.poblacion()}}
	
	//Punto 2
	
	override method esInfluyente() {return self.poblacionTotalProvincias() >= 1000000	 }
	
	
}

class ComercioCorresponsal inherits Vendedor {
	
	var property ciudadesQueTieneSucursal= #{}
	
	override method puedeTrabajar(ciudad) {return ciudadesQueTieneSucursal.contains(ciudad)}
	
	method provinciasDeCiudades() {return ciudadesQueTieneSucursal.flatMap{ciudad => ciudad.provincia()}.asSet()}
	
	//Punto 2
	
	override method esInfluyente() {
			return 	ciudadesQueTieneSucursal.size() >= 5 or self.provinciasDeCiudades().size() > 3
	}	
	
	//Punto 5
	
	override method tieneAfinidad(centro){
			return super(centro) and  ciudadesQueTieneSucursal.any{ciudad => not (centro.puedeCubrir(ciudad))}
	
}

	//Punto 6
	
	override method esFisico() = false
}
class Certificacion {
	
	var property cantPuntos
	var property esDeProductos
}

