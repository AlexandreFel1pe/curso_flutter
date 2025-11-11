import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/error_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avaliableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      _avaliableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final fliterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && ! meal.isVegetarian;

        return !filterGluten && !fliterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  } 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(
            fontFamily: 'RobotoCondensed'
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (_) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(meals: _avaliableMeals),
        AppRoutes.MEAL_DETAIL: (_) => MealDetailScreen(),
        AppRoutes.SETTINGS: (_) => SettingsScreen(onSettingsChanged: _filterMeals),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return ErrorScreen();
        });
      },
    );
  }
}