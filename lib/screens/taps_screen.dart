import 'package:flutter/material.dart';
import 'package:travel_application/screens/caterogry_trips_screen.dart';

import '../models/trip.dart';
import '../widgets/app_drawar.dart';
import 'cagtegories_screen.dart';
import 'favorites_screen.dart';

// class TabsScreen extends StatelessWidget {
//   const TabsScreen({Key? key}) : super(key: key);
//   static String routeName = 'TabsScreen';
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('دليل سياحي ',
//               style: Theme.of(context)
//                   .textTheme
//                   .titleLarge!
//                   .copyWith(fontSize: 23, color: Colors.white)),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text: 'التصنيفات',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'المفضلة',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [CagtegoriesScreen(), const FavoritesScreen()],
//         ),
//       ),
//     );
//   }
// }
class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, required this.favoriteTrips}) : super(key: key);
  final List<Trip> favoriteTrips;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  // final List<Widget> _screens = [
  //   const CagtegoriesScreen(),
  //   const FavoritesScreen()
  // ];
   late List<Map<String, Object>> _screens ;
  @override
  void initState() {
    _screens = [
    {
    'Screen': const CagtegoriesScreen(),
    'Title': 'تصنيفات الرحلات',
    },
    {
    'Screen': FavoritesScreen(
    favoriteTrips: widget.favoriteTrips,
    ),
    'Title': 'الرحلات المفضلة',
    }
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['Title'] as String,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: 23,
              ),
        ),
        centerTitle: true,
      ),
      drawer: const AppDrwer(),
      body: _screens[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.teal,
        selectedFontSize: 15,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'التصنيفات',
            icon: Icon(Icons.dashboard),
          ),
          BottomNavigationBarItem(
            label: 'الرحلات المفضلة',
            icon: Icon(Icons.star),
          )
        ],
      ),
    );
  }
}
