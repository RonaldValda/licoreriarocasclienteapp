import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/domain/entities/producto.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/icono_favorito.dart';
import 'package:licoreriarocasclienteapp/ui/provider/producto/productoProvider.dart';
import 'package:provider/provider.dart';
class ContainerListadoProductosCategoria extends StatefulWidget {
  ContainerListadoProductosCategoria({Key? key}) : super(key: key);

  @override
  _ContainerListadoProductosCategoriaState createState() => _ContainerListadoProductosCategoriaState();
}

class _ContainerListadoProductosCategoriaState extends State<ContainerListadoProductosCategoria> {
  @override
  Widget build(BuildContext context) {
    final productoProvider=Provider.of<ProductoProvider>(context);
    return Container(
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.width*1.4),
                crossAxisSpacing: 5,
                mainAxisSpacing: 10
              ),
              itemCount: productoProvider.productosCategoria.length,
              itemBuilder: (context, index) {
                var producto=productoProvider.productosCategoria[index];
                return itemProducto2(context, producto);
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget itemProducto2(BuildContext context,Producto producto){
    return Card(
      elevation: 5,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        height: MediaQuery.of(context).size.width/2,
        width: MediaQuery.of(context).size.width/2.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconoFavorito(producto:producto,size:30)
              ],
            ),
            CachedNetworkImage(
              width: MediaQuery.of(context).size.width/2.2,
              height: MediaQuery.of(context).size.width/2.5,
              imageUrl: producto.imagenesProducto[0]
            ),
          ],
        ),
      ),
    );
  }
}