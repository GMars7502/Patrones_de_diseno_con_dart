import 'dart:collection';

/*
MEDIATOR
También llamado: Mediador, Intermediary, Controller
Mediator es un patrón de diseño de comportamiento que te
permite reducir las dependencias caóticas entre objetos. El
patrón restringe las comunicaciones directas entre los obje-
tos, forzándolos a colaborar únicamente a través de un obje-
to mediador.

Patrones de diseño - Alexander Shvets
*/

void main() {
  SalonDeChat s = SalonDeChat();

  Usuario a = Usuario(s);
  a.setNombre('Juan');
  s.registra(a);

  Usuario b = Usuario(s);
  b.setNombre('Pedro');
  s.registra(b);

  Usuario c = Usuario(s);
  c.setNombre('Maria');
  s.registra(c);

  a.envia('Pedro', 'hola men');
  b.envia('Juan', 'hola, como ands?');
  a.envia('Pedro', 'todo bien, medio roto el chat');
}

//Interfaz
abstract class IUsuarioChat {
  void recibe(String UsuarioMensajero, String msg);
  void envia(String UsuarioMensajero, String msg);
}

class Usuario implements IUsuarioChat {
  late String nombre;
  late SalonDeChat salon;

  Usuario(this.salon);

  @override
  void envia(String UsuarioMensajero, String msg) {
    salon.envia(nombre, UsuarioMensajero, msg);
  }

  @override
  void recibe(String UsuarioMensajero, String msg) {
    String s = ' El usuario ' + UsuarioMensajero + ' te dice: ' + msg;
    print(nombre + " :" + s);
  }

  void setNombre(String nombre) {
    this.nombre = nombre;
  }

  String getNombre() {
    return nombre;
  }
}

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
//mediador
abstract class ISalonDeChat {
  void registra(Usuario participante);
  void envia(String Receptor, String emisor, String msg);
}

//Mediador concreto
class SalonDeChat implements ISalonDeChat {
  late HashMap<String, Usuario> participantes = HashMap();

  @override
  void envia(String Receptor, String emisor, String msg) {
    if (participantes.containsKey(emisor) &&
        participantes.containsKey(Receptor)) {
      Usuario u = participantes.putIfAbsent(Receptor, () => new Usuario(this));
      u.recibe(emisor, msg);
    } else {
      print('Usuario Inexistente');
    }
  }

  @override
  void registra(Usuario user) {
    participantes[user.getNombre()] = user;
  }
}
