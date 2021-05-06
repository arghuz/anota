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
class AboutPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<AboutPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nameControllerC = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final anotacoes = [
                {
                  'titulo': 'Versão-0.5',
                  'texto': 'Notas da versão-Login, Crie seu usuario, Lista de Notas, Adicionar e Alterar Usuario',
                  'Data': '06-05-2021 - 11:24',
                  'descricao': 'O tema do aplicativo e um bloco de notas para salvar texto e audio, o objetivo do aplicativo é para usar todas as ferramentas apresentadas em aula',
                  'url': 'https://scontent.frao5-1.fna.fbcdn.net/v/t1.18169-9/1656074_601818129923354_2146651121927349567_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=cdbe9c&_nc_eui2=AeHel8w-EP8l19JC29v1FebzjsACN_Sc-9uOwAI39Jz721rdDvao0U-veKe3nKA30z56FLZb1Q28AYt6_Ik5zLPx&_nc_ohc=1j5z5ezKeqIAX-eJeng&_nc_ht=scontent.frao5-1.fna&oh=a4d27ee3317a45af4e54d10f55cc4b9e&oe=60B83C38'
                },
               {
                  'titulo': 'Versão-??',
                  'texto': '??????????????',
                  'Data': '06-05-2021 - 11:24',
                  'descricao': '???',
                  'url': 'https://scontent.frao5-1.fna.fbcdn.net/v/t31.18172-8/28516474_1832610996813875_4324181673457708678_o.jpg?_nc_cat=108&ccb=1-3&_nc_sid=730e14&_nc_eui2=AeG21zhCkHeTWPBZCnUZkcM4lxmeVMBKcTqXGZ5UwEpxOoTqYJ9awTVwEgte2wSjoNHs8Qpel9xUg0m0glUgOFlm&_nc_ohc=Mhwhgv3HHfAAX94JgbD&_nc_ht=scontent.frao5-1.fna&oh=64f8d3ab1b2527d8f03d01c86daa7429&oe=60B9AB00'
                },
                {
                  'titulo': 'Versão-??',
                  'texto': '??????????????',
                  'Data': '06-05-2021 - 11:24',
                  'descricao': '???',
                  'url': 'https://scontent.frao5-1.fna.fbcdn.net/v/t1.6435-9/118765940_2919561624810064_1101748631207260455_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=84a396&_nc_eui2=AeExDIIQ83JL03illRU0zYYQ8lpdexS7lSjyWl17FLuVKGcnA8iRj-fJ9PtUoI4a0DAd0IptOoohAzWWutvcosBT&_nc_ohc=U6enMgdlEdsAX-Xx4o7&_nc_ht=scontent.frao5-1.fna&oh=cc203d3f3addf12a22e3ca4156c8988c&oe=60B9C0D7'
                },
                {
                  'titulo': 'Versão-??',
                  'texto': '??????????????',
                  'Data': '06-05-2021 - 11:24',
                  'descricao': '???',
                  'url': 'https://scontent.frao5-1.fna.fbcdn.net/v/t31.18172-8/17434949_1271177076311289_2969970206051810535_o.jpg?_nc_cat=100&ccb=1-3&_nc_sid=730e14&_nc_eui2=AeESvjom5tYdtSR0RlOaZo17tmSD5Pe9YwK2ZIPk971jAtu60ieMSc7AbNlgGheSbM-hJZfLiFm1fYbiOPmYfvl5&_nc_ohc=8UG9nFZE-PgAX9n8_Ow&_nc_ht=scontent.frao5-1.fna&oh=5947ebeab246ed1ed9efde3ae9b1f045&oe=60B8A4CD'
                  
                }
             ];
   
    return Scaffold(
      
        appBar: AppBar(
          title: Text('Tela Sobre'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: 
              ListView.builder(
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                     _showMyDialog(context,(anotacoes[index]['texto']),'');
                    
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
                          _AnotacaoData(anotacoes[index]['Data']),
                          _AnotacaoDescricao(anotacoes[index]['descricao']),
                          _AnotacaoUrl(anotacoes[index]['url'])
                        ],
                      )),
                    )
                  );
                },
                itemCount: anotacoes.length,
              )
            
            )
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

class _AnotacaoDescricao extends StatelessWidget {
  final String _descricao;

  _AnotacaoDescricao(this._descricao);


  @override
  Widget build(BuildContext context) {
    return Text(
      _descricao,
      style: TextStyle(
        color: Colors.grey,
      ),
      textAlign: TextAlign.right,
    );
  }
}


class _AnotacaoUrl extends StatelessWidget {
  final String _url;
  _AnotacaoUrl(this._url);


  @override
  Widget build(BuildContext context) {
    return Image.network(
      _url,
      height: 360,
      width: 360,
    );
  }
}