import coliseo.*
import armas2.*

class Gladiador{
    var arma
    var destreza 
    var habilidad
    var armadura
    var puntos
    var vida = 100
    var fuerza

    method fuerza(){
        return fuerza
    }
    method puntos(){
        return puntos
    }
    method vida(){
        return vida
    }
    method puedeCombatir(){
        return self.vida() >=1
    }

    method sumarPuntosPorArmadura(cantidad){
        puntos = puntos + cantidad
    }
    method destreza(){
        return destreza
    } 

    method atacar(unEnemigo) // abst
    method defensa(portador)
    method recibirAtaque(unEnemigo) // abs
    

    method valorDeAtaque() // abs

    method pelearCon(unEnemigo){
        self.atacar(unEnemigo)
        unEnemigo.atacar(unEnemigo)
    }
    method crearGrupo(otroGladiador) // abs

    method curarse(){
        vida = vida + 20

    }
}

class Mirmillon inherits Gladiador(arma=espada,armadura=casco){
    
    override method destreza(){
        return 15
    }

    override method atacar(unEnemigo){
        unEnemigo.recibirAtaque()

    }
    
    override method defensa(portador){
        return armadura.puntos(self) + self.destreza()
    }

    override method crearGrupo(otroGladiador){
        return new GrupoDeLuchadores(nombreDelGrupo= "Mirmillolandia", cantidadPeleas= 0,gladiadores=[self,otroGladiador])
            
    }
    override method recibirAtaque(unEnemigo){
        return unEnemigo.poderDeAtaque() - self.defensa(self)
    }
    override method valorDeAtaque(){
        return arma.valorDeAtaque() + self.fuerza()
    }


}
class Dimachaerus inherits Gladiador(fuerza=10,arma=#{}){

    override method atacar(unEnemigo){
        unEnemigo.recibirAtaque(self)
        self.destreza() + 1

    }

    override method valorDeAtaque(){
        return self.fuerza() + self.poderDeTodasLasArmasQueTiene()
    }

    method poderDeTodasLasArmasQueTiene(){
        return  arma.sum({a=>a.valorDeAtaque()})
    }

    override method defensa(portador){
        return self.destreza() / 2
    }

    override method crearGrupo(otroGladiador){
        return new GrupoDeLuchadores(nombreDelGrupo= "D-12", cantidadPeleas= 0,gladiadores=[self,otroGladiador])
        
    }
    override method recibirAtaque(unEnemigo){
        return unEnemigo.valorDeAtaque() - self.defensa(self)
        
    }

}

class Armadura{

    method puntos(portador) // abs

}

object casco inherits Armadura{

    override method puntos(portador){
        return 10
    }

}

object escudo inherits Armadura{
    override method puntos(portador){
        return 5 + portador.destreza() * 0.1
    }

}