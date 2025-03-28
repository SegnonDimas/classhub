import 'package:classhub/providers/main_currentPage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_text.dart';

// Page d'accueil
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: AppText(text: "Accueil", fontWeight: FontWeight.bold),
        centerTitle: true,
        //backgroundColor: Colors.deepPurple,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Image.asset(height: 50, "assets/logo.png"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: "Bienvenue sur ClassHub",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildFeatureCard(
                    Icons.book,
                    "Cours",
                    "Accédez à tous vos cours en un seul endroit",
                    () {
                      context.read<CurrentPageProvider>().setCurrentPage(2);
                    },
                  ),
                  _buildFeatureCard(
                    Icons.notifications,
                    "Alertes",
                    "Recevez les dernières informations de votre université",
                    () {
                      context.read<CurrentPageProvider>().setCurrentPage(3);
                    },
                  ),
                  _buildFeatureCard(
                    Icons.calendar_today,
                    "Calendrier",
                    "Consultez les dates des cours et examens",
                    () {
                      context.read<CurrentPageProvider>().setCurrentPage(1);
                    },
                  ),
                  _buildFeatureCard(
                    Icons.person,
                    "Profil",
                    "Gérez vos informations personnelles et votre statut académique",
                    () {
                      context.read<CurrentPageProvider>().setCurrentPage(4);
                    },
                  ),
                ],
              ),
            ),
            Center(child: Image.asset(height: 150, "assets/logo.png")),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    IconData icon,
    String title,
    String subtitle, [
    void Function()? ontap,
  ]) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(icon, size: 40, color: Colors.deepPurple),
          title: AppText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          subtitle: AppText(text: subtitle),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
