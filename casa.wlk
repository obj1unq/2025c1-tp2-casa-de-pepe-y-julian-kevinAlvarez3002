import cosas.*

object casaDePepeYJulian {
  const cosasCompradas = []
  var  cuenta = cuentaConGasto 
  method cuenta(_cuenta) {
    cuenta=_cuenta
  } 
  method cosasCompradas() = cosasCompradas
  
  method comprar(cosa) {
    cuenta.extraer(cosa.precio())
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
  method puedoextraer(cantidadAExtraer) =cantidadAExtraer<=saldo 
  method validarextraer(cantidadAExtraer){
    if(not self.puedoextraer(cantidadAExtraer)){
        self.error("no tenes dinero suficiente en tu cuenta")
    }
  } 
  method extraer(cantidadAExtraer) {
    self.validarextraer(cantidadAExtraer)
    saldo -=cantidadAExtraer
  }
}
object cuentaConGasto {
    var property saldo = 0
    var costeAExtraerOperacion = 20
    method costeAExtraerOperacion(_costeAExtraerOperacion) {
      costeAExtraerOperacion= _costeAExtraerOperacion
    }
    method puedoDepositar(deposito) = deposito<=1000
    method validarDepositar(deposito) {
      if(not self.puedoDepositar(deposito)){
        self.error("no podes depositar mas de 1000 por deposito")
      }
    }
  method depositar(deposito) {
    self.validarDepositar(deposito)
    saldo +=deposito - costeAExtraerOperacion
  } 
  method extraer(cantidadAExtraer) {
    saldo -=cantidadAExtraer
  }
}