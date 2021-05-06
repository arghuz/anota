import 'package:anota/views/sobre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
class SignPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nameControllerC = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tela de Cadastro'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
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
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameControllerC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirmar Usuario',
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
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(style: TextButton.styleFrom(primary: Colors.white,backgroundColor: Colors.blue) ,
                      child: Text('Salvar'),
                      onPressed: () {
                         if (nameController.text == nameControllerC.text ){
                              Navigator.pop(context);
                              print(nameController.text);
                              print(passwordController.text);
                            }
                          else{
                            _showMyDialog(context,'Insira uma Senha ou Usuario valido ','Tente Novamente');
                          }
                      },
                    )
                    ),
                    Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(style: TextButton.styleFrom(primary: Colors.white,backgroundColor: Colors.blue) ,
                      child: Text('Sobre'),
                      onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  AboutPage())
                          );
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )
                ),
              ],
            )));
  }
}