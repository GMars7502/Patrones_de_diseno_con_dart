/*
MEMENTO
También llamado: Recuerdo, Instantánea, Snapshot
Memento es un patrón de diseño de comportamiento que te
permite guardar y restaurar el estado previo de un objeto sin
revelar los detalles de su implementación.

Patrones de diseño - Alexander Shvets
*/

void main() {
  List<Memento> savedStates = [];

  Originator originator = Originator();
  originator.setState('State1');
  originator.setState('State2');
  savedStates.add(originator.createMemento());
  originator.setState('State3');
  // Podemos solicitar múltiples mementos y elegir a cuál regresar.
  savedStates.add(originator.createMemento());
  originator.setState('State4');

  originator.restore(savedStates[1]);
}

class Originator {
  String? _state;

  void setState(String state) {
    _state = state;
    print('Originator: Estableciendo estado a $state');
  }

  Memento createMemento() {
    print('Originator: Guardado memoria.');
    return Memento(_state!);
  }

  void restore(Memento memento) {
    _state = memento.getSavedState();
    print('Originator: Estado después de restaurar desde la memoria: $_state');
  }
}

class Memento {
  final String _state;

  Memento(this._state);

  String getSavedState() {
    return _state;
  }
}
