import 'package:flutter/cupertino.dart';
import 'package:licoreriarocasclienteapp/domain/entities/categoria.dart';
import 'package:licoreriarocasclienteapp/domain/entities/producto.dart';
import 'package:licoreriarocasclienteapp/domain/entities/producto_oferta_dia.dart';

class ProductoProvider extends ChangeNotifier{
  List<Producto> productosGeneral=[];
  List<Producto> productosCategoria=[];
  List<ProductoOfertaDia> productosOfertaDia=[];
  List<Producto> productosNovedades=[];
  List<Producto> productosPopulares=[];
  List<Producto> productosCompraBase=[];
  List<Categoria> categorias=[];
  Categoria categoriaSel=Categoria.vacio();
  bool consultarBD=true;
  void setProductosGeneral(List<Producto> productos,{bool notificar=true}){
    this.productosGeneral=productos;
    if(notificar) notifyListeners();
  }
  void setProductosSubcategoria(List<Producto> productos,{bool notificar=true}){
    this.productosCategoria=productos;
    if(notificar) notifyListeners();
  }
  void setProductosOfertaDia(List<ProductoOfertaDia> productos,{bool notificar=true}){
    this.productosOfertaDia=productos;
    if(notificar) notifyListeners();
  }
  void setProductosNovedades(List<Producto> productos,{bool notificar=true}){
    this.productosNovedades=productos;
    if(notificar) notifyListeners();
  }
  void setProductosPopulares(List<Producto> productos,{bool notificar=true}){
    this.productosPopulares=productos;
    if(notificar) notifyListeners();
  }
  void setProductosCompraBase(List<Producto> productos,{bool notificar=true}){
    this.productosCompraBase=productos;
    if(notificar) notifyListeners();
  }
  void setCategorias(List<Categoria> categorias,{bool notificar=true}){
    this.categorias=categorias;
    if(notificar) notifyListeners();
  }
  void setCategoriaSelected(Categoria categoria,{bool notificar=true}){
    if(categoriaSel.id!=categoria.id){
      this.categoriaSel=categoria;
      this.productosCategoria=[];
      this.productosCategoria.addAll(this.productosGeneral.where((element) => element.etiqueta.subcategoria.categoria.id==categoria.id));
      if(notificar) notifyListeners();
    }
  }
  void notificar(){
    notifyListeners();
  }
}