/*
CHAIN OF
RESPONSIBILITY
También llamado: Cadena de responsabilidad, CoR, Chain of
Command
Chain of Responsibility es un patrón de diseño de comporta-
miento que te permite pasar solicitudes a lo largo de una ca-
dena de manejadores. Al recibir una solicitud, cada manejador
decide si la procesa o si la pasa al siguiente manejador de
la cadena.

Patrones de diseño - Alexander Shvets

*/

void main() {
  Peticion a = Peticion(2, 'Este es un numero positivo par');

  ManejadorConcreto1 manejador1 = new ManejadorConcreto1();
  ManejadorConcreto2 manejador2 = new ManejadorConcreto2();
  ManejadorConcreto3 manejador3 = new ManejadorConcreto3();

  manejador1.setSucesor(manejador2);
  manejador2.setSucesor(manejador3);

  manejador1.manejarPeticion(a);
}

abstract class Manejador {
  late Manejador sucesor;

  void setSucesor(Manejador sucesor) {
    this.sucesor = sucesor;
  }

  void manejarPeticion(Peticion peticion);
}

class ManejadorConcreto1 extends Manejador {
  @override
  void manejarPeticion(Peticion peticion) {
    if (peticion.getValue() < 0) {
      print('Los valores negativos son manejados por' + runtimeType.toString());
      var rpt = '''Los parametros de la peticion son
      Valor: ${peticion.getValue()}
      Descripcion: ${peticion.getDescription()}
      ''';
      print(rpt);
    } else {
      sucesor.manejarPeticion(peticion);
    }
  }
}

class ManejadorConcreto2 extends Manejador {
  @override
  void manejarPeticion(Peticion peticion) {
    if (peticion.getValue() == 0) {
      print('Los valores nulos son manejados por ' + runtimeType.toString());
      var rpt = '''Los parametros de la peticion son
      Valor: ${peticion.getValue()}
      Descripcion: ${peticion.getDescription()}
      ''';
      print(rpt);
    } else {
      sucesor.manejarPeticion(peticion);
    }
  }
}

class ManejadorConcreto3 extends Manejador {
  @override
  void manejarPeticion(Peticion peticion) {
    if (peticion.getValue() > 0) {
      print('Los valores positivos son manejados por' + runtimeType.toString());
      var rpt = '''Los parametros de la peticion son
      Valor: ${peticion.getValue()}
      Descripcion: ${peticion.getDescription()}
      ''';
      print(rpt);
    } else {
      sucesor.manejarPeticion(peticion);
    }
  }
}

class Peticion {
  late int _value;
  late String _description;

  Peticion(int value, String description) {
    this._value = value;
    this._description = description;
  }

  int getValue() {
    return _value;
  }

  String getDescription() {
    return _description;
  }
}



//<>