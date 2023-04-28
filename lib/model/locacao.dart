import 'package:carros_locadora_psa/model/veiculo.dart';
import 'package:carros_locadora_psa/model/pessoa.dart';
import 'package:carros_locadora_psa/service/interface_locacao.dart';
import 'package:carros_locadora_psa/service/interface_pessoa.dart';
import 'package:carros_locadora_psa/model/locacao.dart';

class Locacao implements InterfaceLocacao {
  late bool clienteCadastrado;
  late bool documentacaoEmDia;
  late double pagamentoEfetuado;
  late bool carroRevisado;

  @override
  bool validarLocacaoDocumentoVeiculo({required Veiculo veiculo}) {
    if (veiculo.validarDocumentacaoVeiculo(veiculo: veiculo) == false) {
      return documentacaoEmDia;
    }
    throw Exception('A decumentação não está em dia');
  }

  @override
  bool validarLocacaoCadastroPessoa({required Pessoa pessoa}) {
    if (pessoa.validarCadastro(pessoa.status) == false) {
      return clienteCadastrado;
    }
    throw Exception('Pessoa não está cadastrada');
  }

  @override
  double validarPagamento({required Pessoa pessoa}) {
    if (pessoa.pagamento >= 1) {
      return pagamentoEfetuado;
    }
    throw Exception('O carro não pode ser liberado, efetue o pagamento');
  }

  @override
  bool validarRevisao({required Veiculo veiculo}) {
    if (veiculo.revisao != false) {
      return true;
    }
    throw Exception('O carro náo pode ser locado, precisa ser feita a revisao');
  }
}
