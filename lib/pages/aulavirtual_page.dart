import '../components/gridvirtual.dart';
import '../model/item_model.dart';
import 'package:flutter/material.dart';

class AulaVirtualPage extends StatelessWidget {
  final List<Item> items = [
    Item(
        title: 'Infantil y Primaria',
        img: 'assets/img/virtual/IconosEducamosCLM_InfPrimaria_1.png',
        url: 'https://aulasprimaria2021.castillalamancha.es/login/index.php'),
    Item(
        title: 'ESO',
        img: 'assets/img/virtual/IconosEducamosCLM_ESO.png',
        url: 'https://aulaseso2021.castillalamancha.es/login/index.php'),
    Item(
        title: 'Bachillerato',
        img: 'assets/img/virtual/IconosEducamosCLM_Bachillerato.png',
        url: 'https://aulasbach2021.castillalamancha.es/login/index.php'),
    Item(
        title: 'Ciclos Formativos',
        img: 'assets/img/virtual/IconosEducamosCLM_FP.png',
        url: 'https://aulasciclos2021.castillalamancha.es/login/index.php'),
    Item(
        title: 'Adultos',
        img: 'assets/img/virtual/IconosEducamosCLM_Adultos.png',
        url: 'https://aulasepa2021.castillalamancha.es/login/index.php'),
    Item(
        title: 'Enseñanzas de régimen especial',
        img: 'assets/img/virtual/IconosEducamosCLM_ERE.png',
        url: 'https://aulasregesp2021.castillalamancha.es/login/index.php'),
    Item(
        title: 'Ciclos Formativos (mod. Elearning)',
        img: 'assets/img/virtual/IconosEducamosCLM_eLearning.png',
        url: 'https://aulasfp2021.castillalamancha.es/login/index.php')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccione su aula'),
      ),
      body: GridVirtual(myList: items),
    );
  }
}
