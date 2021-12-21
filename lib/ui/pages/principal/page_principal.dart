import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/domain/entities/categoria.dart';
import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';
import 'package:licoreriarocasclienteapp/domain/entities/producto.dart';
import 'package:licoreriarocasclienteapp/domain/entities/producto_oferta_dia.dart';
import 'package:licoreriarocasclienteapp/domain/usecases/usecase_venta.dart/useCaseVenta.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/app_bar.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/container_listado_productos_categorias.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/container_listado_productos_principal.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/drawer_menu.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/list_view_categorias.dart';
import 'package:licoreriarocasclienteapp/ui/provider/cliente/clienteProvider.dart';
import 'package:licoreriarocasclienteapp/ui/provider/producto/productoProvider.dart';
import 'package:provider/provider.dart';
class PagePrincipal extends StatefulWidget {
  PagePrincipal({Key? key}) : super(key: key);

  @override
  _PagePrincipalState createState() => _PagePrincipalState();
}

class _PagePrincipalState extends State<PagePrincipal> {
  UseCaseVenta useCaseVenta=UseCaseVenta();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final productoProvider=Provider.of<ProductoProvider>(context);
    final clienteProvider=Provider.of<ClienteProvider>(context);
    if(productoProvider.consultarBD){
      productoProvider.categorias=[];
      productoProvider.productosNovedades=[];
      productoProvider.productosCategoria=[];
      productoProvider.productosCompraBase=[];
      productoProvider.productosGeneral=[];
      productoProvider.productosNovedades=[];
      productoProvider.productosOfertaDia=[];
      productoProvider.productosPopulares=[];
      useCaseVenta.obtenerProductosVentaCliente(clienteProvider.cliente.id)
      .then((resultado){
        if(resultado["completado"]){
          Categoria categoria=Categoria.vacio();
          categoria.nombreCategoria="Principal";
          productoProvider.categorias.add(categoria);
          productoProvider.categorias.addAll(resultado["categorias"]);
          productoProvider.productosGeneral=resultado["productos"];
          List<ProductoOfertaDia> productosOfertaDia=resultado["productos_oferta_dia"];
          productosOfertaDia.forEach((pod) { 
            Producto p=pod.producto;
            pod.producto=(productoProvider.productosGeneral.where((element) => element.id==p.id)).elementAt(0);
          });
          productoProvider.productosOfertaDia=productosOfertaDia;
          DateTime dateTime=DateTime.now();
          productoProvider.productosNovedades.addAll(productoProvider.productosGeneral.where((element) => DateTime.parse(element.fechaRegistro).difference(dateTime).inDays<=10));
          productoProvider.productosPopulares.addAll(productoProvider.productosGeneral);
          productoProvider.productosPopulares.sort((b,a)=>a.cantidadFavoritos.compareTo(b.cantidadFavoritos));
          productoProvider.consultarBD=false;
          setState(() {
            
          });
        }else{
          print(resultado["mensaje_error"]);
        }
      });
    }

    return Scaffold(
      appBar: AppBarPrincipal(),
      drawer: DrawerMenu(),
      body: Column(
        children: [
          ListViewCategorias(),
          if(productoProvider.categoriaSel.id=="")
          Expanded(child: Hero(tag: "1",child: ContainerListadoProductos())),
          if(productoProvider.categoriaSel.id!="")
          Expanded(
            child: Hero(
              transitionOnUserGestures: true,
              tag: "1",child: ContainerListadoProductosCategoria()
            )
          )
        ],
      ),
    );
  }
}