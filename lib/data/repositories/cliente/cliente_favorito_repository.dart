import 'package:licoreriarocasclienteapp/data/configuration/configuracion_servidor_repository.dart';
import 'package:licoreriarocasclienteapp/data/repositories/cliente/cliente_favorito_repository_gql.dart';
import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';
import 'package:licoreriarocasclienteapp/domain/repositories/abstract_cliente.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;

class ClienteFavoritoRepository extends AbstractClienteFavoritoRepository{
  @override
  Future<Map<String, dynamic>> registrarClienteFavorito(ClienteFavorito clienteFavorito) async{
    Map<String,dynamic> map={};
    String mensajeError="";
    bool completado=true;
    GraphQLConfiguration configuration=GraphQLConfiguration();
    graphql.GraphQLClient client=configuration.myGQLClient();
    await client
    .mutate(
      graphql.MutationOptions(
        document: graphql.gql(getMutationRegistrarClienteFavorito()),
        variables: (
          clienteFavorito.toMap()
        ),
        onCompleted: (data){
          if(data!=null){
            clienteFavorito.id=data["registrarClienteFavorito"]["id"];
          }
        },
        onError: (error){
          error!.graphqlErrors.forEach((element) { 
            mensajeError=element.message;
          });
          completado=false;
        }
      )
    );
    map["completado"]=completado;
    map["cliente_favorito"]=clienteFavorito;
    map["mensaje_error"]=mensajeError;
    return map;
  }

}