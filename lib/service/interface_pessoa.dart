import 'package:carros_locadora_psa/model/pessoa.dart';

abstract class InterfacePessoa {
  bool validarCadastro(bool status);

  double validarPrazoDeEntrega({required Pessoa pessoa});
}
