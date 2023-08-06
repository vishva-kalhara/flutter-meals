import 'package:flutter/material.dart';
import 'package:meals/data/meal_data.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/side_nav.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.vegan: false,
  Filters.vegetarien: false,
  Filters.lactoseFree: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  Map<Filters, bool> _selectedFilters = kInitialFilters;

  void _showInforMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavouriteList(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
        _showInforMessage("Item Removed!");
      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        _showInforMessage("Item Added!");
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>  FiltersScreen(currFIlters: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    } else {}
  }

  @override
  Widget build(context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filters.vegetarien]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();

    var activePageTItle = 'Categories';
    Widget activePage = CategoryScreen(
      onToggleFavourite: _toggleMealFavouriteList,
      availableMeals: availableMeals,
    );

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteList,
      );
      activePageTItle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTItle),
      ),
      drawer: SideDrawer(onSelecScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite"),
        ],
      ),
    );
  }
}
