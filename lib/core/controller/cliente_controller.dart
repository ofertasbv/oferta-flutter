import 'package:mobx/mobx.dart';
import 'package:testeweb/core/model/cliente.dart';
import 'package:testeweb/core/repository/cliente_repository.dart';

part 'cliente_controller.g.dart';

class ClienteController = ClienteControllerBase with _$ClienteController;

abstract class ClienteControllerBase with Store {
  ClienteRepository _clienteRepository;

  ClienteControllerBase() {
    _clienteRepository = ClienteRepository();
  }

  @observable
  List<Cliente> clientes;

  @observable
  int cliente;

  @observable
  Exception error;

  @action
  Future<List<Cliente>> getAll() async {
    try {
      clientes = await _clienteRepository.getAll();
      return clientes;
    } catch (e) {
      error = e;
    }
  }

  @action
  Future<int> create(Cliente p) async {
    try {
      cliente = await _clienteRepository.create(p.toJson());
      return cliente;
    } catch (e) {
      error = e;
    }
  }
}
