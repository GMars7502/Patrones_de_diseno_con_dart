/*
Decorator es un patrón de diseño estructural que te permite
añadir funcionalidades a objetos colocando estos objetos de-
ntro de objetos encapsuladores especiales que contienen es-
tas funcionalidades.
Patrones de diseño - Alexander Shvets

*/

void main() {
  var usuario = Cuenta(1, 'Steve');

  //IabrirCuenta cuentaAhorro = CuentaAhorro();
  IabrirCuenta cuentaCorriente = CuentaCorriente();
  IabrirCuenta cuentaAsegurada = ComponenteDecorador(cuentaCorriente);
  //

  cuentaAsegurada.abrirCuenta(usuario);
}

//|||||||||||||||||||||||||||||||||Clases base del cliente||||||||||||||||||||||||||||||||||||||||
class Cuenta {
  int _id;
  String _cliente;

  // Utiliza la sintaxis de inicialización de campos en el constructor
  Cuenta(this._id, this._cliente);

  String getCliente() {
    return _cliente;
  }

  int getID() {
    return _id;
  }
}

abstract class IabrirCuenta {
  void abrirCuenta(Cuenta cliente) {}
}

class CuentaAhorro implements IabrirCuenta {
  @override
  void abrirCuenta(Cuenta cliente) {
    print('Se abrio cuenta de ahorro del cliente: ' + cliente.getCliente());
  }
}

class CuentaCorriente implements IabrirCuenta {
  @override
  void abrirCuenta(Cuenta cliente) {
    print('Se abrio cuenta corriente del cliente: ' + cliente.getCliente());
  }
}

//|||||||||||||||||||||||||||||||||||||||clases de la decoracion del objeto cuenta||||||||||||||||||||||

abstract class decorador implements IabrirCuenta {
  late IabrirCuenta cuentaDecoranda;

  decorador(IabrirCuenta cuentaDecoranda) {
    this.cuentaDecoranda = cuentaDecoranda;
  }

  @override
  void abrirCuenta(Cuenta cliente) {
    this.cuentaDecoranda.abrirCuenta(cliente);
  }
}

class ComponenteDecorador extends decorador {
  ComponenteDecorador(super.cuentaDecoranda);

  @override
  void abrirCuenta(Cuenta cliente) {
    // implement abrirCuenta
    super.abrirCuenta(cliente);
    AgregarSeguro(cliente);
  }

  void AgregarSeguro(Cuenta cliente) {
    print('Se agrego un seguro a su cuenta');
  }
}
