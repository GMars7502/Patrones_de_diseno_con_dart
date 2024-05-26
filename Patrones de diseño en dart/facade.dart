/*
FACADE
También llamado: Fachada
Facade es un patrón de diseño estructural que proporciona
una interfaz simplificada a una biblioteca, un framework o cua-
lquier otro grupo complejo de clases.

Patrones de diseño - Alexander Shvets

*/

void main() {
  var a = facade().getInfoA();
  var b = facade().getInfoB();
  var c = facade().getInfoC();
  var all = facade().getAll();

  print('$a \n');
  print('$b \n');
  print('$c \n');
  print('$all \n');
}

//Distintas clases
class moduleA {
  String getInfo() {
    return "Informacion de la A";
  }
}

class moduleB {
  String getInfo() {
    return "Informacion de la B";
  }
}

class moduleC {
  String getInfo() {
    return "Informacion de la C";
  }
}

//clase fachada o biblioteca
class facade {
  late moduleA ModuleA;
  late moduleB ModuleB;
  late moduleC ModuleC;

  facade() {
    ModuleA = moduleA();
    ModuleB = moduleB();
    ModuleC = moduleC();
  }

  String getInfoA() {
    return ModuleA.getInfo();
  }

  String getInfoB() {
    return ModuleB.getInfo();
  }

  String getInfoC() {
    return ModuleC.getInfo();
  }

  String getAll() {
    return ModuleA.getInfo() +
        "\n" +
        ModuleB.getInfo() +
        "\n" +
        ModuleC.getInfo();
  }
}
