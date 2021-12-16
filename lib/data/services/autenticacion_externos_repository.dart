import 'package:licoreriarocasclienteapp/domain/services/abstract_autenticacion_externos.dart';

import 'package:google_sign_in/google_sign_in.dart';
class AuntenticacionExternosRepository extends AbstractAutenticacionExternos{
  @override
  Future iniciarSesionGoogle() async{
    final GoogleSignInAccount? googleUsuario=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth=await googleUsuario!.authentication;
    print(googleAuth);
    print(googleUsuario.displayName);

    return googleUsuario;
  }

}