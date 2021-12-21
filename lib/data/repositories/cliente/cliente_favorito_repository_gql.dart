String getMutationRegistrarClienteFavorito(){
  String query="";
  query=r"""
  mutation registrarClienteFavorito(
    $producto:ID,$cliente:ID,$favorito:Boolean
  ){
    registrarClienteFavorito(
      input:{
        producto:$producto
        cliente:$cliente
        favorito:$favorito
      }
    ){
      id
    }
  }
  """;
  return query;
}