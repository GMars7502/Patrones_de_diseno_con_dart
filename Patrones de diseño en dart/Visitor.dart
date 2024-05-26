/*
VISITOR
También llamado: Visitante
Visitor es un patrón de diseño de comportamiento que te per-
mite separar algoritmos de los objetos sobre los que operan.


Patrones de diseño - Alexander Shvets
*/

void main() {
  Orco a = Orco('Thrall');
  Warrior B = Warrior('arthas');
  Wizard C = Wizard('peterParket');
  a.visit0(B);
  a.visit1(C);
  a.visit1(C);
  a.visit0(B);
}

abstract class IVisitor {
  void visit0(Warrior warrios);
  void visit1(Wizard wizard);
  void visit2(Assassin assassin);
}

abstract class visitable {
  void accept(IVisitor visitor);
}

class Assassin implements visitable {
  String _name;
  int damage = 4;
  int live = 9;

  Assassin(String name) : this._name = name;

  String getName() {
    return this._name;
  }

  void setName(String name) {
    this._name = name;
  }

  int getDamage() {
    return this.damage;
  }

  void setLive(int damage) {
    live = live - damage;
  }

  void attack() {
    print('ATAQUE DE KUNAI');
  }

  @override
  void accept(IVisitor visitor) {
    visitor.visit2(this);
  }
}

class Wizard implements visitable {
  String _name;
  int damage = 5;
  int live = 8;

  Wizard(String name) : this._name = name;

  String getName() {
    return this._name;
  }

  void setName(String name) {
    this._name = name;
  }

  int getDamage() {
    return this.damage;
  }

  void setLive(int damage) {
    live = live - damage;
  }

  void attack() {
    print('ATAQUE MAGICO');
  }

  @override
  void accept(IVisitor visitor) {
    visitor.visit1(this);
  }
}

class Warrior implements visitable {
  String _name;
  int damage = 3;
  int live = 10;

  Warrior(String name) : this._name = name;

  String getName() {
    return this._name;
  }

  void setName(String name) {
    this._name = name;
  }

  int getDamage() {
    return this.damage;
  }

  void setLive(int damage) {
    live = live - damage;
  }

  void attack() {
    print('ATAQUE DE ESPADA');
  }

  @override
  void accept(IVisitor visitor) {
    visitor.visit0(this);
  }
}

class Orco implements IVisitor {
  String _nameRaza;
  int _live = 10;

  Orco(String nameRaza) : this._nameRaza = nameRaza;

  @override
  void visit0(Warrior warrios) {
    if (_live <= 0) {
      Estado();
    } else {
      print('el orco $_nameRaza acecha, ' + warrios._name + ' realizar su: ');
      warrios.attack();
      _live = _live - warrios.getDamage();
      Estado();
    }
  }

  @override
  void visit1(Wizard wizard) {
    if (_live <= 0) {
      Estado();
    } else {
      print('el orco $_nameRaza acecha, ' + wizard._name + ' realizar su: ');
      wizard.attack();
      _live = _live - wizard.getDamage();
      Estado();
    }
  }

  @override
  void visit2(Assassin assassin) {
    if (_live <= 0) {
      Estado();
    } else {
      print('el orco $_nameRaza acecha, ' + assassin._name + ' realizar su: ');
      assassin.attack();
      _live = _live - assassin.getDamage();
      Estado();
    }
  }

  void Estado() {
    if (_live <= 0) {
      print('el orco $_nameRaza esta muerto');
    } else {
      print('el orco $_nameRaza sigue vivo con $_live de vida');
    }
  }
}
