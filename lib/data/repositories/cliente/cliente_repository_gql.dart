String getMutationAuntenticarCliente(){
  String query="";
  query=r"""
  mutation autenticarCliente(
    $ci_nit:String,$link_foto:String,
    $nombres:String,$fecha_nacimiento:String,
    $imei_telefono:String,$email:String,
    $password:String,$medio_registro:String,
    $telefono:String,$estado_cuenta:Boolean
  ){
    autenticarCliente(
      input:{
        ci_nit:$ci_nit
        link_foto:$link_foto
        nombres:$nombres
        fecha_nacimiento:$fecha_nacimiento
        imei_telefono:$imei_telefono
        email:$email
        password:$password
        medio_registro:$medio_registro
        telefono:$telefono
        estado_cuenta:$estado_cuenta
      }
    ){
      id
      ci_nit
      link_foto
      nombres
      email
      fecha_nacimiento
      imei_telefono
      fecha_registro
      fecha_ultimo_ingreso
      fecha_penultimo_ingreso
    }
  }
  """;
  return query;
}