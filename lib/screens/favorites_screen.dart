import 'package:flutter/material.dart';
import 'package:travel_application/models/trip.dart';
import 'package:travel_application/screens/trips_details_screen.dart';

import '../widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key, required this.favoriteTrips});

  List<Trip> favoriteTrips;

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return const Center(
        child: Text('ليس لديك اي رحلة في قائمة المفضلة'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
            onPressed: () {
              Navigator.pushNamed(context, TripDetailsScreen.routeName,
                  arguments: favoriteTrips[index].id);
            },
          );
        },
      );
    }
  }
}
