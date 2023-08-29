import 'package:flutter/material.dart';
import 'package:travel_application/app_data.dart';

import '../widgets/section_title.dart';

class TripDetailsScreen extends StatelessWidget {
  TripDetailsScreen(
      {Key? key, required this.manageFavorite, required this.isFavorite})
      : super(key: key);
  Function manageFavorite;
  Function isFavorite;
  static String routeName = 'TripDetailsScreen';
  Widget biuldListViewContiner(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: const EdgeInsets.all(10),
      height: 200,
      child: child,
    );
  }

  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => tripId == trip.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedTrip.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: 23,
              ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const sectionTitle(
              text: 'الأنشطة',
            ),
            biuldListViewContiner(ListView.builder(
              itemBuilder: (context, index) => Card(
                elevation: 0.2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                  child: Text(selectedTrip.activities[index]),
                ),
              ),
              itemCount: selectedTrip.activities.length,
            )),
            const SizedBox(
              height: 10,
            ),
            const sectionTitle(
              text: 'البرنامج اليومي ',
            ),
            biuldListViewContiner(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('يوم ${index + 1}'),
                    ),
                    title: Text(selectedTrip.program[index]),
                  ),
                  const Divider()
                ],
              ),
              itemCount: selectedTrip.program.length,
            )),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => manageFavorite(tripId),
        child: Icon(
          isFavorite(tripId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
