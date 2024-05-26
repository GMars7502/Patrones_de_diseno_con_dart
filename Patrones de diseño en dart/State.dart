//import 'dart:async';
/*
_timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (timedESPERTAR > 0) {
        timedESPERTAR--;
        print('Tiempo para que despierte: $timedESPERTAR segundos');
      } else {
        timer.cancel();
        print('HAAUUU ya estoy despierto, qué sueño tuve');
        _tamal.setState(Hambriento());
      }
    });

*/

/*
STATE
También llamado: Estado
State es un patrón de diseño de comportamiento que permite
a un objeto alterar su comportamiento cuando su estado inte-
rno cambia. Parece como si el objeto cambiara su clase.
Patrones de diseño - Alexander Shvets

*/
import 'dart:io';

void main() {
  Tamagotchi a = Tamagotchi();

  //a.jugar();
  //a.jugar();
  //a.dormir();
  String tecla;
  do {
    print(
        'Realizar accion: a)Alimentar, d)dormir, j)Jugar, p)preguntar, s)Salir');

    tecla = stdin.readLineSync().toString();
    switch (tecla) {
      case 'a':
        a.alimentar();
        break;
      case 'd':
        a.dormir();
        break;
      case 'j':
        a.jugar();
        break;
      case 'p':
        a.comoEstas();
        break;
      case 's':
        print('Estas seguro salir? s/n');

        tecla = stdin.readLineSync().toString();
        if (tecla == 's') {
          break;
        } else {
          tecla = '';
        }
        break;
      default:
        print('Debe elegir una opcion, con minuscula');
        break;
    }
  } while (tecla != 's');
}

class Tamagotchi {
  late IState estado;

  Tamagotchi() {
    setState(Aburrido());
  }

  void setState(IState estado) {
    this.estado = estado;
    this.estado.setTamagotchi(this);
  }

  void alimentar() {
    this.estado.alimentar();
  }

  void dormir() {
    this.estado.dormir();
  }

  void jugar() {
    this.estado.jugar();
  }

  void comoEstas() {
    this.estado.comoEstas();
  }
}

abstract class IState {
  void jugar();
  void alimentar();
  void dormir();
  void comoEstas();
  void setTamagotchi(Tamagotchi tamal);
}

class Aburrido implements IState {
  late Tamagotchi _tamal;

  @override
  void alimentar() {
    print('No quiero comerr!!!, quiero jugar:v');
  }

  @override
  void comoEstas() {
    print('Quiero jugar');
  }

  @override
  void dormir() {
    print('no quiero dormir, jugar quiero');
  }

  @override
  void jugar() {
    print('jugarr  ohoooohh (el tamagoshi esta jugando con su imaginacion)');
    _tamal.setState(Cansado());
  }

  @override
  void setTamagotchi(Tamagotchi tamal) {
    this._tamal = tamal;
  }
}

class Cansado implements IState {
  late Tamagotchi _tamal;
  @override
  void alimentar() {
    print('Nooo quiero comer, zzz, quiero dormir');
  }

  @override
  void comoEstas() {
    print('auuuu tengo sueño, quiero dormir');
  }

  @override
  void dormir() {
    print('Uhmm Bueno..Buenas noches');
    _tamal.setState(Durmiendo());
  }

  @override
  void jugar() {
    print('Ya estoy muy cansado, quiero dormir');
  }

  @override
  void setTamagotchi(Tamagotchi tamal) {
    this._tamal = tamal;
  }
}

class Durmiendo implements IState {
  late Tamagotchi _tamal;
  int timedESPERTAR = 5;

  @override
  void alimentar() {
    print('Zzzzzz....(shhh esta durmiendo)).zzzz');
  }

  @override
  void comoEstas() {
    print('Zzzzzz....(shhh esta durmiendo)).zzzz');
  }

  @override
  void dormir() {
    print('Zzzzzz....(shhh esta durmiendo)).zzzz');
  }

  @override
  void jugar() {
    print('Zzzzzz....(shhh esta durmiendo)).zzzz');
  }

  @override
  void setTamagotchi(Tamagotchi tamal) {
    this._tamal = tamal;
    Espera();
  }

  void Espera() {
    _tamal.setState(Hambriento());
    print('HAAUUU ya estoy despierto, qué sueño tuve');
  }
}

class Hambriento implements IState {
  late Tamagotchi _tamal;
  @override
  void alimentar() {
    print('UHmm porfi, ya tenia mucha hambre, Ñom ñom ñom');
    _tamal.setState(Aburrido());
  }

  @override
  void comoEstas() {
    print('Qiero malvaviscos');
  }

  @override
  void dormir() {
    print('Ya dormir, tengo hambre');
  }

  @override
  void jugar() {
    print('noou jugar despues, tengo hambre');
  }

  @override
  void setTamagotchi(Tamagotchi tamal) {
    this._tamal = tamal;
  }
}
