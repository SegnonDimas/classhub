import 'package:classhub/presentation/screens/class_results_page.dart';
import 'package:classhub/presentation/widgets/app_container.dart';
import 'package:flutter/material.dart';

import '../widgets/app_text.dart';

class UserProfilePage extends StatelessWidget {
  final String userName = "Michel AGOSSA";
  final String userStatus = "Étudiant(e) en deuxième année de Licence";
  final List<String> subjectsToResit = ["Mathématiques", "Data Science"];
  final List<String?> subjectsToResitDates = ["program : 02/06/2025", null];
  final List<String> subjectsToCatchUp = ["Économie", "Anglais"];
  final List<String?> subjectsToCatchUpDates = [null, "program : 01/08/2025"];
  final List<String> clubs = ["Club de programmation", "Club de Hacking Blanc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              SizedBox(height: 24),
              _buildStatus(),
              SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassResultsPage(),
                      ),
                    );
                  },
                  child: AppContainer(
                    borderRadius: 15,
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                      //right: MediaQuery.of(context).size.width * 0.1,
                      //left: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppText(
                            text: "Consulter vos résultats",
                            fontWeight: FontWeight.bold,
                          ),
                          Icon(
                            Icons.label_important_outline_sharp,
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              Divider(color: Colors.deepPurple),
              _buildSubjectsSection(
                "Matières à reprendre",
                subjectsToResit,
                dateCompo: subjectsToResitDates,
              ),
              SizedBox(height: 24),
              Divider(color: Colors.deepPurple),
              _buildSubjectsSection(
                "Matières à rattraper",
                subjectsToCatchUp,
                dateCompo: subjectsToCatchUpDates,
              ),
              SizedBox(height: 24),
              Divider(color: Colors.deepPurple),
              _buildClubsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            "https://www.w3schools.com/howto/img_avatar.png",
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                overflow: TextOverflow.visible,
                maxLines: 2,
                text: userName,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),

              AppText(
                overflow: TextOverflow.visible,
                maxLines: 2,
                text: userStatus,
                fontSize: 12,
                color: Colors.grey[600],
              ),
              AppText(
                overflow: TextOverflow.visible,
                maxLines: 2,
                text: "Matricule : 22416426",
                fontSize: 16,
                color: Colors.deepOrange,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatus() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: ListTile(
          leading: Icon(Icons.school_outlined, color: Colors.deepPurple),
          title: AppText(
            overflow: TextOverflow.visible,
            text: "Systèmes embarqués et Internet des Objets",
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            //fontSize: 16,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                AppText(
                  overflow: TextOverflow.visible,
                  text: "Licence 2",
                  //fontSize: 16,
                ),
                SizedBox(width: 50),
                AppText(
                  overflow: TextOverflow.visible,
                  text: "2024-2025",
                  //fontSize: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectsSection(
    String title,
    List<String> subjects, {
    List<String?>? dateCompo,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          overflow: TextOverflow.visible,
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),

        SizedBox(height: 8),
        if (subjects.isEmpty)
          AppText(
            overflow: TextOverflow.visible,
            text: "Aucune matière à afficher.",
            fontSize: 16,
            color: Colors.grey,
          )
        else
          ...subjects.map((subject) {
            print("::::::::::::${subjects.indexOf(subject)}::::::::::::::");
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: AppText(
                  overflow: TextOverflow.visible,
                  text: subject,
                  fontSize: 16,
                ),
                trailing: SizedBox(
                  width: 100,
                  child: AppText(
                    text:
                        dateCompo?[subjects.indexOf(subject)] ??
                        "pas programmée",
                    fontWeight: FontWeight.bold,
                    color:
                        dateCompo?[subjects.indexOf(subject)] == null
                            ? Colors.green
                            : Colors.orange,
                    fontSize: 8,
                  ),
                ),
              ),
            );
          }).toList(),
      ],
    );
  }

  Widget _buildClubsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          overflow: TextOverflow.visible,
          text: "Clubs auxquels vous appartenez",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),

        SizedBox(height: 8),
        if (clubs.isEmpty)
          AppText(
            overflow: TextOverflow.visible,
            text: "Vous n'êtes inscrit dans aucun club.",
            fontSize: 16,
            color: Colors.grey,
          )
        else
          ...clubs.map((club) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: AppText(
                  overflow: TextOverflow.visible,
                  text: club,
                  fontSize: 16,
                ),
              ),
            );
          }).toList(),
      ],
    );
  }
}
