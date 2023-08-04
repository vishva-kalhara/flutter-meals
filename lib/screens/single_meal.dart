import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/data/meal_data.dart';
import 'package:transparent_image/transparent_image.dart';

class SingleMeal extends StatelessWidget {
  const SingleMeal({super.key, required this.currMeal});

  final Meal currMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currMeal.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                currMeal.imageUrl,
                height: 300,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 24),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 10),
              for (final ing in currMeal.ingredients)
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    ing,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              const SizedBox(height: 40),
              Text(
                "Steps",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 10),
              for (final steps in currMeal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  child: Text(
                    steps,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
