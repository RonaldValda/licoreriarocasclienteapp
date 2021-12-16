import 'package:flutter/cupertino.dart';
import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';

class ClienteProvider extends ChangeNotifier{
  Cliente cliente=Cliente.vacio();
  bool sesionIniciada=false;
  void setCliente(Cliente cliente,{bool notificar=true}){
    this.cliente=cliente;
    if(notificar) notifyListeners();
  }
}