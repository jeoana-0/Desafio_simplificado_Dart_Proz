import 'package:uuid/uuid.dart';
class Empresa{
  String?  cnpj;
  String? razaoSocial;
  String? nomeFantasia;
  String? telefone;
  String? endereco;
  late String _id;
  // Ainda não sei como fazer
  Empresa({required  this.cnpj , required this.razaoSocial , required this.nomeFantasia , required this.telefone , required this.endereco}){
    _id = Uuid().v1();
  }

  String get id => _id;
}
class Socio {
  String? nomeCompleto;
  String? enderecoSocio;
  String? cpfSocio;
  Socio({required this.nomeCompleto , required this.enderecoSocio, required this.cpfSocio});
}