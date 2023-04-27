import 'package:carros_locadora_psa/model/pessoa.dart';
import 'package:carros_locadora_psa/model/veiculo.dart';
import 'package:carros_locadora_psa/model/locacao.dart';

abstract class InterfaceLocacao {
  bool validarLocacaoDocumentoVeiculo({required Veiculo veiculo});

  bool validarLocacaoCadastroPessoa({required Pessoa pessoa});
}
