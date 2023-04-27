import 'package:carros_locadora_psa/model/veiculo.dart';
import 'package:carros_locadora_psa/model/pessoa.dart';
import 'package:carros_locadora_psa/service/interface_locacao.dart';
import 'package:carros_locadora_psa/service/interface_pessoa.dart';
import 'package:carros_locadora_psa/model/locacao.dart';

class Locacao implements InterfaceLocacao {
  late bool clienteCadastrado;
  late bool documentacaoEmDia;

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
}
