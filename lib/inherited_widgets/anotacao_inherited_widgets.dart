import 'package:flutter/material.dart';

class AnotacaoInheritedWidget extends InheritedWidget {

  final anotacoes = [
    {
      'ID': '1',
      'titulo': 'titulo teste 1',
      'texto': 'texto teste 1',
      'data': 'Sexta-Feira 22 às 16:40'
    },
    {
      'ID': '2',
      'titulo': 'titulo teste 2',
      'texto': 'texto teste 2',
      'data': 'Sábado 23 às 10:05'
    },
    {
      'ID': '3',
      'titulo': 'titulo teste 3',
      'texto': 'texto teste 3',
      'data': 'Sexta-Feira 22 às 16:40'
    },
    {
      'ID': '4',
      'titulo': 'titulo teste 4',
      'texto': 'texto teste 4',
      'data': 'Sexta-Feira 22 às 16:40'
    }
  ];

  AnotacaoInheritedWidget(Widget child) : super(child: child);


  static AnotacaoInheritedWidget of(BuildContext context){
    return ( context.dependOnInheritedWidgetOfExactType<AnotacaoInheritedWidget>());
  }

  @override
  bool updateShouldNotify(AnotacaoInheritedWidget oldWidget){ return oldWidget.anotacoes != anotacoes;}
}
//anotacao_inherited_widgets