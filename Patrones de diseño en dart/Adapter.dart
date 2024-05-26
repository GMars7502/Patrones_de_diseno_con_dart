/*
Adapter es un patrón de diseño estructural que permite la co-
laboración entre objetos con interfaces incompatibles.
Patrones de diseño - Alexander Shvets

*/

void main() {
  OldSystem oldSystem = OldSystem();
  Target adapter = Adapter(oldSystem);

  adapter.request();
}

// Target: Interfaz que el cliente espera usar
abstract class Target {
  void request();
}

/*
abstract class oldTarget {
  void specificRequest();
}
*/

// Adaptee: La clase existente con una interfaz incompatible
class OldSystem {
  void specificRequest() {
    print('Llamada específica al OldSystem');
  }
}

// Adapter: La clase que adapta OldSystem a la interfaz Target
class Adapter implements Target {
  final OldSystem _oldSystem;

  Adapter(this._oldSystem);

  @override
  void request() {
    _oldSystem.specificRequest();
  }
}
