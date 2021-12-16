import 'package:flutter/material.dart';
import 'package:licoreriarocasclienteapp/ui/pages/principal/page_principal.dart';
import 'package:licoreriarocasclienteapp/ui/provider/cliente/clienteProvider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ClienteProvider())
      ],
      child: MaterialApp(
          title: 'Rocas App',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          debugShowCheckedModeBanner: false,
          home: PagePrincipal()
        ),
    );
  }
}
