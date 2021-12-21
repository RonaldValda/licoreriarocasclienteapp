String getQueryObtenerSubcategorias(){
  String query="";
  query=r"""
  query	 obtenerSubcategorias{
    obtenerSubcategorias{
      id
      nombre_subcategoria
    }
  }
  """;
  return query;
}