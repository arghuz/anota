import 'package:flutter/material.dart';
import 'package:anota/inherited_widgets/anotacao_inherited_widgets.dart';
import 'package:anota/views/login.dart';



void main() => runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnotacaoInheritedWidget(
        MaterialApp(
          title: 'Anota!',
          home: LoginPage(),
            debugShowCheckedModeBanner: false,
            theme: new ThemeData( primarySwatch: Colors.purple, )
        )
    );
  }
}
