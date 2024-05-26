/*


COMMAND
También llamado: Comando, Orden, Action, Transaction
Command es un patrón de diseño de comportamiento que co-
nvierte una solicitud en un objeto independiente que contiene
toda la información sobre la solicitud. Esta transformación te
permite parametrizar los métodos con diferentes solicitudes,
retrasar o poner en cola la ejecución de una solicitud y sopor-
tar operaciones que no se pueden realizar.

Patrones de diseño - Alexander Shvets
*/
void main() {
  cuenta Cuenta = cuenta(1, 200);

  DepositarImpl deposito = DepositarImpl(Cuenta, 100);

  RetirarImpl retirar = RetirarImpl(Cuenta, 200);

  Invoker ivk = Invoker();
  ivk.recibirOperacion(deposito);
  ivk.recibirOperacion(retirar);
  ivk.realizarOperacion();

  Cuenta.ImprimirCuenta();
}

//clase normal de cuenta
class cuenta {
  late int _id;
  late double _saldo;

  cuenta(this._id, this._saldo);

  void retirar(double montoRetirar) {
    this._saldo = this._saldo - montoRetirar;
    print("Retiro realizado con exito");
  }

  void depositar(double montoDepositar) {
    this._saldo = this._saldo + montoDepositar;
    print("Deposito realizado con exito");
  }

  void ImprimirCuenta() {
    print("ID: $_id");
    print("Saldo: $_saldo");
  }
}

//Interfaz Operacion
abstract class IOperacion {
  void ejecutar();
}

//Conextion de Ioperacion
class DepositarImpl implements IOperacion {
  late cuenta _CUENTA;
  late double _montodepositar;

  DepositarImpl(this._CUENTA, this._montodepositar);

  @override
  void ejecutar() {
    this._CUENTA._saldo = this._CUENTA._saldo + this._montodepositar;
    print("Deposito realizado con exito");
  }
}

class RetirarImpl implements IOperacion {
  late cuenta _CUENTA;
  late double _montoretirar;

  RetirarImpl(this._CUENTA, this._montoretirar);

  @override
  void ejecutar() {
    this._CUENTA._saldo = this._CUENTA._saldo - this._montoretirar;
    print("Retiro realizado con exito");
  }
}

//EL invocado de las operaciones
class Invoker {
  late List<IOperacion> _operaciones = [];

  void recibirOperacion(IOperacion operacion) {
    this._operaciones.add(operacion);
  }

  void realizarOperacion() {
    this._operaciones.forEach((element) {
      element.ejecutar();
    });
    this._operaciones.clear();
  }
}
