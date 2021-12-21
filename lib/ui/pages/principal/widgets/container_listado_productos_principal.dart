
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/domain/entities/producto.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/icono_favorito.dart';
import 'package:licoreriarocasclienteapp/ui/pages/producto_populares/page_productos_populares.dart';
import 'package:licoreriarocasclienteapp/ui/pages/productos_novedades/page_productos_novedades.dart';
import 'package:licoreriarocasclienteapp/ui/provider/producto/productoProvider.dart';
import 'package:provider/provider.dart';
class ContainerListadoProductos extends StatefulWidget {
  ContainerListadoProductos({Key? key}) : super(key: key);

  @override
  _ContainerListadoProductosState createState() => _ContainerListadoProductosState();
}

class _ContainerListadoProductosState extends State<ContainerListadoProductos> {
  
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final productoProvider=Provider.of<ProductoProvider>(context);
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(5),
              children: [
                if(productoProvider.productosOfertaDia.length>0)
                Column(
                  children: [
                    Text("Oferta del día",
                      style: TextStyle(
                        fontSize: 22
                      ),
                    ),
                    itemProductoOfertaDia(context, productoProvider),
                  ],
                ),
                if(productoProvider.productosNovedades.length>0)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Novedades",
                          style: TextStyle(
                            fontSize: 22
                          ),
                        ),
                        if(productoProvider.productosNovedades.length>3)
                        TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context){
                                  return PageProductosNovedades();
                                }
                              )
                            );
                          }, 
                          child: Text("Ver más")
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width/2.2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productoProvider.productosNovedades.length>=3?3:productoProvider.productosNovedades.length,
                        itemBuilder: (context, index) {
                          var producto=productoProvider.productosNovedades[index];
                          return itemProducto3(context, producto);
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Populares",
                          style: TextStyle(
                            fontSize: 22
                          ),
                        ),
                        if(productoProvider.productosPopulares.length>2)
                        TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context){
                                  return PageProductosPopulares();
                                }
                              )
                            );
                          }, 
                          child: Text("Ver más")
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width/1.5,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productoProvider.productosPopulares.length>=2?2:productoProvider.productosPopulares.length,
                        itemBuilder: (context, index) {
                          var producto=productoProvider.productosPopulares[index];
                          return itemProducto2(context, producto);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget itemProductoOfertaDia(BuildContext context,ProductoProvider productoProvider){
    return Card(
      elevation: 2,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width/1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productoProvider.productosOfertaDia.length,
          itemBuilder: (context, index) {
            var productoOfertaDia=productoProvider.productosOfertaDia[index];
            var producto=productoOfertaDia.producto;
            return Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconoFavorito(producto:producto,size:40),
                      CachedNetworkImage(
                        width: MediaQuery.of(context).size.width/2.5,
                        height: MediaQuery.of(context).size.width/1.9,
                        imageUrl: producto.imagenesProducto[0]
                      ),
                      
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Producto: ${producto.contenido}"),
                      Text("Unidad: ${producto.unidad}"),
                      Text("Grado alcoholico ${producto.gradoAlcoholico} %"),
                      Row(
                        children: [
                          Text("${productoOfertaDia.precioUnitario} BoB",
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(width:10),
                          Text("${producto.precio} BoB",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              decorationColor: Colors.red,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 1,
                              decorationStyle: TextDecorationStyle.solid
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      )
    );
  }
  Widget itemProducto3(BuildContext context,Producto producto){
    return Card(
      elevation: 5,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        height: MediaQuery.of(context).size.width/3,
        width: MediaQuery.of(context).size.width/3.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconoFavorito(producto:producto,size:20),
            CachedNetworkImage(
              width: MediaQuery.of(context).size.width/3.2,
              height: MediaQuery.of(context).size.width/3.5,
              imageUrl: producto.imagenesProducto[0]
            ),
            Text("${producto.contenido}")
          ],
        ),
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
            Text("${producto.contenido}")
          ],
        ),
      ),
    );
  }
}