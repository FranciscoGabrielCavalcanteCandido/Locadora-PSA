import 'package:carros_locadora_psa/model/pessoa.dart';
import 'package:carros_locadora_psa/model/veiculo.dart';

abstract class InterfaceLocacao {
  bool validarLocacaoDocumentoVeiculo({required Veiculo veiculo});

  bool validarLocacaoCadastroPessoa({required Pessoa pessoa});

  double validarPagamento({required Pessoa pessoa});

  bool validarRevisao({required Veiculo veiculo});
}
