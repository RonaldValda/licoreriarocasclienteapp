import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';

abstract class AbstractClienteRepository{
  Future<Map<String,dynamic>> autenticarCliente(Cliente cliente);
  Future<Map<String,dynamic>> registrarFechaNacimientoCliente(Cliente cliente);
}
abstract class AbstractClienteFavoritoRepository{
  Future<Map<String,dynamic>> registrarClienteFavorito(ClienteFavorito clienteFavorito);
}