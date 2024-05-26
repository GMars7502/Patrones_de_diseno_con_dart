/*
Builder es un patrón de diseño creacional que nos permite co-
nstruir objetos complejos paso a paso. El patrón nos permite
producir distintos tipos y representaciones de un objeto emp-
leando el mismo código de construcción.
Patrones de diseño - Alexander Shvets

*/
void main() {
  employeer a = employeerBuilder()
      .setAge(10)
      .setName('T-T')
      .setGender('M')
      .setAddressWithPara('Callao', 'Lima', 'Peru')
      .build();

  print(a.toString());
}

//interfaz construtora
abstract class Ibuilder<t> {
  t build();
}

//clase constructora
class employeerBuilder implements Ibuilder {
  late int age;
  late String name;
  late String gender;
  late address _addreesv;
  late List<phone> phones = List.empty();
  late List<Contact> contact = List.empty();
  @override
  employeerBuilder();

  //metodos para crear el objeto empleado
  employeerBuilder setAge(int x) {
    this.age = x;
    return this;
  }

  employeerBuilder setName(String x) {
    this.name = x;
    return this;
  }

  employeerBuilder setGender(String x) {
    this.gender = x;
    return this;
  }

  employeerBuilder setAddress(address x) {
    this._addreesv = x;
    return this;
  }

  employeerBuilder setAddressWithPara(
      String addres, String city, String country) {
    this._addreesv = address(addres, city, country);
    return this;
  }

  employeerBuilder setPhones(phone x) {
    this.phones.add(x);
    return this;
  }

  employeerBuilder setPhonesWithPara(String NUMBER, String TYPE) {
    this.phones.add(phone(NUMBER, TYPE));
    return this;
  }

  employeerBuilder setContact(Contact x) {
    this.contact.add(x);
    return this;
  }

  employeerBuilder setContactWithPara(
      String name, phone PHONE, address Direccion) {
    this.contact.add(Contact(name, PHONE, Direccion));
    return this;
  }

  @override
  employeer build() {
    return employeer.set(age, name, gender, _addreesv, phones, contact);
  }
}

//clases bases para el objeto employeer
class employeer {
  late int age;
  late String name;
  late String gender;
  late address addrees;
  late List<phone> phones;
  late List<Contact> contact;

  employeer() {}

  employeer.set(this.age, this.name, this.gender, this.addrees, this.phones,
      this.contact);

  @override
  String toString() {
    return 'Employeer \n Name:$name, \n Age:$age \n Addreess: $addrees';
  }
}

class Contact {
  late String _name;
  final phone _phone;
  final address _address;

  Contact(this._name, this._phone, this._address);

  String getNameContac() {
    return _name;
  }

  phone getPhoneContact() {
    return _phone;
  }

  address getAdress() {
    return _address;
  }
}

class phone {
  String _number;
  String _phonetype;

  phone(this._number, this._phonetype);

  String getNumber() {
    return _number;
  }

  String getphonetype() {
    return _phonetype;
  }

  settNumber(String x) {
    this._number = x;
  }

  settPhonetype(String x) {
    this._phonetype = x;
  }

  @override
  String toString() {
    return 'Numero de telefono: $_number, tipo: $_phonetype';
  }
}

class address {
  String _address;
  String _city;
  String _country;

  address(this._address, this._city, this._country);

  String getAddress() {
    return _address;
  }

  String getCity() {
    return _city;
  }

  String getCountry() {
    return _country;
  }

  settAddress(String x) {
    this._address = x;
  }

  settCity(String x) {
    this._city = x;
  }

  settCountry(String x) {
    this._country = x;
  }

  @override
  String toString() {
    return 'Address: $_address, Ciudad: $_city, Pais: $_country.';
  }
}





/*
abstract class Ibuilder{

}





class House {
  final int walls;
  final int doors;
  final int windows;
  final String roof;
  final bool garden;

  House._(this.walls, this.doors, this.windows, this.roof, this.garden);

  @override
  String toString() {
    return 'House: walls: $walls, doors: $doors, windows: $windows, roof: $roof, garden: $garden';
  }
}

class HouseBuilder {
  int _walls = 0;
  int _doors = 0;
  int _windows = 0;
  String _roof = 'none';
  bool _garden = false;

  HouseBuilder setWalls(int walls) {
    _walls = walls;
    return this;
  }

  HouseBuilder setDoors(int doors) {
    _doors = doors;
    return this;
  }

  HouseBuilder setWindows(int windows) {
    _windows = windows;
    return this;
  }

  HouseBuilder setRoof(String roof) {
    _roof = roof;
    return this;
  }

  HouseBuilder setGarden(bool garden) {
    _garden = garden;
    return this;
  }

  House build() {
    return House._(_walls, _doors, _windows, _roof, _garden);
  }
}

void main() {
  var house = HouseBuilder()
    .setWalls(4)
    .setDoors(2)
    .setWindows(6)
    .setRoof('gabled')
    .setGarden(true)
    .build();

  print(house);
}




*/
