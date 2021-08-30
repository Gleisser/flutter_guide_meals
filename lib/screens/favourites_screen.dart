import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favoratedMeals;

  FavouritesScreen(this.favoratedMeals);

  @override
  Widget build(BuildContext context) {
    if (favoratedMeals.isEmpty) {
      return Center(
        child: Text("No Favorites found, please add some"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          final meal = favoratedMeals[i];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: favoratedMeals.length,
      );
    }
  }
}
