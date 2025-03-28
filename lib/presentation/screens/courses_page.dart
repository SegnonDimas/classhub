import 'package:classhub/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesPage extends StatefulWidget {
  CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> courses = [
    {'title': 'Mathématiques', 'status': 'En cours', 'color': Colors.teal[200]},
    {'title': 'Physique', 'status': 'Terminés', 'color': Colors.green},
    {
      'title': 'Informatique',
      'status': 'Terminés et Non évalués',
      'color': Colors.deepOrange,
    },
    {'title': 'Économie', 'status': 'Évalués', 'color': Colors.orange},
    {'title': 'Chimie', 'status': 'Non commencés', 'color': Colors.grey},
    {'title': 'Biologie', 'status': 'En cours', 'color': Colors.teal[200]},
    {'title': 'Géographie', 'status': 'Terminés', 'color': Colors.green},
    {
      'title': 'Philosophie',
      'status': 'Terminés et Non évalués',
      'color': Colors.deepOrange,
    },
    {'title': 'Anglais', 'status': 'Évalués', 'color': Colors.orange},
    {'title': 'Français', 'status': 'Non commencés', 'color': Colors.grey},
    {'title': 'Histoire', 'status': 'En cours', 'color': Colors.teal[200]},
    {'title': 'Sociologie', 'status': 'Terminés', 'color': Colors.green},
    {
      'title': 'Électronique',
      'status': 'Terminés et Non évalués',
      'color': Colors.deepOrange,
    },
    {'title': 'Mécanique', 'status': 'Évalués', 'color': Colors.orange},
    {'title': 'Langues', 'status': 'Non commencés', 'color': Colors.grey},
    {'title': 'Génie civil', 'status': 'En cours', 'color': Colors.teal[200]},
    {
      'title': 'Mathématiques appliquées',
      'status': 'Terminés',
      'color': Colors.green,
    },
    {
      'title': 'Informatique avancée',
      'status': 'Terminés et Non évalués',
      'color': Colors.deepOrange,
    },
    {
      'title': 'Économie internationale',
      'status': 'Évalués',
      'color': Colors.orange,
    },
    {'title': 'Psychologie', 'status': 'Non commencés', 'color': Colors.grey},
    {'title': 'Statistiques', 'status': 'En cours', 'color': Colors.teal[200]},
    {'title': 'Comptabilité', 'status': 'Terminés', 'color': Colors.green},
    {
      'title': 'Droit',
      'status': 'Terminés et Non évalués',
      'color': Colors.deepOrange,
    },
    {'title': 'Gestion', 'status': 'Évalués', 'color': Colors.orange},
    {'title': 'Marketing', 'status': 'Non commencés', 'color': Colors.grey},
    {'title': 'Finance', 'status': 'En cours', 'color': Colors.teal[200]},
    {'title': 'Ingénierie', 'status': 'Terminés', 'color': Colors.green},
    {
      'title': 'Architecture',
      'status': 'Terminés et Non évalués',
      'color': Colors.deepOrange,
    },
    {'title': 'Robotique', 'status': 'Évalués', 'color': Colors.orange},
    {'title': 'Biochimie', 'status': 'Non commencés', 'color': Colors.grey},
    {'title': 'Astronomie', 'status': 'En cours', 'color': Colors.teal[200]},
    {'title': 'Médecine', 'status': 'Terminés', 'color': Colors.green},
    {
      'title': 'Génétique',
      'status': 'Terminés et Non évalués',
      'color': Colors.deepOrange,
    },
    {'title': 'Nanotechnologie', 'status': 'Évalués', 'color': Colors.orange},
    {
      'title': 'Énergie renouvelable',
      'status': 'Non commencés',
      'color': Colors.grey,
    },
    {
      'title': 'Physique théorique',
      'status': 'En cours',
      'color': Colors.teal[300],
    },
    {'title': 'Logistique', 'status': 'Terminés', 'color': Colors.green},
    {
      'title': 'Supply Chain',
      'status': 'Terminés et Non évalués',
      'color': Colors.deepOrange,
    },
    {'title': 'Cyber-sécurité', 'status': 'Évalués', 'color': Colors.orange},
    {'title': 'Blockchain', 'status': 'Non commencés', 'color': Colors.grey},
    {
      'title': 'Intelligence artificielle',
      'status': 'En cours',
      'color': Colors.teal[200],
    },
    {'title': 'Data Science', 'status': 'Terminés', 'color': Colors.green},
  ];

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          /*title: AppText(
            text: 'Matières',
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),*/
          centerTitle: true,
          //backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          //elevation: 0,
          bottom: TabBar(
            padding: EdgeInsets.zero,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            //labelColor: Colors.white,
            //indicatorColor: Theme.of(context).colorScheme.surface,
            indicatorColor: Colors.deepPurple,
            dividerColor: Colors.deepPurple,
            dividerHeight: 0.05,
            indicatorWeight: 3,
            unselectedLabelColor: Colors.white12,
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            tabs: [
              // tous les cours
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                child: Badge(
                  backgroundColor: Colors.red,
                  label: AppText(
                    text: courses.length.toString(),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  child: Tab(text: 'Tous les cours'),
                ),
              ),

              // en cours
              Badge(
                backgroundColor: Colors.red,
                label: AppText(
                  text:
                      courses
                          .where((c) => c['status'] == 'En cours')
                          .toList()
                          .length
                          .toString(),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.white,
                ),
                child: Tab(text: 'En cours'),
              ),

              // terminés
              Badge(
                backgroundColor: Colors.red,
                label: AppText(
                  text:
                      "${courses.where((c) => c['status'] == 'Terminés').toList().length + courses.where((c) => c['status'] == 'Terminés et Non évalués').toList().length}",

                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 13,
                ),
                child: Tab(text: 'Terminés'),
              ),

              // non évalués
              Badge(
                backgroundColor: Colors.red,
                label: AppText(
                  text:
                      courses
                          .where(
                            (c) => c['status'] == 'Terminés et Non évalués',
                          )
                          .toList()
                          .length
                          .toString(),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.white,
                ),
                child: Tab(text: 'Terminés et Non évalués'),
              ),

              // évalués
              Badge(
                backgroundColor: Colors.red,
                label: AppText(
                  text:
                      courses
                          .where((c) => c['status'] == 'Évalués')
                          .toList()
                          .length
                          .toString(),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.white,
                ),
                child: Tab(text: 'Évalués'),
              ),

              // non commencés
              Badge(
                backgroundColor: Colors.red,
                label: AppText(
                  text:
                      courses
                          .where((c) => c['status'] == 'Non commencés')
                          .toList()
                          .length
                          .toString(),
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.white,
                ),
                child: Tab(text: 'Non commencés'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          //controller: tabController,
          children: [
            // tous les cours
            _buildCourseList(courses),

            // en cours
            _buildCourseList(
              courses.where((c) => c['status'] == 'En cours').toList(),
            ),

            // terminés
            _buildCourseList(
              courses.where((c) => c['status'] == 'Terminés').toList() +
                  courses
                      .where((c) => c['status'] == 'Terminés et Non évalués')
                      .toList(),
            ),

            // non évaluée
            _buildCourseList(
              courses
                  .where((c) => c['status'] == 'Terminés et Non évalués')
                  .toList(),
            ),

            // évalués
            _buildCourseList(
              courses.where((c) => c['status'] == 'Évalués').toList(),
            ),

            // non commencés
            _buildCourseList(
              courses.where((c) => c['status'] == 'Non commencés').toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList(List<Map<String, dynamic>> filteredCourses) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: filteredCourses.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: filteredCourses[index]['color'],
              child: Icon(Icons.book, color: Colors.white),
            ),
            title: AppText(
              text: filteredCourses[index]['title'],
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            subtitle: AppText(
              text: 'Statut: ${filteredCourses[index]['status']}',
              fontSize: 14,
              color: Colors.grey[600],
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Ajouter la navigation vers les détails du cours
            },
          ),
        );
      },
    );
  }
}
