// ignore_for_file: public_member_api_docs, sort_constructors_first
class Meal {
  final String? idMeal;
  final String? strMeal;
  final String? strMealAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<String?> strIngredient;
  final List<String?> strMeasure;
  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strMealAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredient,
    required this.strMeasure,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String?> ingredients = [];
    List<String?> measures = [];
    for (int i = 1; i <= 20; i++) {
      String? ingredient = json['strIngredient $i'];
      String? measure = json['$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure);
      }
    }
    return Meal(
        idMeal: json['idMeal'] ?? '',
        strMeal: json['strMeal'] ?? '',
        strMealAlternate: json['strMealAlternate'] ?? '',
        strCategory: json['strCategory'] ?? '',
        strArea: json['strArea'] ?? '',
        strInstructions: json['strInstructions'] ?? '',
        strMealThumb: json['strMealThumb'] ?? '',
        strTags: json['strTags'] ?? '',
        strYoutube: json['strYoutube'] ?? '',
        strIngredient: ingredients,
        strMeasure: measures);
  }

  //hàm lấy link youtube
  String get youtube {
  if (strYoutube == null || strYoutube!.isEmpty) {
    return 'https://via.placeholder.com/150';
  }

  String? videoID;

  try {
    Uri uri = Uri.parse(strYoutube!);
    if (uri.host.contains('youtu.be')) {
      videoID = uri.pathSegments.first;
    } else if (uri.host.contains('youtube.com')) {
      videoID = uri.queryParameters['v'];
    }
  } catch (e) {
    // print('Error parsing YouTube URL: $e');
  }

  return videoID != null
      ? 'https://img.youtube.com/vi/$videoID/hqdefault.jpg'
      : 'https://via.placeholder.com/150';
}

}
