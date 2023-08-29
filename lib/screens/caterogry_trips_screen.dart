import 'package:flutter/material.dart';
import 'package:travel_application/app_data.dart';
import 'package:travel_application/screens/trips_details_screen.dart';
import 'package:travel_application/widgets/trip_item.dart';

import '../models/trip.dart';

class CategoryTripScreen extends StatefulWidget {
  static String routeName = 'CategtoryTrips';
  final List<Trip> avaiableTrips;
  CategoryTripScreen(this.avaiableTrips);

  @override
  State<CategoryTripScreen> createState() => _CategoryTripScreenState();
}

class _CategoryTripScreenState extends State<CategoryTripScreen> {
  late String id;
  @override
  String? categorytitle;
  late List<Trip> displayTrips;

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    categorytitle = routeArgument['title']!;
    displayTrips = widget.avaiableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categorytitle!,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: 23,
              ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            onPressed: () {
              Navigator.pushNamed(context, TripDetailsScreen.routeName,
                      arguments: displayTrips[index].id)
                  .then((result) {
                if (result != null) {
                  id = result as String;
                  _removeTrip(id);
                }
              });
            },
          );
        },
      ),
    );
  }
}
