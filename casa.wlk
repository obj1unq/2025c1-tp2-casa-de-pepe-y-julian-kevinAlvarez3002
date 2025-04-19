import cosas.* 

object casaDePepeYJulian {
    const  cosasCompradas=#{}
    method comprar(cosa) {
       cosasCompradas.add(cosa)
    }
    method tieneAlgun(categoria) {
      return cosasCompradas.any({cosa => cosa.esDeCategoria(categoria)})
    }
    method vieneDeComprar(categoria){
        return cosasCompradas.last().categoria() == categoria
    } 
    method totalGastado() = cosasCompradas.sum({cosa => cosa.precio()})
    method esDerrochona() {
      return self.totalGastado() >= 9000
    }
    method compraMasCara() {
      return cosasCompradas.max({cosa=> cosa.precio()})
    }
    method comprados(categoria) {
      return cosasCompradas.filter({cosa => cosa.categoria() == categoria})
    }
    method malaEpoca() {
      return cosasCompradas.all({cosa=> cosa.esDeCategoria(comida)})
    }
    method queFaltaComprar(lista) {
      return lista.difference(cosasCompradas)  
    }
    method faltaComida() {
      return cosasCompradas.count({cosa=> cosa.esDeCategoria(comida) })
    }
}
