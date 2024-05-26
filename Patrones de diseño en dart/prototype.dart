/*
Prototype es un patrón de diseño creacional que nos permi-
te copiar objetos existentes sin que el código dependa de
sus clases.
Patrones de diseño - Alexander Shvets

*/
void main() {
  var a = CuentaAhorro('hola', 12);
  a.getCuenta();
  a.setMonto(120);

  var b = a.clonar();

  b.getCuenta();
  a.getCuenta();

  print('Hash de a: ${identityHashCode(a)}');
  print('Hash de b: ${identityHashCode(b)}');
}

abstract class ICuenta {
  ICuenta clonar();
}

class CuentaAhorro implements ICuenta {
  String nombre = 'Ahorro';
  int monto = 0;

  CuentaAhorro(String tipo, int Monto) {
    nombre = tipo;
    monto = Monto;
  }

  @override
  CuentaAhorro clonar() {
    return CuentaAhorro(this.nombre, this.monto);
  }

  setnombre(String otronombre) {
    nombre = otronombre;
  }

  setMonto(int MONTO) {
    monto = MONTO;
  }

  getCuenta() {
    print('Cuenta tipo $nombre con monto $monto');
  }
}
