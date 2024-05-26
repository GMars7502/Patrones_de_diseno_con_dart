/*
ITERATOR
También llamado: Iterador
Iterator es un patrón de diseño de comportamiento que te pe-
rmite recorrer elementos de una colección sin exponer su rep-
resentación subyacente (lista, pila, árbol, etc.).


Patrones de diseño - Alexander Shvets


*/

import 'dart:math';

void main() {
  RandomData vector = RandomData(5);

  IteratorData iterator = vector.iterator();

  while (iterator.hasNext()) {
    print(iterator.next());
  }
}

class RandomData {
  late List<int> data;

  RandomData(int length)
      : data = List<int>.generate(length, (_) => Random().nextInt(500));

  IteratorData iterator() {
    return IteratorData(this);
  }
}

class IteratorData {
  List<int> data;
  int pos = 0;

  IteratorData(RandomData randomData) : data = randomData.data;

  bool hasNext() {
    return pos < data.length;
  }

  int next() {
    int valor = data[pos];
    pos++;
    return valor;
  }
}
