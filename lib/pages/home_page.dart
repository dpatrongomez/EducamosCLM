import 'package:EducamosCLM/components/gridplataformas.dart';
import 'package:EducamosCLM/model/item_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> itemsfamilias = [
    Item(
        title: 'SEGUIMIENTO EDUCATIVO',
        subtitle1: 'Anterior Papás Comunicación.',
        subtitle2: 'Notas, faltas de asistencia, etc.',
        subtitle3: 'Comunicación familias-docentes-alumnado.',
        img:
            'https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_Seguimiento.png',
        url: 'https://papas.jccm.es/'),
    Item(
        title: 'SECRETARÍA VIRTUAL',
        subtitle1: 'Solicitud de admisión.',
        subtitle2: 'Matriculación, etc.',
        subtitle3: 'Tramitación de solicitudes.',
        img:
            'https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_Secretaria.png',
        url: 'https://papas.jccm.es/'),
    Item(
        title: 'ENTORNO DE APRENDIZAJE',
        subtitle1: 'Gestión académica.',
        subtitle2: 'Contenidos digitales.',
        subtitle3: 'Clases Virtuales y herramientas colaborativas.',
        img:
            'https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_EntornoAprendizaje.png'),
  ];

  final List<Item> itemsdocentes = [
    Item(
        title: 'ENTORNO COLABORATIVO',
        subtitle1: 'Microsoft Teams',
        subtitle2: 'Reuniones virtuales',
        subtitle3: 'Trabajo colaborativo docente',
        img:
            'https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_EntornoColaborativo.png',
        url: 'https://teams.microsoft.com/?domain_hint=educastillalamancha.es'),
    Item(
        title: 'GESTIÓN DE CENTROS',
        subtitle1: 'Delphos',
        subtitle2: 'Organización de centro educativo',
        subtitle3: 'Administración educativa',
        img:
            'https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_Gestion.png',
        url: 'https://delphos.jccm.es/'),
    Item(
        title: 'EVALÚA',
        subtitle1: 'Evaluación por competencias y estándares de aprendizaje',
        subtitle2: '',
        subtitle3: '',
        img:
            'https://educamosclm.castillalamancha.es/sites/educamosclm2.castillalamancha.es/files/inline-images/IconosEducamosCLM_Evalua_0.png',
        url: 'https://papas.jccm.es/')
  ];

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
              myList: itemsfamilias,
              text: 'FAMILIAS, ALUMNADO, DOCENTES',
            ),
            GridPlataformas(
              myList: itemsdocentes,
              text: 'PERSONAL DE LOS CENTROS EDUCATIVOS',
            ),
          ],
        ),
      ),
    );
  }
}
