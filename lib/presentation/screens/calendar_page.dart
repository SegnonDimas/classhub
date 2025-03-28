import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/app_container.dart';
import '../widgets/app_text.dart';

// Page du calendrier
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  List<Widget> eventItems =
      [
        _buildEvent(
          title: "Conférence Flutter",
          date: "10/08/2025",
          imagePath:
              "https://storage.googleapis.com/cms-storage-bucket/original_images/Flutter_F_4K_Wallpaper_1.png",
        ),
        _buildEvent(
          title: "Hackathon AI",
          date: "15/09/2025",
          dateColor: Colors.red,
          imagePath:
              "https://ggba.swiss/app/uploads/2024/04/Idiap-AI-Challenge-2360x1622-1.jpeg",
        ),
        _buildEvent(
          title: "Atelier Web3",
          date: "20/10/2025",
          imagePath:
              "https://jamiahamdardonline.in/assets/img/blog/cracking-the-c-programming-code-tips-and-tricks.jpg",
        ),
      ] +
      [
        _buildEvent(
          title: "Séminaire Développement Durable",
          date: "05/11/2025",
        ),
        _buildEvent(
          title: "Formation Leadership",
          date: "22/11/2025",
          imagePath:
              "https://i0.wp.com/formation-suisse-romande.ch/wp-content/uploads/leadership-orientations.jpg?fit=800%2C733&ssl=1",
        ),
        _buildEvent(
          title: "Lancement du Projet Blockchain",
          date: "10/12/2025",
          imagePath:
              "https://thecodingmachine.com/wp-content/uploads/choisir-une-blockhain-projet-nft.jpg",
        ),
        _buildEvent(
          title: "Salon de l'Innovation",
          date: "18/12/2025",
          imagePath:
              "https://www.groupe-smb.com/wp-content/uploads/2024/09/Visuel-Blog.png",
        ),
        _buildEvent(
          title: "Conférence Web et Mobile",
          date: "25/01/2026",
          imagePath:
              "https://www.conferencecalling.com/static/5a6f3065e376af171a734e0762edfc35/8ffd9/mobile-suite.jpg",
        ),

        _buildEvent(
          title: "Workshop Développement Mobile",
          date: "20/02/2026",
          imagePath:
              "https://img.freepik.com/vecteurs-libre/banniere-developpement-applications_33099-1720.jpg",
        ),
        _buildEvent(
          title: "Webinaire Marketing Digital",
          date: "12/03/2026",
          imagePath: "https://i.ytimg.com/vi/aMs-qaKYpw4/maxresdefault.jpg",
        ),
        _buildEvent(
          title: "Rencontres IoT",
          date: "25/03/2026",
          imagePath:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_BxKN0GeP-SXpljG1aHs8Mcmk1xvbk0whbg&s",
        ),
        _buildEvent(
          title: "Hackathon Cybersecurity",
          date: "05/04/2026",
          imagePath:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0q1lJnrYbrVehyD-wDsBrbE75yxbCGiKvGA&s",
        ),

        _buildEvent(
          title: "Lancement d'un Projet Open Source",
          date: "10/06/2026",
          imagePath:
              "https://inno3.fr/wp-content/uploads/2022/10/i3-WD_OpenSource-1.png",
        ),
        _buildEvent(
          title: "Séminaire UX/UI Design",
          date: "30/06/2026",
          imagePath:
              "https://localhost-academy.com/wp-content/uploads/2023/12/ui.jpg",
        ),
      ];

  List<Widget> calendarEventItems = [
    _buildCalendarEvent(
      title: "Flutter",
      date: "05/04/2025",
      type: 'Composition',
      imagePath:
          "https://media.istockphoto.com/id/1305490881/fr/vectoriel/%C3%A9criture-de-main-avec-lic%C3%B4ne-noire-de-glyphe-de-stylo.jpg?s=612x612&w=0&k=20&c=0ikpU8cA2SA4xNrG-QKfVDGMBxpJeJbYKsKcpMrfFBM=",
    ),
    _buildCalendarEvent(
      title: "Sécurité des Systèmes Informatiques",
      date: "05/04/2025",
      type: 'Cours en ligne',
      imagePath:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZH9s_i6sIlum25BKzgXNd1CV9xM--M0iWNuuTCUwqNqnFd8iSgMaM2M8LvKAagySnpNA&usqp=CAU",
    ),
    _buildCalendarEvent(
      title: "PSSI",
      date: "05/04/2025",
      type: 'TP',
      imagePath:
          "https://www.tousauweb.com/wp-content/uploads/2021/02/travaux-pratiques.png",
    ),
    _buildCalendarEvent(
      title: "Anglais",
      date: "05/04/2025",
      type: 'Cours',
      imagePath:
          "https://www.tousauweb.com/wp-content/uploads/2020/01/prof.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "Calendrier",
          color: Colors.deepPurple,
          fontWeight: FontWeight.w900,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.access_time_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.pin_drop_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //espace
            SizedBox(height: 20),

            //carousel
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: buildCarousel(eventItems),
              ),
            ),

            // calendrier
            SizedBox(
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },

                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.inversePrimary.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  markerDecoration: BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            //espace
            SizedBox(height: 20),

            // liste de quelques évènements
            AppText(
              text:
                  "Cours et évaluations du ${_selectedDay.toLocal().day}/${_selectedDay.toLocal().month}/${_selectedDay.toLocal().year}",
            ),

            //espace
            SizedBox(height: 20),

            AppContainer(
              //height: MediaQuery.of(context).size.height * 4,
              width: MediaQuery.of(context).size.width * 0.95,
              boxShadow: [],
              color: Theme.of(context).focusColor.withOpacity(0.01),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(children: calendarEventItems),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCalendarEvent({
  double? width,
  String? title,
  String? date,
  String? type,
  Color? dateColor,
  Color? backgroundColor,
  String? imagePath,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
    child: AppContainer(
      padding: EdgeInsets.all(4),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade800,
          blurRadius: 2,
          spreadRadius: 1,
          offset: Offset(-1, 1),
        ),
      ],
      borderRadius: 20,
      color: backgroundColor,
      width: width,
      child: ListTile(
        title: AppText(text: title ?? "\<Code hack/>"),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: date ?? "06/07/2025",
              fontSize: 8,
              color: dateColor ?? Colors.orange,
            ),
            AppText(
              text: type ?? "...",
              fontSize: 10,
              color:
                  type!.toLowerCase().contains('cours')
                      ? Colors.green
                      : Colors.deepOrange,
            ),
          ],
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: Image.network(
            height: 60,
            width: 60,
            fit: BoxFit.cover,
            imagePath ??
                "https://jamiahamdardonline.in/assets/img/blog/cracking-the-c-programming-code-tips-and-tricks.jpg",
          ),
        ),

        trailing: Icon(Icons.arrow_forward_ios, size: 15),
      ),
    ),
  );
}

Widget _buildEvent({
  double? width,
  String? title,
  String? date,
  Color? dateColor,
  Color? backgroundColor,
  String? imagePath,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
    child: AppContainer(
      padding: EdgeInsets.all(4),

      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade800,
          blurRadius: 5,
          spreadRadius: 2,
          offset: Offset(0, 2),
        ),
      ],
      color: backgroundColor,
      width: width,
      child: ListTile(
        title: AppText(text: title ?? "\<Code hack/>"),
        subtitle: AppText(
          text: date ?? "06/07/2025",
          fontSize: 10,
          color: dateColor ?? Colors.orange,
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: Image.network(
            height: 60,
            width: 60,
            fit: BoxFit.cover,
            imagePath ??
                "https://jamiahamdardonline.in/assets/img/blog/cracking-the-c-programming-code-tips-and-tricks.jpg",
          ),
        ),
      ),
    ),
  );
}

Widget buildCarousel(List<Widget>? eventItems) {
  return CarouselSlider(
    items: eventItems,
    options: CarouselOptions(
      autoPlay: true,
      enlargeCenterPage: true,
      aspectRatio: 35 / 10,
      viewportFraction: 0.8,
    ),
  );
}
