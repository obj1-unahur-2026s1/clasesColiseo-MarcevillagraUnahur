class Casco {
  method puntosArmadura(gladiador) = 10
}

class Escudo {
  method puntosArmadura(gladiador) = 5 + gladiador.destreza() * 0.1
}
