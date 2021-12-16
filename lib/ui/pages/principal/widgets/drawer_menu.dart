import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';
import 'package:licoreriarocasclienteapp/ui/pages/autenticacion/page_autenticacion.dart';
import 'package:licoreriarocasclienteapp/ui/provider/cliente/clienteProvider.dart';
import 'package:provider/provider.dart';
class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final clienteProvider=Provider.of<ClienteProvider>(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.indigo
              ),
              child: MaterialButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Text(clienteProvider.sesionIniciada?clienteProvider.cliente.nombres.substring(0,1):"",
                            style: TextStyle(
                              fontSize: 28
                            ),
                          ),
                          maxRadius: 40,
                          minRadius: 40,
                        ),
                        SizedBox(width:10),
                        Container(
                          height: 100,
                          width:180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Wrap(
                                children: [
                                  Text("${clienteProvider.cliente.nombres}",
                                    style: TextStyle(
                                      fontSize:13,
                                      color:Colors.white70
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Wrap(
                                children: [
                                  Text("${clienteProvider.cliente.email}",
                                    style: TextStyle(
                                      fontSize:13,
                                      color:Colors.white70
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white12
                                ),
                                borderRadius: BorderRadius.all(Radius.elliptical(20, 20))
                              )
                            ),
                            onPressed: (){
                              if(!clienteProvider.sesionIniciada){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context){
                                      return PageAutenticacion();
                                    }
                                  )
                                );
                              }else{
                                clienteProvider.sesionIniciada=false;
                                clienteProvider.setCliente(Cliente.vacio());
                              }
                            }, 
                            child: Text(clienteProvider.sesionIniciada?"Cerrar sesión":"Iniciar sesión")
                          ),
                        )
                      ],
                    )
                  ],
                ),
                onPressed: (){
                  
                },
              ),
            ),
            listTileFavoritos(),
            listTileHistorial(),
            listTileMetodosPago(),
            listTileCompartirPerfil()
          ],
        )
      ),
    );
  }
  Widget listTileFavoritos(){
    return ListTile(
      leading: Icon(Icons.favorite,size: 40,),
      title: Text("Favoritos",
        style: TextStyle(
          fontSize: 16
        ),
      ),
      onTap: (){

      },
    );
  }
  Widget listTileHistorial(){
    return ListTile(
      leading: Icon(Icons.article_sharp,size: 40,),
      title: Text("Historial",
        style: TextStyle(
          fontSize: 16
        ),
      ),
      onTap: (){

      },
    );
  }
  Widget listTileMetodosPago(){
    return ListTile(
      leading: Icon(Icons.card_membership,size: 40,),
      title: Text("Métodos de pago",
        style: TextStyle(
          fontSize: 16
        ),
      ),
      onTap: (){

      },
    );
  }
  Widget listTileCompartirPerfil(){
    return ListTile(
      leading: Icon(Icons.qr_code,size: 40,),
      title: Text("Compartir perfil",
        style: TextStyle(
          fontSize: 16
        ),
      ),
      onTap: (){

      },
    );
  }
}