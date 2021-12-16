import 'package:flutter/material.dart';
class AppBarPrincipal extends StatefulWidget with PreferredSizeWidget{
  AppBarPrincipal({Key? key}) : super(key: key);

  @override
  _AppBarPrincipalState createState() => _AppBarPrincipalState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarPrincipalState extends State<AppBarPrincipal> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1, 
      child:AppBar(
        title:Text("Rocas")
      ) 
    );
  }
}