import cosas.*

object casaDePepeYJulian {
  const cosasCompradas = []
  
  method cosasCompradas() = cosasCompradas
  
  method comprar(cosa) {
    cosasCompradas.add(cosa)
  }
  
  method cantidadDeCosasCompradas() = cosasCompradas.count({ cosa => true })
  
  //no me gusta realmente como se ve pero no encontre en la documentacion como contar los elementos por lo que queda provisional
  method tieneAlgun(categoria) = cosasCompradas.any(
    { cosa => cosa.esDeCategoria(categoria) }
  )
  
  method vieneDeComprar(
    categoria
  ) = cosasCompradas.last().categoria() == categoria
  
  method totalGastado() = cosasCompradas.sum({ cosa => cosa.precio() })
  
  method esDerrochona() = self.totalGastado() >= 9000
  
  method compraMasCara() = cosasCompradas.max({ cosa => cosa.precio() })
  
  method comprados(categoria) = cosasCompradas.filter(
    { cosa => cosa.categoria() == categoria }
  )
  
  method malaEpoca() = cosasCompradas.all(
    { cosa => cosa.esDeCategoria(comida) }
  )
  
  method queFaltaComprar(lista) = lista.filter(
    { elemento => cosasCompradas.contains(elemento).negate() }
  )
  
  method faltaComida() = cosasCompradas.count(
    { cosa => cosa.esDeCategoria(comida) }
  ) < 2
  
  method categoriasCompradas() = cosasCompradas.map(
    { cosa => cosa.categoria() }
  ).asSet()
}