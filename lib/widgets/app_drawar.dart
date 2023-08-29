import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_application/screens/flitter_screens.dart';

class AppDrwer extends StatelessWidget {
  const AppDrwer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.teal,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
              text: 'الرحلات',
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              icon: Icons.card_travel),
          buildListTile(
              text: 'الفلترة',
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              },
              icon: Icons.filter_list),
        ],
      ),
    );
  }

  Widget buildListTile(
      {required String text,
      required void Function()? onTap,
      required IconData icon}) {
    return ListTile(
      onTap: onTap,
      title: Text(
        text,
        style: const TextStyle(
            fontFamily: 'ElMessiri', fontSize: 20, fontWeight: FontWeight.bold),
      ),
      leading: Icon(
        icon,
        size: 30,
        color: Colors.teal,
      ),
    );
  }
}
