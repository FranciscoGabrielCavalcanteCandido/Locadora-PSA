import 'package:carros_locadora_psa/model/veiculo.dart';

abstract class InterfaceVeiculo {
  bool validarPlacaVeiculo({required Veiculo veiculo});

  bool validarCarroDisponivel({required Veiculo veiculo});
}
