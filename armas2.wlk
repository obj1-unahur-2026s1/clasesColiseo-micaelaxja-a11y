class Arma{
    var pesoArma
    var filo // 0 y 1
    var longitud //cm


    method longitud(){
        return longitud
    }
    method pesoArma(){
        return pesoArma
    }

    method valorDeAtaque() // abst
    method filo()// abs

}
class ArmaDeFilo inherits Arma{

    override method valorDeAtaque(){
        return self.filo() * self.longitud()
    }

    override method filo(){
        return (0).min(1)
    }
}
object espada inherits ArmaDeFilo(pesoArma=10,filo=1,longitud=40){

}
object gladius inherits ArmaDeFilo(pesoArma=10,filo=0,longitud=40){

}
class ArmaContundende inherits Arma{

    override method valorDeAtaque(){
        return self.pesoArma()
    }

}