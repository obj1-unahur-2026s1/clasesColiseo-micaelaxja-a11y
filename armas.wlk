class Arma{
  var filo = 0
  var longitud = 0 //cm

  method valorDeAtaque(){
    return filo * longitud
  }
//filo
  method filo(){ //getter
    return filo
  }
  method modificarFilo(nuevoValor){ //setter
    filo = 1
  }
// longitud

  method longitud(){
    return longitud
  }
  method longitud(centimetros){
    longitud = centimetros
  }

}
class Contundente inherits Arma{
    var  armaContundente 

  override method valorDeAtaque(){
      return armaContundente.peso()
    }
}

  
