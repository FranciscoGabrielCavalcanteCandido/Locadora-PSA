import 'package:carros_locadora_psa/service/interface_pessoa.dart';

class Pessoa implements InterfacePessoa {
  late String nome;
  late String cpf;
  late bool status;
  late String cnh;
  late double pagamento;
  late double qtdDiasAtrasados;
  late double valorComMulta;

  @override
  bool validarCadastro(bool status) {
    if (status != true) throw Exception('O cliente não possui cadastro');
    return false;
  }

  @override
  bool validarCNH({required Pessoa pessoa}) {
    if (pessoa.cnh.isNotEmpty) {
      return true;
    }
    throw Exception('Não possui CNH');
  }

  @override
  double validarPrazoDeEntrega({required Pessoa pessoa}) {
    var porcentagem;
    porcentagem = 10 * (pessoa.pagamento / 100);
    if (pessoa.qtdDiasAtrasados > 0) {
      valorComMulta = qtdDiasAtrasados * porcentagem + pessoa.pagamento;
      return valorComMulta;
    }
    throw Exception('Carro entregue no prazo');
  }
}
