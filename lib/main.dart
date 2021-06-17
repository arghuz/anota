import 'package:anota/views/anotacoes_fire.dart';
import 'package:anota/views/cadastro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:anota/views/login.dart';



Future<void> main() async {

  //Inicializar o FIRESTORE
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/principal': (context) => TelaPrincipal(),
      '/cadastro': (context) => SignPage()
    },
  ));
  
}