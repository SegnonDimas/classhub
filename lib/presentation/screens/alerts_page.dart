import 'package:flutter/material.dart';

import '../widgets/app_text.dart';

class AlertsPage extends StatelessWidget {
  final List<String> urgentMessages = [
    "Réunion d'urgence ce vendredi à 14h.",
    "Fermeture exceptionnelle des bureaux demain.",
    "Cours suspendu ce lundi pour cause de grève.",
    "Inscription aux examens à partir de la semaine prochaine.",
  ];

  final List<String> importantMessages = [
    "Nouvelle bibliothèque ouverte à l'Université.",
    "Le transport universitaire sera réorganisé cette semaine.",
    "Séminaire sur l'entrepreneuriat le mois prochain.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Alertes',
          fontWeight: FontWeight.w900,
          color: Colors.deepPurple,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAlertSection("Urgent", urgentMessages, Colors.red),
              SizedBox(height: 16),
              _buildAlertSection("Important", importantMessages, Colors.orange),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertSection(String title, List<String> messages, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          overflow: TextOverflow.visible,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 8),
        if (messages.isEmpty)
          AppText(
            text: "Aucune alerte.",
            overflow: TextOverflow.visible,
            fontSize: 16,
            color: Colors.grey,
          )
        else
          ...messages.map((message) {
            return _buildAlertCard(message, color);
          }).toList(),
      ],
    );
  }

  Widget _buildAlertCard(String message, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Icon(Icons.warning_amber_rounded, color: color, size: 28),
        title: AppText(
          text: message,
          overflow: TextOverflow.visible,
          fontSize: 16,
        ),
        tileColor: color.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
