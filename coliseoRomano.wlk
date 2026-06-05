import armas.*
import gladiador.*

//Grupos
class Grupo{
    const luchadores = #{}
    var nombre 
    var cantidadDePeleas
    const nuevoGrupo = #{}


    method agregarGladiador(unGladiador){
        luchadores.add(unGladiador)
    }
    method quitarGladiador(unGladiador){
        luchadores.remove(unGladiador)
    }
    method crearNuevoGrupo(gladiador1,gladiador2){
        

        if(gladiador1.esUnMirmillon()){
            nombre == "mirmillolandia"
            nuevoGrupo.add(gladiador1)
            nuevoGrupo.add(gladiador2)

        }
        else{
            nombre =="D-12"
            nuevoGrupo.add(gladiador1)
            nuevoGrupo.add(gladiador2)
        }
    }
    method esUnMirmillon(unGladiador){
        return unGladiador.destreza() == 15
    }

    }


class Combate{
    const luchadores = #{}

    method cantidadRounds(){
        return 3
    
    }
    method elegirCampeon(){
        return luchadores.max({l=>l.vidas()})
    }
}

object coliseo{
    const combate = #{}
    const grupo = #{}  

    method combate(){
        return combate
    }
    method combateContra(unGrupo,unGladiadorSolo){
        unGrupo.forEach({g=>g.atacar(unGladiadorSolo)})
    }
    method combateEntre(grupo1,grupo2){
    // Determinamos cuántas parejas pueden formarse según el grupo más chico
        var cantidadParejas = grupo1.size().min(grupo2.size())

        cantidadParejas.forEach({ i =>
            var gladiadorA = grupo1.get(i)
            var gladiadorB = grupo2.get(i)
// Se atacan mutuamente
            gladiadorA.atacar(gladiadorB)
            gladiadorB.atacar(gladiadorA)
        })
    }

    method grupo(){
        return grupo
    }
    method curarAGrupo(unGrupo){
        unGrupo.forEach({g=>g.restablecerVida(g)})

    }
    method curarA(unGladiador){
        unGladiador.restablecerVida()
    }
    method restablecerVida(unGladiador){
        return  unGladiador.vida() == 100
    }
}
