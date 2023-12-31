import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
// import 'package:meals/data/meal_data.dart';
// import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/tabs.dart';
// import 'package:meals/screens/meals_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
      // home:  MealsScreen(meals: dummyMeals, title: 'tittle goes here'),
    );
  }
}
