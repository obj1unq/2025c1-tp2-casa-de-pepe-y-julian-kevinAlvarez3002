import cosas.*

object casaDePepeYJulian {
  const cosasCompradas = []
  var  cuenta = cuentaConGasto 
  method cuenta(_cuenta) {
    cuenta=_cuenta
  } 
  method cosasCompradas() = cosasCompradas
  
  method comprar(cosa) {
    cuenta.gastar(cosa.precio())
    cosasCompradas.add(cosa)
  }
  
  method cantidadDeCosasCompradas() = cosasCompradas.size()
  
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
object cuentaCorriente {
  var property saldo = 0
  method depositar(deposito) {
    saldo +=deposito
  } 
  method puedoGastar(coste) =coste<=saldo 
  method validarGastar(coste){
    if(not self.puedoGastar(coste)){
        self.error("no tenes dinero suficiente en tu cuenta")
    }
  } 
  method gastar(coste) {
    self.validarGastar(coste)
    saldo -=coste
  }
}
object cuentaConGasto {
    var property saldo = 0
    const costeOperacion = 20
    method puedoDepositar(deposito) = deposito<=1000
    method validarDepositar(deposito) {
      if(not self.puedoDepositar(deposito)){
        self.error("no podes depositar mas de 1000 por deposito")
      }
    }
  method depositar(deposito) {
    self.validarDepositar(deposito)
    saldo +=deposito - costeOperacion
  } 
  method gastar(coste) {
    saldo -=coste
  }
}