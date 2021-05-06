import 'package:anota/views/anotacoes_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';

Future<void> _showMyDialog(BuildContext context, String texto1, String texto2, [String texto3]) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(texto1),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(texto2),
              
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(texto3 !=null ? texto3 : 'OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tela de Login'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Anota!',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ),
                    
                    ),
                     Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1),
                    child:Icon(
                    Icons.app_registration,
                    color: Colors.black,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                    ),
                      ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome do Usuario',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    _showMyDialog(context,'Peça aos Adminstradores para mudar sua senha','para continuar usando Anote!','Fechar');
                  },
                  textColor: Colors.blue,
                  child: Text('Esqueceu a Senha'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(style: TextButton.styleFrom(primary: Colors.white,backgroundColor: Colors.blue) ,
                      child: Text('Login'),
                      onPressed: () {
                        if (nameController.text == 'aaa' && passwordController.text == 'aaa'){
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  AnotacoesList())
                          );
                        }else{
                          _showMyDialog(context,'Senha Incorreta ou Usuario','Tente Novamente');
                        }
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )
                    ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Primeira vez? '),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Crie seu Usuario',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SignPage())
                            );
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}