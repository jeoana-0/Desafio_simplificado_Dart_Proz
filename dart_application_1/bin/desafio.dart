import 'dart:convert';
import 'dart:io';
import 'package:dart_application_1/classes.dart';
import 'package:dart_application_1/functionsPrincipais.dart';
import 'package:dart_application_1/functionsdeTratamento.dart';
import 'package:uuid/uuid.dart';
void main() {

int op = 0;
do{
  print("1.Cadastrar uma nova empresa\n2.Buscar Empresa cadastrada por CNPJ\n3.Buscar Empresa por CPF do Sócio\n4Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)\n5.Excluir uma empresa (por ID)\n6.Sair");
	int op = int.parse(stdin.readLineSync()!);
	switch(op){
		case 1: cadaastrodeEmpresa();
      break;
		case 2: pesquisaCNPJ();
      break;
		case 3: pesquisaCPF();
      break;
		case 4: listagem();
      break;
    case 5: excluirEmpresa();
    break;
    default: print("opção invalida");
	}
}while(op != 6);
// switch (expression) {
//   case value:
    
//     break;
//   default:
// }
// cadaastrodeEmpresa();
// listagem();




}
