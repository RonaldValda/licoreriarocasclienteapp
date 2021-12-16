import 'package:licoreriarocasclienteapp/data/configuration/configuracion_servidor_repository.dart';
import 'package:licoreriarocasclienteapp/data/repositories/cliente/cliente_repository_gql.dart';
import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';
import 'package:licoreriarocasclienteapp/domain/repositories/abstract_cliente.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;

class ClienteRepository extends AbstractClienteRepository{
  @override
  Future<Map<String, dynamic>> autenticarCliente(Cliente cliente) async{
    Map<String,dynamic> map={};
    String mensajeError="";
    bool completado=true;
    GraphQLConfiguration configuration=GraphQLConfiguration();
    graphql.GraphQLClient client=configuration.myGQLClient();
    await client
    .mutate(
      graphql.MutationOptions(
        document: graphql.gql(getMutationAuntenticarCliente()),
        variables: (
          cliente.toMap()
        ),
        onCompleted: (data){
          if(data!=null){
            print(data);
            cliente=Cliente.fromMap(data["autenticarCliente"]);
          }
        },
        onError: (error){
          error!.graphqlErrors.forEach((element) { 
            print(element.message);
          });
          //mensajeError=error!.graphqlErrors[0].message;
          completado=false;
        }
      )
    );
    map["completado"]=completado;
    map["cliente"]=cliente;
    map["mensaje_error"]=mensajeError;
    return map;
  }

}