import  gladiador2.*
import armas2.*

class GrupoDeLuchadores{
    const gladiadores = []
    var nombreDelGrupo
    var cantidadPeleas

    method agregar(unGladiador){
        gladiadores.add(unGladiador)
    }
    method quitar(unGladiador){
        gladiadores.remove(unGladiador)
    }

    method elegirAlCampeondelGrupo(){
        return gladiadores.filter({g=>g.puedeCombatir()}).max({g=>g.fuerza()})
    }

    method pelearCon(unBando){
        unBando.forEach({g=>g.atacar(unBando)})
    }

    method curarse(){
        gladiadores.forEach({g=>g.curarse()})

    }
    }

 object coliseo{

    method organizarCombate(bando1,bando2){
        bando1.combatirContra(bando2)
        bando2.combatirContra(bando1)

    }
    method curarA(unBando){
        unBando.curarse()
    }
}