import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/app_bar.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/widgets/drawer_menu.dart';
class PagePrincipal extends StatefulWidget {
  PagePrincipal({Key? key}) : super(key: key);

  @override
  _PagePrincipalState createState() => _PagePrincipalState();
}

class _PagePrincipalState extends State<PagePrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrincipal(),
      drawer: DrawerMenu(),
    );
  }
}