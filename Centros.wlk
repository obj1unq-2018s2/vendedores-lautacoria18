class CentrosDeDistribucion {
	
	//Punto 3
	var property ciudad
	var property vendedores
	var property certificacionDada
	
	
	method agregarVendedor(vendedor) { if (not (vendedores.contains(vendedor))) vendedores.add(vendedor)
										else {self.error ("El vendedor ya existe")}
	}
	
	method vendedorEstrella() {return vendedores.max{vendedor => vendedor.puntajeDeCertificaciones()}}
	
	method puedeCubrir(ciudadDada){return vendedores.any{vendedor => vendedor.puedeTrabajar(ciudadDada)}}
	
	method vendedoresGenericos(){return vendedores.filter {vendedor=> not (vendedor.tieneCertificacionDeProductos())}}
	
	method vendedoresFirmes() {return vendedores.filter {vendedor=>  (vendedor.vendedorFirme())}}
	
	method esRobusto() {return self.vendedoresFirmes().size() >= 3 }
	
	//Punto 4
	
	method agregarCertificaciones() {vendedores.forEach {vendedor=> vendedor.agregarCertificacion(certificacionDada	)}}
	
	
}
