import 'package:carros_locadora_psa/service/interface_veiculo.dart';

class Veiculo implements InterfaceVeiculo {
  late String placa;
  late bool documentacao;

  @override
  bool validarPlacaVeiculo({required Veiculo veiculo}) {
    if (veiculo.placa.isNotEmpty) {
      return true;
    }
    throw Exception('Placa inváida');
  }

  bool validarDocumentacaoVeiculo({required Veiculo veiculo}) {
    if (documentacao == false)
      throw Exception('Carro não pode ser locado, documentação pendente');
      return false;
  }
}
