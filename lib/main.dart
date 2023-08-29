import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_application/app_data.dart';
import 'package:travel_application/routes.dart';
import 'package:travel_application/screens/cagtegories_screen.dart';
import 'package:travel_application/screens/caterogry_trips_screen.dart';
import 'package:travel_application/screens/flitter_screens.dart';
import 'package:travel_application/screens/taps_screen.dart';
import 'package:travel_application/screens/trips_details_screen.dart';

import 'models/trip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'summer': false,
    'winter': false,
    'family': false
  };
  List<Trip> _avaiableTrips = Trips_data;
  final List<Trip> _favoriteTrips = [];
  void changeFilters(Map<String, bool> filterDate) {
    setState(() {
      filters = filterDate;
      _avaiableTrips = Trips_data.where((trip) {
        if (filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void manageFavorite(String tripId) {
    final existingIndex =
        _favoriteTrips.indexWhere((trip) => trip.id == tripId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool _isFovarite(String id) {
    //for Search For any Trip !
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
            headlineSmall: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'ElMessiri',
              fontWeight: FontWeight.normal,
            ),
            titleLarge: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontFamily: 'ElMessiri',
              fontWeight: FontWeight.normal,
            )),
        primarySwatch: Colors.teal,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          color: Colors.teal,
        ),
        fontFamily: 'ElMessiri',
      ),
      // Arabic RTL
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],

      supportedLocales: const [Locale("ar", "AE")],
      locale: const Locale("ar", "AE"),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favoriteTrips: _favoriteTrips),
        CategoryTripScreen.routeName: (context) =>
            CategoryTripScreen(_avaiableTrips),
        TripDetailsScreen.routeName: (context) => TripDetailsScreen(
              manageFavorite: manageFavorite,
              isFavorite: _isFovarite,
            ),
        FiltersScreen.routeName: (context) => FiltersScreen(
              saveFilters: changeFilters,
              current_filters: filters,
            )
      },
      //    home: const CagtegoriesScreen(),
    );
  }
}
