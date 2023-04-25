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

import 'package:carros_locadora_psa/model/pessoa.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var pessoa = Pessoa();
  pessoa.nome = 'Eduardo';
  pessoa.cpf = '123.465.789-01';
  pessoa.status = true;

  test('O cliente está devidamente cadastrado', () {
    expect(pessoa.validarCadastro(pessoa.status), false);
  });
}
