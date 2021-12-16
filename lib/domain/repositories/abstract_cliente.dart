import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';

abstract class AbstractClienteRepository{
  Future<Map<String,dynamic>> autenticarCliente(Cliente cliente);
}