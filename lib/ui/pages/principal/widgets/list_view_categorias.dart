import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/ui/provider/producto/productoProvider.dart';
import 'package:provider/provider.dart';
class ListViewCategorias extends StatefulWidget {
  ListViewCategorias({Key? key}) : super(key: key);

  @override
  _ListViewCategoriasState createState() => _ListViewCategoriasState();
}

class _ListViewCategoriasState extends State<ListViewCategorias> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final productoProvider=Provider.of<ProductoProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productoProvider.categorias.length,
        itemBuilder: (context, index) {
          var categoria=productoProvider.categorias[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                color: productoProvider.categoriaSel.id==categoria.id?Colors.blue[100]:Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: MaterialButton(
                onPressed: (){
                  productoProvider.setCategoriaSelected(categoria);
                },
                child: Text("${categoria.nombreCategoria}"),
              ),
            ),
          );
        },
      ),
    );
  }
}