import 'package:EducamosCLM/components/gridplataformas.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Items item1 = new Items(
      title: "SEGUIMIENTO EDUCATIVO",
      subtitle1: "Anterior Papás Comunicación.",
      subtitle2: "Notas, faltas de asistencia, etc.",
      subtitle3: "Comunicación familias-docentes-alumnado.",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_Seguimiento.png");

  Items item2 = new Items(
      title: "SECRETARÍA VIRTUAL",
      subtitle1: "Solicitud de admisión.",
      subtitle2: "Matriculación, etc.",
      subtitle3: "Tramitación de solicitudes.",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_Secretaria.png");
  Items item3 = new Items(
      title: "ENTORNO DE APRENDIZAJE",
      subtitle1: "Gestión académica.",
      subtitle2: "Contenidos digitales.",
      subtitle3: "Clases Virtuales y herramientas colaborativas.",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_EntornoAprendizaje.png");

  Items item4 = new Items(
      title: "ENTORNO COLABORATIVO",
      subtitle1: "Microsoft Teams",
      subtitle2: "Reuniones virtuales",
      subtitle3: "Trabajo colaborativo docente",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_EntornoColaborativo.png");
  Items item5 = new Items(
      title: "GESTIÓN DE CENTROS",
      subtitle1: "Delphos",
      subtitle2: "Organización de centro educativo",
      subtitle3: "Administración educativa",
      img:
          "https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_Gestion.png");
  Items item6 = new Items(
      title: "EVALÚA",
      subtitle1: "Evaluación por competencias y estándares de aprendizaje",
      subtitle2: "",
      subtitle3: "",
      img:
          'https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_Evalua_0.png');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('EducamosCLM'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.people),
                text: 'Comunidad Educativa',
              ),
              Tab(
                icon: Icon(Icons.school),
                text: 'Docentes y Centros',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridPlataformas(
              myList: [item1, item2, item3],
              text: 'FAMILIAS, ALUMNADO, DOCENTES',
            ),
            GridPlataformas(
              myList: [item4, item5, item6],
              text: 'PERSONAL DE LOS CENTROS EDUCATIVOS',
            ),
          ],
        ),
      ),
    );
  }
}
