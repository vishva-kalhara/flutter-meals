import 'package:flutter/material.dart';
// import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/Micro/filter_item.dart';
// import 'package:meals/widgets/side_nav.dart';

enum Filters {
  glutenFree,
  vegan,
  vegetarien,
  lactoseFree,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currFIlters});

  final Map<Filters, bool> currFIlters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarien = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currFIlters[Filters.glutenFree]!;
    _vegan = widget.currFIlters[Filters.vegan]!;
    _vegetarien = widget.currFIlters[Filters.vegetarien]!;
    _lactoseFree = widget.currFIlters[Filters.lactoseFree]!;
  }

  void _setGlutenFree(bool isChecked) {
    // print(_glutenFree);
    // print(isChecked);
    _glutenFree = isChecked;
  }

  void _setVegan(bool isChecked) {
    _vegan = isChecked;
  }

  void _setVegetarien(bool isChecked) {
    _vegetarien = isChecked;
  }

  void _setLactoseFree(bool isChecked) {
    _lactoseFree = isChecked;
  }

  // bool _setFilterStat(bool isChecked) {
  //   print(isChecked);
  //   return isChecked;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.glutenFree: _glutenFree,
            Filters.vegan: _vegan,
            Filters.vegetarien: _vegetarien,
            Filters.lactoseFree: _lactoseFree,
          });

          return false;
        },
        child: Column(
          children: [
            FilterItem(title: "Gluten-Free", onChangedStat: _setGlutenFree),
            FilterItem(title: "Vegan", onChangedStat: _setVegan),
            FilterItem(title: "Vegetarien", onChangedStat: _setVegetarien),
            FilterItem(title: "Lactose-Free", onChangedStat: _setLactoseFree),
          ],
        ),
      ),
    );
  }
}
