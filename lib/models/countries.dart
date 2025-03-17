// ignore_for_file: public_member_api_docs, sort_constructors_first
class Countries {
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;
  Countries({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }
}
