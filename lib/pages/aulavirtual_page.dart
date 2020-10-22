import 'package:EducamosCLM/griddashboard.dart';
import 'package:EducamosCLM/griddashboard2.dart';
import 'package:flutter/material.dart';

class AulaVirtualPage extends StatelessWidget {
  Items item1 = new Items(
      title: "Infantil y Primaria",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_InfPrimaria_1.png");
  Items item2 = new Items(
      title: "ESO",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_ESO.png");
  Items item3 = new Items(
      title: "Bachillerato",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_Bachillerato.png");
  Items item4 = new Items(
      title: "Ciclos Formativos",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_FP.png");
  Items item5 = new Items(
      title: "Adultos",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_Adultos.png");
  Items item6 = new Items(
      title: "Enseñanzas de régimen especial",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_ERE.png");
  Items item7 = new Items(
      title: "Ciclos Formativos (mod. Elearning)",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_eLearning.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccione su aula'),
      ),
      body: GridDashboard2(myList: [item1, item2, item3, item4, item5, item6]),
    );
  }
}
