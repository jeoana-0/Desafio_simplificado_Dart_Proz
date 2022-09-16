import 'dart:async';
import 'dart:convert';
import 'dart:io';
// cpf
// String cpf_exibido = cpf_chama();
String cpf_chama(){
  print("Digite seu cpf");
  int cpf = int.parse(stdin.readLineSync()!);
  // String cpf_exibido = cpf.substring(0,3)+"."+cpf.substring(3,6)+"."+cpf.substring(6,9)+"-"+cpf.substring(9,11);
  if (cpfvalidador(cpf)) {
    String tratamentocpf = cpf.toString();
    print('CPF foi validado');
    String cpf_exibido = tratamentocpf.substring(0,3)+"."+tratamentocpf.substring(3,6)+"."+tratamentocpf.substring(6,9)+"-"+tratamentocpf.substring(9,11);
    return cpf_exibido;
  }else{
    print("CPF inválido.\nTente novamente");
    return cpf_chama();
  }
}
bool cpfvalidador( int cpf){
  String cpf2 = cpf.toString();
  if(cpf2.length==11){
    return true;
  }else{
  }return false;
  }
  // duas funções para o cpf porque um pedaço posso reutilizar para melhorar o código
// fim cpf
// cnpj
// String cnpj_exibido = chama_cnpj();
String chama_cnpj(){
  print('Digite o CNPJ, Apenas números');
  int cnpj = int.parse(stdin.readLineSync()!);
  if(cnpjvalidador(cnpj)){
    print('CNPJ foi validado');
    String tratamentocnpj = cnpj.toString();
    String cnpj_exibido = tratamentocnpj.substring(0,2)+"."+tratamentocnpj.substring(2,5)+"."+tratamentocnpj.substring(5,8)+"/"+tratamentocnpj.substring(8,12)+"-"+tratamentocnpj.substring(12,14);
    return cnpj_exibido;
  }else{
    print('CNPJ inválido\nTente novamente');
    return chama_cnpj();
  }
}
bool cnpjvalidador(int cnpj){
    String cnpj2 = cnpj.toString();
    if(cnpj2.length==14){
    return true;
  }else{
    return false;
  }
}
// fim cnpj
// telefone
String chama_tel(){
  print("Digite numero do celular, apenas numeros");
  int tel = int.parse(stdin.readLineSync()!);
  String tratamentoTel = tel.toString();
  //caso usuário tenha digitado com espaço
  tratamentoTel = tratamentoTel.replaceAll(" ","");
  if(tratamentoTel.length==11){
  String tel_exibido = "("+tratamentoTel.substring(0,2)+")"+" "+tratamentoTel.substring(2,3)+" "+tratamentoTel.substring(3,7)+"-"+tratamentoTel.substring(7);
  print("Numero validado");
  return tel_exibido;
  }else{
    print('Numero inválido, tente novamente');
    return chama_tel();
  }
}
//fim tel
// cep
String chama_cep(){
  int cep = int.parse(stdin.readLineSync()!);
  String cepString ="0"+cep.toString();
  // tipo int não reconhece o zero a esquerda.
  String tratamentocep = cep.toString();
  if(tratamentocep.length==8){
    String cep_exibido = tratamentocep.substring(0,2)+"."+tratamentocep.substring(3,4)+"-"+tratamentocep.substring(5,8);
    print(cep_exibido);
    return cep_exibido;
  }else if(cepString.length==8){
    String cep_exibido = cepString.substring(0,2)+"."+cepString.substring(3,4)+"-"+cepString.substring(5,8);
    return cep_exibido;
    //tratamento caso tenho zero a esquerda no cep
  }else{
    return chama_cep();
  }
}
//fim cep(com defeito)
String endereco(){
  String numero_exibido = "";
  print("Digite logadouro");
  String logadouro = stdin.readLineSync(encoding: utf8)!;
  print("digite numero da sua casa");
  String numero_casa = tratamento_numeroCasa();
  print("Digite complemento se houver, caso não somente aperte Enter");
  String complemento = stdin.readLineSync(encoding: utf8)!;
  print("Digite seu bairro");
  String bairro = stdin.readLineSync(encoding: utf8)!;
  print("Digite a cidade");
  String cidade = stdin.readLineSync(encoding: utf8)!;
  print("Digite Estado");
  String estado = stdin.readLineSync(encoding: utf8)!;
  //cep sem funcionar ainda
  // String cepFinal = chama_cep();
  //complemento pode receber ""
  if(logadouro!=""&&numero_casa!=""&&bairro!=""&&estado!=""&&cidade!=""){
  String endereco_exibido = logadouro+","+numero_casa+","+complemento+","+bairro+","+cidade+"/"+estado;
  return endereco_exibido;
  }else{
    print("algum dado inválido, tente novamente");
    return endereco();
  }
}
String tratamento_numeroCasa(){
  //função para tratar o numero da casa
  int numero = int.parse(stdin.readLineSync()!);
  String numero_exibido = "";
  if(numero.isFinite&& numero>0){
    numero_exibido = numero.toString();
    return numero_exibido;
  }else{
    print('Numero inválido, tente novamente');
    return tratamento_numeroCasa();
  }
}

