import 'dart:convert';
import 'package:cook_project/models/categories.dart';
import 'package:cook_project/models/countries.dart';
import 'package:cook_project/models/meals.dart';
import 'package:http/http.dart' as http;
class Services {
  

  Future<List<Meal>> fetchMeal() async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=b'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      List<Meal> loadMeals =
          (data['meals'] as List).map((meal) => Meal.fromJson(meal)).toList();
      return loadMeals;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<Categories>> fetchCategories() async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> categoriesJson = data['categories'];
      return categoriesJson.map((json) => Categories.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<Countries>> fetchArea() async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=French'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> countryJson = data['meals'];
      return countryJson.map((json) => Countries.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
