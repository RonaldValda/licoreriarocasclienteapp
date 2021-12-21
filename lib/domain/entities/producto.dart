
import 'package:licoreriarocasclienteapp/domain/entities/categoria.dart';
import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';
import 'package:licoreriarocasclienteapp/domain/entities/sucursal.dart';

class Producto{
  String id;
  String codigo;
  String unidad;
  String contenido;
  double precio;
  int stockMinimo;
  double utilidad;
  int vencimientoMaximo;
  double gradoAlcoholico;
  List<dynamic> imagenesProducto;
  List<ProductoLote> productoLotes;
  int cantidadFavoritos;
  List<ClienteFavorito> clientesFavorito;
  String fechaRegistro;
  Etiqueta etiqueta;
  Producto({
    required this.id,required this.codigo,required this.unidad,
    required this.contenido,required this.precio,required this.stockMinimo,
    required this.utilidad,required this.vencimientoMaximo,
    required this.gradoAlcoholico,required this.imagenesProducto,
    required this.etiqueta,required this.productoLotes,
    required this.cantidadFavoritos,required this.clientesFavorito,
    required this.fechaRegistro
  });
  factory Producto.vacio(){
    return Producto(
      id: "", codigo:"", unidad: "", contenido: "", precio: 0.0, 
      stockMinimo: 0, utilidad: 0.0, vencimientoMaximo: 0, gradoAlcoholico: 0.0,
      imagenesProducto: [],etiqueta: Etiqueta.vacio(),productoLotes: [],
      cantidadFavoritos: 0,clientesFavorito: [],fechaRegistro: ""
    );
  }
  factory Producto.fromMap(Map<String,dynamic> data){
    List productoLotesD=data["producto_lotes"]??[];
    List<ProductoLote> psLote=[];
    productoLotesD.forEach((data) { 
      psLote.add(ProductoLote.fromMap(data));
    });
    List clientesFavoritosD=data["clientes_favorito"]??[];
    List<ClienteFavorito> cfs=[];
    clientesFavoritosD.forEach((data) { 
      cfs.add(ClienteFavorito.fromMap(data));
    });
    if(cfs.length==0){
      cfs.add(ClienteFavorito.vacio());
    }
    return Producto(
      id: data["id"]??"",codigo: data["codigo"]??"", 
      unidad: data["unidad"]??"", contenido: data["contenido"]??"",
      precio: data["precio"]!=null?double.parse(data["precio"].toString()):0.0, stockMinimo: data["stock_minimo"]??0, 
      utilidad: data["utilidad"]!=null?double.parse(data["utilidad"].toString()):0.0, 
      vencimientoMaximo: data["vencimiento_maximo"]??0, 
      gradoAlcoholico: data["grado_alcoholico"]!=null?double.parse(data["grado_alcoholico"].toString()):0.0,
      imagenesProducto: data["imagenes_producto"]??[],etiqueta: data["etiqueta"]!=null?Etiqueta.fromMap(data["etiqueta"]):Etiqueta.vacio(),
      productoLotes: psLote,cantidadFavoritos: data["cantidad_favoritos"]??0,clientesFavorito: cfs,fechaRegistro: data["fecha_registro"]??""
    );
  }
  factory Producto.copyWith(Producto p){
    List<ProductoLote> psLote=[];
    p.productoLotes.forEach((pl) { 
      psLote.add(ProductoLote.copyWith(pl));
    });
    List<ClienteFavorito> cfs=[];
    p.clientesFavorito.forEach((cf) { 
      cfs.add(ClienteFavorito.copyWith(cf));
    });
    return Producto(
      id: p.id,codigo: p.codigo, etiqueta: Etiqueta.copyWith(p.etiqueta), unidad: p.unidad, 
      contenido: p.contenido, precio: p.precio, stockMinimo: p.stockMinimo, 
      utilidad: p.utilidad, vencimientoMaximo: p.vencimientoMaximo, 
      gradoAlcoholico: p.gradoAlcoholico, imagenesProducto: p.imagenesProducto,
      productoLotes: psLote,cantidadFavoritos: p.cantidadFavoritos,clientesFavorito: cfs,
      fechaRegistro: p.fechaRegistro
    );
  }
  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "id":this.id,
      "codigo":this.codigo,
      "etiqueta":this.etiqueta,
      "unidad":this.unidad,
      "contenido":this.contenido,
      "precio":this.precio,
      "stock_minimo":this.stockMinimo,
      "utilidad":this.utilidad,
      "vencimiento_maximo":this.vencimientoMaximo,
      "grado_alcoholico":this.gradoAlcoholico,
      "imagenes_producto":this.imagenesProducto
    };
  }
}
class ProductoLote{
  String id;
  Sucursal sucursal;
  String lote;
  String fechaVencimiento;
  int cantidadInicial;
  int cantidadSaldo;
  Producto producto;
  ProductoLote({
    required this.id,required this.sucursal,required this.lote,
    required this.fechaVencimiento,required this.cantidadInicial,
    required this.cantidadSaldo,required this.producto
  });
  factory ProductoLote.vacio(){
    return ProductoLote(
      id: "", sucursal: Sucursal.vacio(),lote: "", fechaVencimiento: "", 
      cantidadInicial: 0, cantidadSaldo: 0,
      producto: Producto.vacio()
    );
  }
  factory ProductoLote.fromMap(Map<String,dynamic> data){
    return ProductoLote(
      id: data["id"]??"", sucursal: data["sucursal"]!=null?Sucursal.fromMap(data["sucursal"]):Sucursal.vacio(),
      lote: data["lote"]??"", fechaVencimiento: data["fecha_vencimiento"]??"", 
      cantidadInicial: data["cantidad_inicial"]??0,
      cantidadSaldo: data["cantidad_saldo"]??0,
      producto: data["producto"]!=null?Producto.fromMap(data["producto"]):Producto.vacio()
    );
  }
  factory ProductoLote.copyWith(ProductoLote pl){
    return ProductoLote(
      id: pl.id, sucursal: Sucursal.vacio(),lote: pl.lote, fechaVencimiento: pl.fechaVencimiento, cantidadInicial: pl.cantidadInicial, 
      cantidadSaldo: pl.cantidadSaldo, producto: pl.producto
    );
  }
  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "id":this.id,
      "lote":this.lote,
      "fecha_vencimiento":this.fechaVencimiento,
      "cantidad_inicial":this.cantidadInicial,
      "cantidad_saldo":this.cantidadSaldo
    };
  }
}