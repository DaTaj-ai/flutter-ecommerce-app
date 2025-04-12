import 'package:dio/dio.dart';
import 'package:flutterlab3/Models/meal_response_model.dart';
import 'package:flutterlab3/Service/ApiEndPoint.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../Models/category_response_model.dart';

class NetworkService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    ),
  )..interceptors.add(PrettyDioLogger());

  static Future<CategoryResponseModel> getCategorise(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        CategoryResponseModel myRsponse = await CategoryResponseModel.fromJson(
          response.data,
        );
        return myRsponse;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<MealsResponseModel> getMealsByCategory(String category) async {
    String url = ApiEndpoints.meals;
    try {
      final response = await _dio.get(url, queryParameters: {'c': category});
      if (response.statusCode == 200) {
        MealsResponseModel myResponse = await MealsResponseModel.fromJson(
          response.data,
        );
        return myResponse;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<MealsResponseModel> getMealbyId(String id) async {
    String url = ApiEndpoints.mealById;
    try {
      final response = await _dio.get(url, queryParameters: {'i': id});
      if (response.statusCode == 200) {
        MealsResponseModel myResponse = await MealsResponseModel.fromJson(
          response.data,
        );
        return myResponse;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
