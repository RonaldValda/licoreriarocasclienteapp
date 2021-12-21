import 'package:licoreriarocasclienteapp/data/repositories/cliente/cliente_favorito_repository.dart';
import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';

class UseCaseClienteFavorito{
  ClienteFavoritoRepository clienteFavoritoRepository=ClienteFavoritoRepository();
  Future<Map<String,dynamic>> registrarClienteFavorito(ClienteFavorito clienteFavorito){
    return clienteFavoritoRepository.registrarClienteFavorito(clienteFavorito);
  }
}