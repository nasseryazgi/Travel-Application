import 'package:flutter/material.dart';
import 'package:travel_application/widgets/app_drawar.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen(
      {Key? key, required this.saveFilters, required this.current_filters})
      : super(key: key);
  static String routeName = 'FilterScreen';
  Function saveFilters;
  final Map<String, bool> current_filters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  bool summer = false;
  bool winter = false;
  bool forFamily = false;
  @override
  void initState() {
    summer = widget.current_filters['summer']!;
    winter = widget.current_filters['winter']!;
    forFamily = widget.current_filters['family']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrwer(),
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'summer': summer,
                  'winter': winter,
                  'family': forFamily
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ))
        ],
        title: Text(
          'هذه صفحة الفلترة',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: 23,
              ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  title: 'الرحلات الصيفية',
                  subTitle: 'إظهار الرحلات في فصل الصيف فقط',
                  currentValue: summer,
                  onChanged: (newValue) {
                    setState(() {
                      summer = newValue;
                    });
                  }),
              buildSwitchListTile(
                  title: 'الرحلات الشتوية',
                  subTitle: 'إظهار الرحلات في فصل الشتاء فقط',
                  currentValue: winter,
                  onChanged: (newValue) {
                    setState(() {
                      winter = newValue;
                    });
                  }),
              buildSwitchListTile(
                  title: 'للعلائلات ',
                  subTitle: 'إظهار الرحلات للتي للعائلات فقط ',
                  currentValue: forFamily,
                  onChanged: (newValue) {
                    setState(() {
                      forFamily = newValue;
                    });
                  })
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      {required String title,
      required String subTitle,
      required var currentValue,
      required void Function(bool)? onChanged}) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: currentValue,
        onChanged: onChanged);
  }
}
