import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/domain/entities/producto.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/icono_favorito.dart';
class ItemProducto2 extends StatelessWidget {
  const ItemProducto2({Key? key,required this.producto}) : super(key: key);
  final Producto producto;
  @override
  Widget build(BuildContext context) {
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
            Text("${producto.contenido}")
          ],
        ),
      ),
    );
  }
}