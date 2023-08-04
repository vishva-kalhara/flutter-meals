import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
// import 'package:meals/models/Category.dart';
import 'package:meals/widgets/Micro/meal_iteam_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsListItem extends StatelessWidget {
  const MealsListItem({super.key, required this.meal, required this.onTapItem});

  final Meal meal;
  final void Function() onTapItem;

  String get _complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get _afordabilityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: onTapItem,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              // image: const NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg'),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(icon: Icons.schedule, text: '${meal.duration} Mins'),
                          const SizedBox(width: 10),
                          MealItemTrait(icon: Icons.work, text: _complexityText.toString()),
                          const SizedBox(width: 10),
                          MealItemTrait(icon: Icons.attach_money_outlined, text: _afordabilityText.toString()),
                          // MealItemTrait(icon: Icons.schedule, text: '${meal.duration} Mins'),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
