/*
Singleton es un patrón de diseño creacional que nos permi-
te asegurarnos de que una clase tenga una única instancia,
a la vez que proporciona un punto de acceso global a di-
cha instancia.
Patrones de diseño - Alexander Shvets

*/

void main() {
  var a = Singleton.divertido();
  var b = Singleton.divertido();
  var c = Singleton.divertido();

  Singleton d = new Singleton.divertido();
  Singleton f = new Singleton.divertido();

  print(a);
  print(b);
  print(c);
  print(f);
  print(d);
  print(a == b &&
      a == c &&
      a == f &&
      a == d &&
      b == c &&
      b == f &&
      b == d &&
      c == f &&
      c == d &&
      f == d);

  print(a.hashCode.toString());
  print(b.hashCode.toString());
  print(c.hashCode.toString());
  print(f.hashCode.toString());
  print(d.hashCode.toString());
  print(a.hashCode == b.hashCode &&
      a.hashCode == c.hashCode &&
      a.hashCode == f.hashCode &&
      a.hashCode == d.hashCode &&
      b.hashCode == c.hashCode);
}

class Singleton {
  //
  static final instancia = Singleton._instancia();

  //constructo factory, lo que hacer es solo permitir una instancia
  factory Singleton.divertido() {
    return instancia;
  }

  Singleton._instancia();
}
