import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:dart_application_1/classes.dart';
import 'package:dart_application_1/functionsdetratamento.dart';
var empresa=<Empresa>[];
var listCnpj = <String>[];
var listCpf = <String>[];
var listTel = <String>[];
// var listCep = <String>[];
var listEndereco = <String>[];
var listName = <String>[];
var listsocio = <Socio>[];
var listSocioName = <String>[];
var listSocioEndereco = <String>[];
var lisData = [];
var listFantasia = <String> [];
var listId = <String>[];
cadaastrodeEmpresa(){

String escolha = "s";
  do{
    var data = DateTime.now();
    int c = empresa.length; // contador para auxilio, pode ser retirado;
    print("Digite a razão Social");
    String razao_social = stdin.readLineSync(encoding:utf8 )!;
    String nome_da_empresa = razao_social;
    print("Digite O nome fantasia");
    String nome_fantasia = stdin.readLineSync(encoding: utf8)!;
    listFantasia.add(nome_fantasia);
    listName.add(nome_da_empresa);
    String cnpj = chama_cnpj();
    listCnpj.add(cnpj);
    String telefone_cad = chama_tel();
    listTel.add(telefone_cad);
    // listCep[c] = chama_cep();
    String endereco_e = endereco();
    listEndereco.add(endereco_e);
    Empresa empresaCad = Empresa(cnpj:cnpj, razaoSocial: razao_social, nomeFantasia: nome_fantasia, telefone: telefone_cad, endereco: endereco_e);
    empresa.add(empresaCad);
    listId.add(empresaCad.id);
    print("Digite nome completo do Socio");
    String nameSocio = stdin.readLineSync(encoding: utf8)!;
    listSocioName.add(nameSocio);
    String enderecoSocio = endereco();
    listSocioEndereco.add(enderecoSocio);
    String cpf_do_Socio = cpf_chama();
    listCpf.add(cpf_do_Socio);
    Socio socioCad = Socio(nomeCompleto: nameSocio, enderecoSocio: enderecoSocio , cpfSocio:cpf_do_Socio );
    listsocio.add(socioCad);
    lisData.add(data);
    c = c+1;
    print("Cadastrar mais?\n S ou N");
    escolha = stdin.readLineSync()!;
  }while(escolha!="N");
}

listagem(){
  // String x ="";
      listName.sort();
    print(listName);
    
}
pesquisaCNPJ(){
  print("Digite CNPJ da empresa ou CPF do sócio, somente números:");
  String campo_pesquisa = stdin.readLineSync(encoding: utf8)!;
  campo_pesquisa.replaceAll(".","");
  campo_pesquisa.replaceAll("-","");
  campo_pesquisa.replaceAll("/","");
  bool encontrei = false;
  if(campo_pesquisa.length==14){
     campo_pesquisa = campo_pesquisa.substring(0,2)+"."+campo_pesquisa.substring(2,5)+"."+campo_pesquisa.substring(5,8)+"/"+campo_pesquisa.substring(8,12)+"-"+campo_pesquisa.substring(12,14);
      for (var i = 0; i < listCnpj.length; i++) {
        if(campo_pesquisa==listCnpj[i]){
          encontrei = true;
          print("ID:"+listId[i]+"\nCNPJ:"+listCnpj[i]+"Data de cadastro:"+lisData[i]+"\nRazão Social:"+listName[i]+"\nNome fantasia:"+listFantasia[i]+"\nTelefone:"+listTel[i]+"\nEndereço:"+listEndereco[i]+"Sócio:\nCPF:"+listCpf[i]+"\nNome Completo:"+listSocioName[i]+"\nEndereço:"+listSocioEndereco[i]);
        }else{print("Nenhum cadastro encontrado");
        }
  }
  }else{
    print("CNPJ Inválido");
  }

}
pesquisaCPF(){
  print("Digite CPF do sócio, somente números:");
  String campo_pesquisa = stdin.readLineSync(encoding: utf8)!;
  campo_pesquisa.replaceAll(".","");
  campo_pesquisa.replaceAll("-","");
  bool encontrei = false;
   if(campo_pesquisa.length==11){
    campo_pesquisa = campo_pesquisa.substring(0,3)+"."+campo_pesquisa.substring(3,6)+"."+campo_pesquisa.substring(6,9)+"-"+campo_pesquisa.substring(9,11);
      for (var i = 0; i < listCpf.length; i++) {
      if(campo_pesquisa==listCpf[i]){
        encontrei = true;
        print("ID:"+listId[i]+"\nCNPJ:"+listCnpj[i]+"Data de cadastro:"+lisData[i]+"\nRazão Social:"+listName[i]+"\nNome fantasia:"+listFantasia[i]+"\nTelefone:"+listTel[i]+"\nEndereço:"+listEndereco[i]+"Sócio:\nCPF:"+listCpf[i]+"\nNome Completo:"+listSocioName[i]+"\nEndereço:"+listSocioEndereco[i]);
        }else{
          encontrei = false;
          print("Nenhum cadastro encontrado");
        }
    }
  }else{
    print("cpf inválido");
  }

}
excluirEmpresa(){
  print('Digite o Id:');
  String pesquisa_id = stdin.readLineSync()!;
  for (var i = 0; i < listId.length; i++) {
    if(pesquisa_id==listId[i]){
      print("ID:"+listId[i]+"\nCNPJ:"+listCnpj[i]+"Data de cadastro:"+lisData[i]+"\nRazão Social:"+listName[i]+"\nNome fantasia:"+listFantasia[i]+"\nTelefone:"+listTel[i]+"\nEndereço:"+listEndereco[i]+"Sócio:\nCPF:"+listCpf[i]+"\nNome Completo:"+listSocioName[i]+"\nEndereço:"+listSocioEndereco[i]);
      print("Se realmente deseja excluir ddigite s");
      String confirmacao_de_exclucao = stdin.readLineSync()!;
      if(confirmacao_de_exclucao=="s"){
        listId.remove(listId[i]);
        lisData.remove(lisData[i]);
        listCnpj.remove(listCnpj[i]);
        listName.remove(listName[i]);
        listFantasia.remove(listFantasia[i]);
        listTel.remove(listTel[i]);
        listEndereco.remove(listEndereco[i]);
        listsocio.remove(listsocio[i]);
        listSocioName.remove(listSocioName[i]);
        listCpf.remove(listCpf[i]);
        listSocioEndereco.remove(listSocioEndereco[i]);
      }else{
        print("ok");
      }
    }else{
      print('Não encontrado');
      excluirEmpresa();
    }
  }
}