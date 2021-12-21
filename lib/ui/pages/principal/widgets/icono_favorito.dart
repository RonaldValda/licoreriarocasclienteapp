import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/domain/entities/producto.dart';
import 'package:licoreriarocasclienteapp/domain/usecases/cliente/usecase_cliente_favorito.dart';
import 'package:licoreriarocasclienteapp/ui/provider/cliente/clienteProvider.dart';
import 'package:licoreriarocasclienteapp/ui/provider/producto/productoProvider.dart';
import 'package:provider/provider.dart';
class IconoFavorito extends StatefulWidget {
  const IconoFavorito({Key? key,required this.producto,required this.size}) : super(key: key);
  final Producto producto;
  final double size;
  @override
  _IconoFavoritoState createState() => _IconoFavoritoState();
}

class _IconoFavoritoState extends State<IconoFavorito> {
  UseCaseClienteFavorito useCaseClienteFavorito=UseCaseClienteFavorito();
  @override
  Widget build(BuildContext context) {
    final productoProvider=Provider.of<ProductoProvider>(context);
    final clienteProvider=Provider.of<ClienteProvider>(context);
    return Container(
      child: Row(
        children: [
          Container(
            width: widget.size,
            height: widget.size,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(right:5),
            child: MaterialButton(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45)
              ),
              onPressed: (){
                widget.producto.clientesFavorito[0].producto=widget.producto;
                widget.producto.clientesFavorito[0].cliente=clienteProvider.cliente;
                widget.producto.clientesFavorito[0].favorito=!widget.producto.clientesFavorito[0].favorito;
                if(widget.producto.clientesFavorito[0].favorito){
                  widget.producto.cantidadFavoritos++;
                }else{
                  widget.producto.cantidadFavoritos--;
                }
                productoProvider.notificar();
                useCaseClienteFavorito.registrarClienteFavorito(widget.producto.clientesFavorito[0])
                .then((resultado){
                  if(!resultado["completado"]){
                    widget.producto.clientesFavorito[0].favorito=!widget.producto.clientesFavorito[0].favorito;
                    if(widget.producto.clientesFavorito[0].favorito){
                      widget.producto.cantidadFavoritos++;
                    }else{
                      widget.producto.cantidadFavoritos--;
                    }
                    productoProvider.notificar();
                  }
                });
              },
              child: widget.producto.clientesFavorito[0].favorito?
              Icon(Icons.favorite,color: Colors.red,size: widget.size,):
              Icon(Icons.favorite_border,color: Colors.grey,size: widget.size,),
            ),
          ),
          Text("${widget.producto.cantidadFavoritos}",
            style: TextStyle(
              fontSize: widget.size/2
            ),
          )
        ],
      ),
    );
  }
}