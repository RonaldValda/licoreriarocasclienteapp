import 'package:licoreriarocasclienteapp/data/repositories/cliente/cliente_repository.dart';
import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';

class UseCaseCliente{
  ClienteRepository clienteRepository=ClienteRepository();
  Future<Map<String,dynamic>> autenticarCliente(Cliente cliente){
    return clienteRepository.autenticarCliente(cliente);
  }
}