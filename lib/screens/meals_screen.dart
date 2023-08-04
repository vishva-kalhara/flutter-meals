import 'package:flutter/material.dart';
import 'package:meals/data/meal_data.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/single_meal.dart';
// import 'package:meals/data/meal_data.dart';
import 'package:meals/widgets/meals_list_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.title});

  final String title;
  final List<Meal> meals;

  void _selectedMeal(BuildContext context, Meal id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SingleMeal(currMeal: id),
      ),
    );
  }

  // String get _mealId{

  // }

  // String getMeal (String currMealId) {
  //   for(final meal in dummyMeals) {
  //     if(meal.title == );
  //   }
  //   return "";
  // }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealsListItem(
        meal: meals[index],
        onTapItem: () {
          _selectedMeal(
            context, meals[index]
          );
        },
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh... nothing here!',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting another category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content
        // body: ListView.builder(itemBuilder: (ctx, index) => Text(meals[index].title))
        );
  }
}
