/*
FLYWEIGHT
También llamado: Peso mosca, Peso ligero, Cache
Flyweight es un patrón de diseño estructural que te permi-
te mantener más objetos dentro de la cantidad disponible de
RAM compartiendo las partes comunes del estado entre va-
rios objetos en lugar de mantener toda la información en ca-
da objeto
Patrones de diseño - Alexander Shvets

*/

// Definición de la interfaz Bird
abstract class Bird {
  void draw();
}

// Implementación de AngryBird
class AngryBird implements Bird {
  final String color;

  AngryBird(this.color);

  @override
  void draw() {
    print("Angry Bird de : $color]");
  }

  void action() {
    print("fly in the sky");
  }
}

// Implementación de BirdFactory
class BirdFactory {
  static final Map<String, AngryBird> _angryBirdMap = {};

  static AngryBird getAngryBird(String color) {
    if (!_angryBirdMap.containsKey(color)) {
      final angryBird = AngryBird(color);
      _angryBirdMap[color] = angryBird;
      print("Creating Angry Bird of color : $color");
    }
    return _angryBirdMap[color]!;
  }
}

// Ejemplo de uso
void main() {
  AngryBird bird1 = BirdFactory.getAngryBird("red");
  bird1.draw();

  AngryBird bird2 = BirdFactory.getAngryBird("green");
  bird2.draw();

  AngryBird bird3 = BirdFactory.getAngryBird("red");
  bird3.draw();
}
