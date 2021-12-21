import 'package:licoreriarocasclienteapp/data/venta/venta_repository_gql.dart';
import 'package:licoreriarocasclienteapp/domain/entities/categoria.dart';
import 'package:licoreriarocasclienteapp/domain/entities/producto.dart';
import 'package:licoreriarocasclienteapp/domain/entities/producto_oferta_dia.dart';
import 'package:licoreriarocasclienteapp/domain/services/abstract_venta.dart';
import 'package:licoreriarocasclienteapp/data/configuration/configuracion_servidor_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
class VentaRepository extends AbstractVentaRepository{
  @override
  Future<Map<String, dynamic>> obtenerProductosVentaCliente(String idCliente) async{
    Map<String,dynamic> map={};
    List<ProductoOfertaDia> productosOfertaDia=[];
    List productosOfertaDiaD=[];
    List<Producto> productos=[];
    List productosD=[];
    List<Categoria> categorias=[];
    List categoriasD=[];
    bool completado=true;
    String mensajeError="";
    GraphQLConfiguration configuration=GraphQLConfiguration();
    graphql.GraphQLClient client=configuration.myGQLClient();
    graphql.QueryResult result=await client
    .query(
      graphql.QueryOptions(
        document:  graphql.gql(getQueryObtenerProductosVentaCliente()),
        variables: ({
          "id_cliente":idCliente
        }),
        fetchPolicy: graphql.FetchPolicy.cacheAndNetwork,
      ),
    );
    if(result.hasException){
      mensajeError=result.exception!.graphqlErrors[0].message;
      completado=false;
    }else if(!result.hasException){
      if(result.data!["obtenerProductosVentaCliente"]!=null){
        if(result.data!["obtenerProductosVentaCliente"]["productos_oferta_dia"]!=null){
          productosOfertaDiaD=result.data!["obtenerProductosVentaCliente"]["productos_oferta_dia"];
          productosOfertaDiaD.forEach((data) {
            productosOfertaDia.add(ProductoOfertaDia.fromMap(data));
          });
        }
        if(result.data!["obtenerProductosVentaCliente"]["productos"]!=null){
          productosD=result.data!["obtenerProductosVentaCliente"]["productos"];
          productosD.forEach((data) { 
            productos.add(Producto.fromMap(data));
          });
        }
        if(result.data!["obtenerProductosVentaCliente"]["categorias"]!=null){
          categoriasD=result.data!["obtenerProductosVentaCliente"]["categorias"];
          categoriasD.forEach((data) { 
            categorias.add(Categoria.fromMap(data));
          });
        }
      }
    }
    map["completado"]=completado;
    map["productos_oferta_dia"]=productosOfertaDia;
    map["productos"]=productos;
    map["categorias"]=categorias;
    map["mensaje_error"]=mensajeError;
    return map;
  }

}