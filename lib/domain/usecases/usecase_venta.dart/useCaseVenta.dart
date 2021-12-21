import 'package:licoreriarocasclienteapp/data/venta/venta_repository.dart';

class UseCaseVenta{
  VentaRepository ventaRepository=VentaRepository();
  Future<Map<String,dynamic>> obtenerProductosVentaCliente(String idCliente){
    return ventaRepository.obtenerProductosVentaCliente(idCliente);
  }
}