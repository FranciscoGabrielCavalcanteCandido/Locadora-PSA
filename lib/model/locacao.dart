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
  late double valorComMulta;
  late double qtdDiasAtrasados;
  late double pagamento;



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
    if (pagamento >= 500) {
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

  @override
  double validarPrazoDeEntrega({required Pessoa pessoa}) {
    var porcentagem;
    porcentagem = 10 * (pagamento / 100);
    if (qtdDiasAtrasados > 0) {
      valorComMulta = qtdDiasAtrasados * porcentagem + pagamento;
      return valorComMulta;
    }
    throw Exception('Carro entregue no prazo');
  }

  @override
  bool validarVeiculoPlaca() {
    var veiculo = Veiculo();
    veiculo.placa = 'AXY-1223';
    veiculo.documentacao = true;
    veiculo.revisao = true;
    veiculo.disponivel = true;

    var veiculo2 = Veiculo();
    veiculo2.placa = 'AXY-5666';
    veiculo2.documentacao = true;
    veiculo2.revisao = true;
    veiculo2.disponivel = true;

    var listaVeiculos = <Veiculo>[veiculo, veiculo2];

    var temDuplicado = false;
    Set<String> listaPlacas = {}; 
    for(var veiculo in listaVeiculos ){
      if (listaPlacas.contains(veiculo.placa)){
        temDuplicado = true;
        break;
      }else {
        listaPlacas.add(veiculo.placa);
      }
    }

    if(temDuplicado){
      throw Exception('Já existe um carro com está placa');  
      }
      return true;
  }

  @override
  bool validarClienteViculoLocado(Pessoa pessoa) {
    if (pessoa.veiculoLocado == true) {
        throw Exception('O Cliente não pode locar o carro, já possuiu um carro locado');
    }
    return true;

  }
}
