import 'package:anota/views/anotacoes_fire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';


Future<void> banco() async {

  //Inicializar o FIRESTORE
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var db = FirebaseFirestore.instance;
   db.collection('Notas-177f8').add(
    {
     'titulo': 'titulo teste 1',
     'texto': 'texto teste 1',
     'data': 'Sexta-Feira 777 às 16:40'
    }
  );
}

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
  bool isLoading = false;
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
                        setState(() {
                        isLoading = true;
                        });
                          login(nameController.text, passwordController.text);                       
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
   //
  // LOGIN com Firebase Auth
  //
  void login(email, senha) {
    
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: senha).then((resultado) {

        isLoading = false;
        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  TelaPrincipal())
                          );

    }).catchError((erro){
      var mensagem = '';
      if (erro.code == 'user-not-found'){
        _showMyDialog(context,'user-not-found','Tente Novamente');
      }else if (erro.code == 'wrong-password'){
        _showMyDialog(context,'Senha Incorreta ou Usuario','Tente Novamente');
      }else if ( erro.code == 'invalid-email'){
        _showMyDialog(context,'invalid-email','Tente Novamente');
      }else{
        mensagem = erro.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$mensagem'),
            duration: Duration(seconds:2)
          )
      );

    });
}
}

