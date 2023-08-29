import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatergoryItem extends StatelessWidget {
  CatergoryItem(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.onPressed})
      : super(key: key);
  final String title;
  final String imageUrl;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Scaffold(
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.4),
              ),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
