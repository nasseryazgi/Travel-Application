import 'package:flutter/material.dart';

import '../app_data.dart';
import '../widgets/categorie_item.dart';
import 'caterogry_trips_screen.dart';

class CagtegoriesScreen extends StatelessWidget {
  const CagtegoriesScreen({Key? key}) : super(key: key);
  @override
  static String routeName = '/';
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, //
        childAspectRatio: 1 / 1.2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: categories_data
          .map((categoryData) => CatergoryItem(
                onPressed: () => Navigator.pushNamed(
                    context, CategoryTripScreen.routeName,
                    arguments: {
                      'id': categoryData.id,
                      'title': categoryData.title,
                      'image': categoryData.imageUrl
                    }),
                title: categoryData.title,
                imageUrl: categoryData.imageUrl,
              ))
          .toList(),
    );
  }
}
