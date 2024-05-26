/*
Factory Method es un patrón de diseño creacional que propo-
rciona una interfaz para crear objetos en una superclase, mie-
ntras permite a las subclases alterar el tipo de objetos que
se crearán.
Patrones de diseño - Alexander Shvets

*/

void main() {
  var a = Iemploye("programdor");

  print(a);
  a.trabajar();
}

abstract class Iemploye {
  void trabajar();
  factory Iemploye(String type) {
    switch (type) {
      case 'programdor':
        print("Preparado programador");
        return programdor();
      case 'archiveror':
        print('Preparado archivador');
        return archiveror();
      case 'boss':
        print('Preparado boss');
        return boss();
      default:
        print('no existe');
        return notexist();
    }
  }
}

class notexist implements Iemploye {
  @override
  void trabajar() {
    print("No existe lo que pide");
  }
}

class programdor implements Iemploye {
  @override
  void trabajar() {
    print("Codifica");
  }
}

class archiveror implements Iemploye {
  @override
  void trabajar() {
    print("Ordenar");
  }
}

class boss implements Iemploye {
  @override
  void trabajar() {
    print("Ordenar");
  }
}
