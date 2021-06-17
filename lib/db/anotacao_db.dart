import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class Notas{

  //Atributos = campos do documento
   String data;
   String texto;
   String titulo;

  //Construtor
  Notas(this.data,this.texto,this.titulo);

  //Converter um DOCUMENTO em um OBJETO  
  Notas.fromJson( Map<String,dynamic> mapa, String data){
    this.data = data;
    this.texto = mapa['texto'];
    this.titulo = mapa['titulo'];
  }

  //Converter um OBJETO em um DOCUMENTO
  Map<String,dynamic> toJSon(){
    return{
      'id'   : this.data,
      'nome' : this.texto,
      'preco': this.titulo
    };
  }

}

class AnotacaoDB {

  static Database db;


  static Future open() async{
    
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'anotacoes');
    await deleteDatabase(path);
    db = await openDatabase(
        join(await getDatabasesPath(), 'notas.db'),
        version: 1,
        onCreate: (Database db, int version) async{
          db.execute('''
            CREATE TABLE Anotacoes(
              INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
              titulo text not null,
              texto text not null,
              data_criacao datetime null,
              data_edicao datetime null,
            );
          ''');
        }
    );
  }

  static Future<List<Map<String, dynamic>>> getAnotacoesList() async{
    if (db == null){
      await open();
    }
    return await db.query('Anotacoes');
  }

  static Future insereAnotacao(Map<String, dynamic> anotacao) async{
    await db.insert('Anotacoes', anotacao);
    return await db.query('Anotacoes');
  }

  static Future updateAnotacao(Map<String, dynamic> anotacao) async{
    await db.update(
        'Anotacoes',
        anotacao,
      where: 'id = ?',
      whereArgs: [anotacao['id']]
    );
  }

  static Future apagarAnotacao(int id) async{
    await db.delete(
        'Anotacoes',
        where: 'id = ?',
        whereArgs: [id]
    );
  }
}