import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/item_producto.dart';
import 'package:licoreriarocasclienteapp/ui/provider/producto/productoProvider.dart';
import 'package:provider/provider.dart';
class PageProductosNovedades extends StatefulWidget {
  PageProductosNovedades({Key? key}) : super(key: key);

  @override
  _PageProductosNovedadesState createState() => _PageProductosNovedadesState();
}

class _PageProductosNovedadesState extends State<PageProductosNovedades> {
  @override
  Widget build(BuildContext context) {
    final productoProvider=Provider.of<ProductoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Novedades de productos"),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.width*1.4),
            crossAxisSpacing: 5,
            mainAxisSpacing: 10
          ),
          itemCount: productoProvider.productosNovedades.length,
          itemBuilder: (context, index) {
            var producto=productoProvider.productosNovedades[index];
            return ItemProducto2(producto:producto);
          },
        ),
      ),
    );
  }
}