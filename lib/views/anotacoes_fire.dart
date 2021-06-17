import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'anotacao.dart';


class Nota{

  //Atributos = campos do documento
   Timestamp data;
   String texto;
   String titulo;

  //Construtor
  Nota(this.data,this.texto,this.titulo);

  //Converter um DOCUMENTO em um OBJETO  
  Nota.fromJson( Map<String,dynamic> mapa, String id){
    this.data =  mapa['data'];
    this.texto = mapa['texto'];
    this.titulo = mapa['titulo'];
  }

  //Converter um OBJETO em um DOCUMENTO
  Map<String,dynamic> toJSon(){
    return{
      'data' : this.data,
      'texto' : this.texto,
      'titulo': this.titulo
    };
  }

}


Future<void> main() async {

  //Inicializar o FIRESTORE
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/principal',
    routes: {
      '/principal': (context) => TelaPrincipal(),
    },
  ));  
}


//
// TELA PRINCIPAL
//
class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  
  //Referenciar a coleção nomeada "notas"
  CollectionReference notadb;

  @override
  void initState(){
    super.initState();
    notadb = FirebaseFirestore.instance.collection('notas');
  }
  
  //
  // Definir a aparência de como cada documento deve ser exibido
  //
  Widget exibirDocumento(item){

    //Converter um DOCUMENTO em um OBJETO
    Nota nota = Nota.fromJson(item.data(), item.id);

    return ListTile(
      
      title: Text(nota.titulo, style: TextStyle(fontSize: 26)),
      subtitle: Text('${nota.texto} \n${nota.data.toDate()}', style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),
      
      onTap: (){
        
          Navigator.push(
                        context,
                          MaterialPageRoute(builder: (context) => Anotacao(AnotacaoModo.Editar, item.data(),item.id))
                      );
        },
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (){
          
          notadb.doc(item.id).delete();
        },
      ),

    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anota'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.brown[50],

      //
      // Exibir os documentos
      //
      body: Container(
        padding: EdgeInsets.all(30),
        child: StreamBuilder<QuerySnapshot>(

          //fonte de dados
          stream: notadb.snapshots(),

          //aparência
          builder: (context, snapshot){

            switch(snapshot.connectionState){

              case ConnectionState.none:
                return Center(child: Text('Erro ao conectar ao Firestore'));

              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

              default:
                //dados recebidos do Firestore
                final dados = snapshot.requireData;

                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context,index){
                    return exibirDocumento(dados.docs[index]);
                  }
                );
            }
          }
        ),
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.add),
        onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Anotacao(AnotacaoModo.Nova, null,null))
            );
        }
      ),
    );
  }
}
