import 'package:carros_locadora_psa/service/interface_pessoa.dart';

class Pessoa implements InterfacePessoa {
  late String nome;
  late String cpf;
  late bool status;

  @override
  bool validarCadastro(bool status) {
    if (status != true) throw Exception('O cliente não possui cadastro');
    return false;
  }
}
