import armas.*
import armaduras.*

class Gladiador {
  var vida = 100

  method vida() = vida
  method destreza()        
  method poderAtaque()    
  method defensa()         

  method estaVivo() = vida > 0

  method recibirDanio(danio) {
    vida = (vida - danio).max(0)
  }

  method atacar(otro) {
    const danio = (self.poderAtaque() - otro.defensa()).max(0)
    otro.recibirDanio(danio)
  }

  method pelearCon(otro) {
    self.atacar(otro)
    otro.atacar(self)
  }

  method curar() {
    vida = 100
  }

  method nombreGrupo(otro)   // abstracto: cada subclase define cómo nombra su grupo
}

class Mirmillon inherits Gladiador {
  const fuerza
  var arma
  var armadura

  override method destreza() = 15

  override method poderAtaque() = arma.poderAtaque() + fuerza

  override method defensa() = armadura.puntosArmadura(self) + self.destreza()

  method cambiarArma(nuevaArma) { arma = nuevaArma }
  method cambiarArmadura(nuevaArmadura) { armadura = nuevaArmadura }

  override method nombreGrupo(otro) = "mirmillolandia"
}

class Dimachaerus inherits Gladiador {
  var destreza
  const armas = []

  override method destreza() = destreza

  override method poderAtaque() = 10 + armas.sum({ a => a.poderAtaque() })

  override method defensa() = destreza / 2

  override method atacar(otro) {
    super(otro)
    destreza += 1
  }

  method agregarArma(arma) { armas.add(arma) }
  method quitarArma(arma) { armas.remove(arma) }

  override method nombreGrupo(otro) = "D-" + (self.poderAtaque() + otro.poderAtaque()).toString()
}
