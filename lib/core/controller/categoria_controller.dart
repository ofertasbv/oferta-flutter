
import 'package:mobx/mobx.dart';
import 'package:testeweb/core/model/categoria.dart';
import 'package:testeweb/core/repository/categoria_repository.dart';

part 'categoria_controller.g.dart';

class CategoriaController = CategoriaControllerBase with _$CategoriaController;
abstract class CategoriaControllerBase with Store{
  CategoriaRepository _categoriaRepository;

  CategoriaControllerBase() {
    _categoriaRepository = CategoriaRepository();
  }

  @observable
  List<Categoria> categorias;

  @observable
  int categoria;

  @observable
  Exception error;

  @action
  Future<List<Categoria>> getAll() async {
    try {
      categorias = await _categoriaRepository.getAll();
      return categorias;
    } catch (e) {
      error = e;
    }
  }

  @action
  Future<int> create(Categoria p) async {
    try {
      categoria = await _categoriaRepository.create(p.toJson());
      return categoria;
    } catch (e) {
      error = e;
    }
  }
}