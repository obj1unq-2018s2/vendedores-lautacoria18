class ClienteInseguro {
	
	method puedeSerAtendidoPor(vendedor) {
		
		return vendedor.esVersatil() and vendedor.vendedorFirme()
	}
	
	
}

class ClienteDetallista inherits ClienteInseguro {
	
	override method puedeSerAtendidoPor(vendedor) {
		
		return vendedor.certificaciones().size() >=3
	}
	
	
}

class ClienteHumanista inherits ClienteInseguro {
	
		override method puedeSerAtendidoPor(vendedor) {
		
		return vendedor.esFisico()
	}
	
}
