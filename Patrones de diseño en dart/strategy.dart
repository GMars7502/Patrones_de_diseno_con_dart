/*
Strategy es un patrón de diseño de comportamiento que te pe-
rmite definir una familia de algoritmos, colocar cada uno de
ellos en una clase separada y hacer sus objetos intercambiab-
les.
Patrones de diseño - Alexander Shvets
*/
void main() {
  Contexto a = Contexto(AntivirusSimple());
  Contexto b = Contexto(AntivirusAvanzado());

  a.ejecutar();
  b.ejecutar();
}

class Contexto {
  late iEstrategia _estrategia;

  Contexto(iEstrategia estrategia) {
    _estrategia = estrategia;
  }

  void ejecutar() {
    this._estrategia.Accion();
  }
}

abstract class iEstrategia {
  void Accion() {}
}

abstract class AnalisisSimple implements iEstrategia {
  void Accion() {
    iniciar();
    saltar();
    detener();
  }

  void iniciar() {}
  void saltar() {}
  void detener() {}
}

abstract class AnalisisAvanzado implements iEstrategia {
  void Accion() {
    iniciar();
    saltar();
    analizarMemoria();
    analizarX();
    analizarY();
    detener();
  }

  void iniciar();
  void saltar();
  void analizarMemoria();
  void analizarX();
  void analizarY();
  void detener();
}

class AntivirusSimple extends AnalisisSimple {
  @override
  void iniciar() {
    print('Iniciado analisis de Ant-Simple');
  }

  @override
  void saltar() {
    print('Analizado archivos');
  }

  @override
  void detener() {
    print('Detener el programa. analisis simple finalizado');
  }
}

class AntivirusAvanzado extends AnalisisAvanzado {
  @override
  void analizarMemoria() {
    print('Analisis del cache de memoria');
  }

  @override
  void analizarX() {
    print('Realización del analisis X');
  }

  @override
  void analizarY() {
    print('Realizacion del analisis Y');
  }

  @override
  void detener() {
    print('Detener el programa. analisis simple finalizado');
  }

  @override
  void iniciar() {
    print('Iniciado analisis de Ant-Avanzado');
  }

  @override
  void saltar() {
    print('Analizado archivos');
  }
}
