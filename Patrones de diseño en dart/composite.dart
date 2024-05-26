/*
Composite es un patrón de diseño estructural que te permite
componer objetos en estructuras de árbol y trabajar con esas
estructuras como si fueran objetos individuales.
Patrones de diseño - Alexander Shvets

*/

void main() {
  // Crear hojas
  Hoja leaf1 = Hoja('PINTURA', 1);
  Hoja leaf2 = Hoja('ESCRIBIR', 2);

  // Crear un objeto compuesto
  Composite composite = Composite();
  composite.add(leaf1);
  composite.add(leaf2);

  //composite.operation();

  // Crear otro objeto compuesto y añadirle el primer compuesto
  Composite composite2 = Composite();
  composite2.add(composite);
  composite2.add(Hoja('Mache', 3));
  composite2.add(Hoja('Brillate', 4));

  // Ejecutar la operación en el objeto compuesto
  composite2.operation();
}

// Define la interfaz Component
abstract class IComponent {
  void operation();
  int getNumber();
}

// Implementa la clase Leaf, que representa objetos individuales
class Hoja implements IComponent {
  final String name;
  final int _number;
  Hoja(this.name, this._number);

  @override
  void operation() {
    print('La hoja $name operación con numero: $_number ');
  }

  @override
  int getNumber() {
    return _number;
  }

  String getName() {
    return name;
  }
}

// Implementa la clase Composite, que representa objetos compuestos
class Composite implements IComponent {
  final List<IComponent> _children = [];
  int _price = 0;

  void add(IComponent component) {
    _children.add(component);
  }

  void remove(IComponent component) {
    _children.remove(component);
  }

  @override
  void operation() {
    _price = 0;
    for (var child in _children) {
      child.operation();
      _price = _price + child.getNumber();
    }
    print('el totla de los numeroos es : $_price');
  }

  @override
  int getNumber() {
    return _price;
  }
}
