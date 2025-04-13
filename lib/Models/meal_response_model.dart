// class MealsResponseModel {
//   List<Meals>? meals;
//
//   MealsResponseModel({this.meals});
//
//   MealsResponseModel.fromJson(Map<String, dynamic> json) {
//     if (json['meals'] != null) {
//       meals = <Meals>[];
//       json['meals'].forEach((v) {
//         meals!.add(new Meals.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.meals != null) {
//       data['meals'] = this.meals!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

import 'MeasureModel.dart';

class MealsResponseModel {
  List<Meals>? meals;

  MealsResponseModel({this.meals});

  factory MealsResponseModel.fromJson(Map<String, dynamic> json) {
    return MealsResponseModel(
      meals:
          (json['meals'] as List<dynamic>?)
              ?.map((mealJson) => Meals.fromJson(mealJson))
              .toList(),
    );
  }
}

class Meals {
  String? idMeal;
  String? strMeal;
  String? strMealAlternate;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strIngredient16;
  String? strIngredient17;
  String? strIngredient18;
  String? strIngredient19;
  String? strIngredient20;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strMeasure16;
  String? strMeasure17;
  String? strMeasure18;
  String? strMeasure19;
  String? strMeasure20;
  String? strSource;
  String? strImageSource;
  String? strCreativeCommonsConfirmed;
  String? dateModified;

  Meals({
    this.idMeal,
    this.strMeal,
    this.strMealAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  List<String> ingredients = [];
  List<String> measures = [];

  List<Map<String, String>> getIngredientMeasureList() {
    List<Map<String, String>> ingredientMeasureList = [];
    print("yes 1");
    for (int i = 0; i < ingredients.length; i++) {
      print("yes 2");
      ingredientMeasureList.add({
        'ingredient': ingredients[i],
        'measure': measures[i],
      });
    }

    return ingredientMeasureList;
  }

  Meals.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strMealAlternate = json['strMealAlternate'];
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    strTags = json['strTags'];
    strYoutube = json['strYoutube'];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        print("yes yes yes");
        ingredients.add(ingredient.toString().trim());
        measures.add(measure?.toString().trim() ?? '');
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['idMeal'] = idMeal;
    data['strMeal'] = strMeal;
    data['strMealAlternate'] = strMealAlternate;
    data['strCategory'] = strCategory;
    data['strArea'] = strArea;
    data['strInstructions'] = strInstructions;
    data['strMealThumb'] = strMealThumb;
    data['strTags'] = strTags;
    data['strYoutube'] = strYoutube;

    for (int i = 0; i < ingredients.length; i++) {
      print("Yes");
      data['strIngredient${i + 1}'] = ingredients[i];
      data['strMeasure${i + 1}'] = measures[i];
    }

    data['strSource'] = strSource;
    data['strImageSource'] = strImageSource;
    data['strCreativeCommonsConfirmed'] = strCreativeCommonsConfirmed;
    data['dateModified'] = dateModified;
    return data;
  }
}

// extension Extension on Meals {
//   List<MeasureModel> getList() {
//     List<MeasureModel> ingredientMeasureList = [];
//
//     for(int i = 0 ; i<20 ; i++){
//       ingredientMeasureList.add(MeasureModel(getFeildValue("strIngredient$i"),getFeildValue("strMeasure$i"),"));
//     }
//   }
// }
