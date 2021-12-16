import 'package:licoreriarocasclienteapp/data/services/autenticacion_externos_repository.dart';

class UseCaseAutenticacionExternos{
  AuntenticacionExternosRepository auntenticacionExternosRepository=AuntenticacionExternosRepository();
  Future iniciarSesionGoogle(){
    return auntenticacionExternosRepository.iniciarSesionGoogle();
  }
}