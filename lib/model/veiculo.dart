import 'package:carros_locadora_psa/service/interface_veiculo.dart';

class Veiculo implements InterfaceVeiculo {
  late String placa;
  late bool documentacao;
  late bool revisao;
  late bool disponivel;

  @override
  bool validarPlacaVeiculo({required Veiculo veiculo}) {
    if (veiculo.placa.isNotEmpty) {
      return true;
    }
    throw Exception('Placa inváida');
  }

  @override
  bool validarDocumentacaoVeiculo({required Veiculo veiculo}) {
    if (veiculo.documentacao == false)
      throw Exception('Carro não pode ser locado, documentação pendente');
    return false;
  }

  @override
  bool validarCarroDisponivel({required Veiculo veiculo}) {
    if (veiculo.disponivel == false)
      throw Exception('Carro já foi locado, não está disponivel');
    return true;
  }
}
