import armas.*

//Los Gladiadores.
class Gladiador{
    var armaActual 
    var destreza 
    var habilidad
    var puntos
    var vida = 100
    var fuerza

    method armaActual(){
        return armaActual
    }
    method cambiarArma(nuevaArma){
        armaActual = nuevaArma
    }

    method puntos(){
        return puntos
    }
    method sumarPuntosPorArmadura(cantidad){
        puntos = puntos + cantidad
        return puntos
    }

    method destreza(){
        return destreza
    }
    method sumarDestreza(valor){
        destreza = destreza + valor
        return destreza
    }
    method restarDestreza(valor){
        destreza = destreza - valor
        return destreza
    }
    method vida(){
        return vida
    }
    method restarVida(unidades){
        vida = vida - unidades
    }
    method sumarVida(cantidad){
        vida = (vida + cantidad).max(100)
    }
    method fuerza(){
        return fuerza
    }
    method cambiarFuerza(nuevoValor){
        fuerza = nuevoValor
    }
    method habilidad(){
        return habilidad
    }

    method atacar(){

    }
    method defenderse(){

    }
    
    
}

class Mirmillon inherits Gladiador{
    var tipoDeArmadura

    override method destreza(){
        return 15
    }
    method cambiarArmadura(nueva){
        tipoDeArmadura =  nueva
    }
    method tipoDeArmadura(){
        return tipoDeArmadura
    }
    method atacar(unGladiador){
        self.poderDeAtaque() - unGladiador.tipoDeArmadura()

    }
    method poderDeAtaque(){
        return self.armaActual() + self.fuerza()
    }
    override method defenderse(){
        return tipoDeArmadura.puntos()+ self.destreza()
    }

}  

class Dimachaerus inherits Gladiador{
    const armas = #{}

    override method armaActual(){
        return armas
    }
    override method fuerza(){
        return 10

    }
    method atacar(unGladiador){
        self.poderDeAtaque() - unGladiador.tipoDeArmadura()
        self.destreza() + 1
    }
    method poderDeAtaque(){
        return self.fuerza() + self.poderesDeArmasActuales()
    }
    method poderesDeArmasActuales(){
        return armas.sum({a=>a.valorDeAtaque()})
    }
    override method defenderse(){
        return self.destreza() / 2
    }

}

class Armadura{
    const tipoDeArmadura = #{} //cascos y escudos

    method tipoDeArmadura(){
        return tipoDeArmadura
    }

}

object Casco inherits Armadura{
    const puntos = 10

    method puntos(){
        return puntos
    }
}

object Escudo inherits Armadura{
        
    method puntos(unGladiador){
        return 5 + unGladiador.destreza() * 0.1
    }

}