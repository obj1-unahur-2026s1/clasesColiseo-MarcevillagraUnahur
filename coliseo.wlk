import grupos.*
import gladiadores.*

object coliseo {
  // Combate entre dos grupos
  method organizar(grupo1, grupo2) {
    grupo1.combatirCon(grupo2)
  }

  // Hace combatir un grupo contra un gladiador suelto (lo envuelve en un grupo temporal)
  method organizarContraGladiador(grupo, gladiador) {
    const grupoSuelto = new Grupo(nombre = "suelto", gladiadores = [gladiador])
    grupo.combatirCon(grupoSuelto)
  }

  // Un gladiador arma un grupo con otro: el nombre lo define el gladiador que convoca
  method formarGrupo(gladiador1, gladiador2) =
    new Grupo(nombre = gladiador1.nombreGrupo(gladiador2), gladiadores = [gladiador1, gladiador2])

  // Curar: acepta tanto un Grupo como un Gladiador suelto (ambos entienden curar())
  method curar(grupoOGladiador) {
    grupoOGladiador.curar()
  }
}
