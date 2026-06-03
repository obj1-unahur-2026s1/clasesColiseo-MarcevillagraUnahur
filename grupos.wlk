import gladiadores.*

class Grupo {
  const nombre
  const gladiadores
  var peleas = 0

  method nombre() = nombre
  method peleas() = peleas

  method agregarGladiador(gladiador) { gladiadores.add(gladiador) }
  method quitarGladiador(gladiador) { gladiadores.remove(gladiador) }

  method gladiadoresVivos() = gladiadores.filter({ g => g.estaVivo() })

  method campeon() = self.gladiadoresVivos().max({ g => g.poderAtaque() })

  method combatirCon(otroGrupo) {
    peleas += 1
    otroGrupo.registrarPelea()
    3.times({ _i => self.campeon().pelearCon(otroGrupo.campeon()) })
  }

  method registrarPelea() { peleas += 1 }

  method curar() {
    gladiadores.forEach({ g => g.curar() })
  }
}
