
import 'package:mobx/mobx.dart';
import 'package:testeweb/core/model/permissao.dart';
import 'package:testeweb/core/repository/permissao_repository.dart';

part 'permissao_controller.g.dart';

class PermissaoController = PermissaoControllerBase with _$PermissaoController;
abstract class PermissaoControllerBase with Store{
  PermissaoRepository _permissaoRepository;

  PermissaoControllerBase() {
    _permissaoRepository = PermissaoRepository();
  }

  @observable
  List<Permissao> permissoes;

  @observable
  int permissao;

  @observable
  Exception error;

  @action
  Future<List<Permissao>> getAll() async {
    try {
      permissoes = await _permissaoRepository.getAll();
      return permissoes;
    } catch (e) {
      error = e;
    }
  }

  @action
  Future<int> create(Permissao p) async {
    try {
      permissao = await _permissaoRepository.create(p.toJson());
      return permissao;
    } catch (e) {
      error = e;
    }
  }
}