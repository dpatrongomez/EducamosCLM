import '../components/gridplataformas.dart';
import '../model/item_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static List<Item> itemsfamilias = [
    Item(
        title: 'SEGUIMIENTO EDUCATIVO',
        subtitle1:
            'Seguimiento del alumnado y comunicación entre familias y docentes.',
        img: 'assets/img/home/SeguimientoEducativo.webp',
        url: 'https://educamosclm.castillalamancha.es/accesoeducamos/'),
    Item(
        title: 'SECRETARÍA VIRTUAL',
        subtitle1:
            'Presentación y seguimiento de los trámites de la gestión educativa para alumnado y familias.',
        img: 'assets/img/home/SecretariaVirtual.webp',
        url: 'https://educamosclm.castillalamancha.es/accesoeducamos/'),
    Item(
        title: 'LeemosCLM',
        subtitle1:
            'Impulso a la lectura mediante préstamos de contenidos digitales, planes y clubes de lectura.',
        img: 'assets/img/home/LeemosCLM.webp',
        url: "https://leemosclm.odilotk.es/")
  ];

  static List<Item> itemsdocentes = [
    Item(
        title: 'ENTORNO COLABORATIVO',
        subtitle1: 'Microsoft Teams',
        subtitle2: 'Reuniones virtuales',
        subtitle3: 'Trabajo colaborativo docente',
        img: 'assets/img/home/IconosEducamosCLM_EntornoColaborativo.png',
        url: 'https://teams.microsoft.com/?domain_hint=educastillalamancha.es'),
    Item(
        title: 'GESTIÓN DE CENTROS',
        subtitle1: 'Delphos',
        subtitle2: 'Organización de centro educativo',
        subtitle3: 'Administración educativa',
        img: 'assets/img/home/IconosEducamosCLM_Gestion.png',
        url: 'https://delphos.jccm.es/'),
    Item(
        title: 'EVALÚA',
        subtitle1: 'Evaluación por competencias y estándares de aprendizaje',
        subtitle2: '',
        subtitle3: '',
        img: 'assets/img/home/IconosEducamosCLM_Evalua_0.png',
        url: 'https://educamosclm.castillalamancha.es/accesoeducamos/')
  ];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('EducamosCLM'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.secondary,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
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
