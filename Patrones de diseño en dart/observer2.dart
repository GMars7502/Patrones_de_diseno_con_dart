/*
Observer es un patrón de diseño de comportamiento que te
permite definir un mecanismo de suscripción para notificar a
varios objetos sobre cualquier evento que le suceda al objeto
que están observando.
Patrones de diseño - Alexander Shvets

*/

void main() {
  // Crea un sujeto observable.
  var subject = Subject();

  // Crea observadores y los registra en el sujeto.
  var observer1 = ConcreteObserver("Peru", subject);
  var observer2 = OtherCbserver("Colombia", subject);

  subject.addObserver(observer1);
  subject.addObserver(observer2);

  print(subject.state.toString());
  // Cambia el estado del sujeto, lo que notificará a los observadores.
  subject.state = "apagado";

  // Elimina un observador y cambia el estado nuevamente.
  subject.removeObserver(observer2);
  subject.state = "Activo";
}

abstract class Observer {
  void update();
}

// Clase Observable concreta que notificará a sus observadores cuando su estado cambie.
class Subject {
  String _state = 'Activo';

  //Lista de metodos para realizar subscripciones y la notificacion
  List<Observer> _observers = [];

  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  void notifyObservers() {
    for (var observer in _observers) {
      observer.update();
    }
  }

  //Inicializaar el subject
  //Subject(this._state);

  String get state => _state;

  set state(String newState) {
    _state = newState;
    // Notifica a todos los observadores cuando el estado cambia.
    notifyObservers();
  }
}

// Clase Observadora concreta que será notificada cuando el estado del sujeto cambie.
class ConcreteObserver implements Observer {
  final String _name;
  final Subject _subject;

  ConcreteObserver(this._name, this._subject);

  @override
  void update() {
    print(
        '$_name ha sido notificado: Nuevo estado del sujeto -> ${_subject.state}');
  }
}

class OtherCbserver implements Observer {
  final String _name;
  final Subject _subject;

  OtherCbserver(this._name, this._subject);

  @override
  void update() {
    print('$_name ha sido notificado: Nuestro estado es -> ${_subject.state}');
  }
}
