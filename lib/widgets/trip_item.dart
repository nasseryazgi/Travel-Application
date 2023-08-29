import 'package:flutter/material.dart';
import 'package:travel_application/models/trip.dart';

import '../screens/trips_details_screen.dart';

class TripItem extends StatelessWidget {
  TripItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.onPressed,
  }) : super(key: key);
  @override
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  void Function()? onPressed;
  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
      case Season.Spring:
        return 'ربيع';
      case Season.Summer:
        return 'صيف';
      case Season.Autom:
        return 'خريف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
      case TripType.Recovey:
        return 'نقاهة';
      case TripType.Activities:
        return 'أنشطة';
      case TripType.Therapy:
        return 'معالجة';
    }
  }

  // void Function()? onPressed(BuildContext context) {
  //   Navigator.pushNamed(context, TripDetailsScreen.routeName, arguments: Id);
  // }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.8),
                  ], stops: const [
                    0.3,
                    1
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.today,
                        color: Colors.amberAccent,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration أيام '),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: Colors.amberAccent,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.family_restroom,
                        color: Colors.amberAccent,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(tripTypeText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
