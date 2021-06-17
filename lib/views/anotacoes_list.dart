import 'package:flutter/material.dart';
import 'package:anota/views/anotacao.dart';
import 'package:anota/db/anotacao_db.dart';

class AnotacoesList extends StatefulWidget{
  @override
  AnotacoesListState createState(){ return new AnotacoesListState(); }
}

class AnotacoesListState extends State<AnotacoesList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anota!'),
      ),
      body: FutureBuilder(
          future: AnotacaoDB.getAnotacoesList(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.done)
            {
              final anotacoes = [
                {
                  'titulo': 'titulo teste 1',
                  'texto': 'texto teste 1',
                  'data': 'Sexta-Feira 22 às 16:40'
                },
               {
                  'titulo': 'titulo teste 2',
                  'texto': 'texto teste 2',
                  'data': 'Sábado 23 às 10:05'
                },
                {
                  'titulo': 'titulo teste 3',
                  'texto': 'texto teste 3',
                  'data': 'Sexta-Feira 22 às 16:40'
                },
                {
                  'titulo': 'titulo teste 4',
                 'texto': 'texto teste 4',
                  'data': 'Sexta-Feira 22 às 16:40'
                }
             ];
             
              return ListView.builder(
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                          MaterialPageRoute(builder: (context) => Anotacao(AnotacaoModo.Editar, anotacoes[index],null))
                      );
                    },
                    child: Card(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 13.0, right: 22.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _AnotacaoTitulo(anotacoes[index]['titulo']),
                          Container(height: 4,),
                          _AnotacaoTexto(anotacoes[index]['texto']),
                          _AnotacaoData(anotacoes[index]['data'])
                        ],
                      )),
                    )
                  );
                },
                itemCount: anotacoes.length,
              );
            }
            return Center(child: CircularProgressIndicator());
          }
      ),
      
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Anotacao(AnotacaoModo.Nova, null,null))
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
      ),
      
    );
  }
}

class _AnotacaoTitulo extends StatelessWidget {
  final String _titulo;
  _AnotacaoTitulo(this._titulo);

  @override
  Widget build(BuildContext context) {
    return Text(
      _titulo,
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),
    );
  }
}

class _AnotacaoTexto extends StatelessWidget {
  final String _texto;
  _AnotacaoTexto(this._texto);


  @override
  Widget build(BuildContext context) {
    return Text(
      _texto,
      style: TextStyle(
      color: Colors.grey.shade600
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      );
  }
}

class _AnotacaoData extends StatelessWidget {
  final String _data;

  _AnotacaoData(this._data);


  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: TextStyle(
        color: Colors.grey,
      ),
      textAlign: TextAlign.right,
    );
  }
}

