
import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/domain/entities/cliente.dart';
import 'package:licoreriarocasclienteapp/domain/usecases/auntenticacion_externos/usecase_autenticacion_externos.dart';
import 'package:licoreriarocasclienteapp/domain/usecases/cliente/usecase_cliente.dart';
import 'package:licoreriarocasclienteapp/ui/pages/autenticacion/widgets/dialog_fecha_nacimiento.dart';
import 'package:licoreriarocasclienteapp/ui/provider/cliente/clienteProvider.dart';
import 'package:licoreriarocasclienteapp/ui/widgets/text_fields.dart';
import 'package:fluttericon/zocial_icons.dart' as zocial_i;
import 'package:provider/provider.dart';
class PageAutenticacion extends StatefulWidget {
  PageAutenticacion({Key? key}) : super(key: key);

  @override
  _PageAutenticacionState createState() => _PageAutenticacionState();
}

class _PageAutenticacionState extends State<PageAutenticacion> {
  TextEditingController? controllerEmail;
  TextEditingController? controllerPassword;
  UseCaseAutenticacionExternos useCaseAutenticacionExternos=UseCaseAutenticacionExternos();
  UseCaseCliente useCaseCliente=UseCaseCliente();
  @override
  void initState() {
    super.initState();
    controllerEmail=TextEditingController(text: "");
    controllerPassword=TextEditingController(text: "");
  }
  @override
  Widget build(BuildContext context) {
    final clienteProvider=Provider.of<ClienteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Iniciar sesión"),
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: 0,
          left: 10,
          right: 10,
          top: 10
        ),
        child: Column(
          children: [
            TextFFBasico(
              controller: controllerEmail!, 
              labelText: "Email", 
              onChanged: (x){

              }
            ),
            SizedBox(height: 5,),
            TextFFBasico(
              controller: controllerPassword!, 
              labelText: "Contraseña", 
              isPassword: true,
              onChanged: (x){

              }
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                elevation: 0,
                side: BorderSide(
                  color: Colors.indigoAccent,
                  width: 0.5
                )
              ),
              onPressed: (){}, 
              child: Container(
                width: MediaQuery.of(context).size.width/1.5,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Iniciar sesión",
                      style: TextStyle(
                        color: Colors.white70
                      ),
                    ),
                    Icon(Icons.login,color: Colors.white70,)
                  ],
                ),
              )
            ),
            SizedBox(height: 5,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white10,
                elevation: 0,
                side: BorderSide(
                  color: Colors.indigoAccent,
                  width: 0.5
                )
              ),
              onPressed: ()async{
                var userCredential;
                userCredential=await useCaseAutenticacionExternos.iniciarSesionGoogle();
                if(userCredential!=null){
                  Cliente cliente=Cliente.vacio();
                  cliente.nombres=userCredential.displayName.toString();
                  cliente.email=userCredential.email.toString();
                  cliente.medioRegistro="Google";
                  useCaseCliente.autenticarCliente(cliente)
                  .then((resultado)async{
                    if(resultado["completado"]){
                      if(cliente.fechaNacimiento==""){
                        String fechaNacimiento=await dialogFechaNacimiento(context);
                        clienteProvider.sesionIniciada=true;
                        clienteProvider.setCliente(cliente);
                        Navigator.pop(context);
                      }
                    }
                  });
                }
              }, 
              child: Container(
                width: MediaQuery.of(context).size.width/1.5,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Iniciar sesión con Google",
                      style: TextStyle(
                        color: Colors.indigo
                      ),
                    ),
                    Icon(zocial_i.Zocial.google,color: Colors.indigo,)
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}