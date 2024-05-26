/*
BRIDGE
También llamado: Puente
Bridge es un patrón de diseño estructural que te permite di-
vidir una clase grande, o un grupo de clases estrechamente
relacionadas, en dos jerarquías separadas (abstracción e im-
plementación) que pueden desarrollarse independientemente
la una de la otra.

Patrones de diseño - Alexander Shvets

*/

void main() {
  ChurroMachineChocolate a = ChurroMachineChocolate();
  ChurroMachineVainilla b = ChurroMachineVainilla();

  SmallChurroFactory(a).prepararChurro();
  MediumChurroFactory(b).prepararChurro();
  LargeChurroFactory(a).prepararChurro();
}

//||||||||||||||||||||||||bridge||||||||||||||||||||||||||||||
abstract class churrofactory {
  late ChurroMachine churromachine;

  churrofactory(ChurroMachine a) {
    this.churromachine = a;
  }

  void prepararChurro();
}

//|||||||||||||||||||||||||||||||||||||||||products||||||||||||||||||

class SmallChurroFactory extends churrofactory {
  late ChurroMachine churromachine;

  SmallChurroFactory(super.a);

  @override
  void prepararChurro() {
    print('Churro pequeño');
    churromachine.startChurroMachine();
    print(churromachine.getChurro());
    print('---------------------------------------------------');
  }
}

class MediumChurroFactory extends churrofactory {
  late ChurroMachine churromachine;

  MediumChurroFactory(super.a);

  @override
  void prepararChurro() {
    print('Churro mediano');
    churromachine.startChurroMachine();
    print(churromachine.getChurro());
    print('---------------------------------------------------');
  }
}

class LargeChurroFactory extends churrofactory {
  late ChurroMachine churromachine;

  LargeChurroFactory(super.a);

  @override
  void prepararChurro() {
    print('Churro largo');
    churromachine.startChurroMachine();
    print(churromachine.getChurro());
    print('---------------------------------------------------');
  }
}

//|||||||||||||||||||||||||||interfaz briged|||||||||||||||||||||||
abstract class ChurroMachine {
  void startChurroMachine();
  String getChurro();
}

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
class ChurroMachineChocolate implements ChurroMachine {
  @override
  void startChurroMachine() {
    print("Empezando Preparacion");
  }

  @override
  String getChurro() {
    return "Churro de chocolate";
  }
}

class ChurroMachineVainilla implements ChurroMachine {
  @override
  void startChurroMachine() {
    print("Empezando Preparacion");
  }

  @override
  String getChurro() {
    return "Churro de Vainilla";
  }
}
