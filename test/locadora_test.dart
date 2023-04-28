/*

1 - O carro só pode ser locado para um cliente devidamente cadastrado.
2- O mesmo carro não poderá ser locado no mesmo período 
3 - Um cliente só pode locar um carro por vez
4 - O carro só pode ser liberado para cliente após o pagamento confirmado
5 - O carro só será locado se tiver revisado.
6 - O carro deve conter placa - ok
7 - Só poderá haver um carro com a mesma placa 
8 - O carro só poderá ser locado se o carro estiver com a documentação em dia - ok
9 - Caso o carro seja devolvido após o prazo combinado haverá multa de 10% ao dia
10 - O carro só poderá ser locado por cliente que possuírem CNH 

*/

import 'package:carros_locadora_psa/model/locacao.dart';
import 'package:carros_locadora_psa/model/pessoa.dart';
import 'package:carros_locadora_psa/model/veiculo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var cliente = Pessoa();
  cliente.nome = 'Eduardo';
  cliente.cpf = '123.465.789-01';
  cliente.status = true;
  cliente.cnh = '123456';
  cliente.pagamento = 500.00;
  cliente.qtdDiasAtrasados = 3;

  var veiculo = Veiculo();
  veiculo.placa = 'AXY-1223';
  veiculo.documentacao = true;
  veiculo.revisao = true;
  veiculo.disponivel = true;

  var locacao = Locacao();
  locacao.clienteCadastrado = cliente.status;
  locacao.documentacaoEmDia = veiculo.documentacao;
  locacao.pagamentoEfetuado = cliente.pagamento;
  locacao.carroRevisado = veiculo.revisao;

  test('O cliente está devidamente cadastrado', () {
    expect(cliente.validarCadastro(cliente.status), false);
  });

  test('O veiculo contem placa', () {
    expect(veiculo.validarPlacaVeiculo(veiculo: veiculo), true);
  });

  test('Documentação está OK', () {
    expect(veiculo.validarDocumentacaoVeiculo(veiculo: veiculo), false);
  });

  test('Possui CNH', () {
    expect(cliente.validarCNH(pessoa: cliente), true);
  });

  test('O carro pode ser locado o cliente possui cadastro', () {
    expect(locacao.validarLocacaoCadastroPessoa(pessoa: cliente), true);
  });

  test('O carro pode ser locado o documento está em dia', () {
    expect(locacao.validarLocacaoDocumentoVeiculo(veiculo: veiculo), true);
  });

  test('Pagamento efetuado, o carro já pode ser locado', () {
    expect(
        locacao.validarPagamento(pessoa: cliente), locacao.pagamentoEfetuado);
  });

  test('O carro pode ser locado, pois está revisado', () {
    expect(locacao.validarRevisao(veiculo: veiculo), true);
  });

  test('O carro está disponivel', () {
    expect(veiculo.validarCarroDisponivel(veiculo: veiculo), true);
  });

  test('O carro foi entregue fora do prazo', () {
    expect(cliente.validarPrazoDeEntrega(pessoa: cliente), 650);
  });
}
