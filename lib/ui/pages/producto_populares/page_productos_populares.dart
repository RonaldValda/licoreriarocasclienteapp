import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/item_producto.dart';
import 'package:licoreriarocasclienteapp/ui/provider/producto/productoProvider.dart';
import 'package:provider/provider.dart';
class PageProductosPopulares extends StatefulWidget {
  PageProductosPopulares({Key? key}) : super(key: key);

  @override
  _PageProductosPopularesState createState() => _PageProductosPopularesState();
}

class _PageProductosPopularesState extends State<PageProductosPopulares> {
  @override
  Widget build(BuildContext context) {
    final productoProvider=Provider.of<ProductoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos populares"),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.width*1.4),
            crossAxisSpacing: 5,
            mainAxisSpacing: 10
          ),
          itemCount: productoProvider.productosPopulares.length>10?10:productoProvider.productosPopulares.length,
          itemBuilder: (context, index) {
            var producto=productoProvider.productosPopulares[index];
            return ItemProducto2(producto:producto);
          },
        ),
      ),
    );
  }
}