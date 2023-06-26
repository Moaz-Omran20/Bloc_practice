import 'dart:convert';

import 'package:bloc_practice/data_layer/models/AllCharacters.dart';
import 'package:dio/dio.dart';

import '../../constants/strings.dart';
import 'package:http/http.dart' as http;

class CharactersApi {
  late Dio dio;

  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: BASE_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<AllCharacters> getAllCharacters() async {
      Response response = await dio.get("character");
      AllCharacters allCharacters = AllCharacters.fromJson(response.data);
      print(response.data.toString());
      return allCharacters;
  }


  //  Future<AllCharacters> getAllCharacters() async {
  //   Uri URl =
  //   Uri.https(BASE_URL, "character");
  //   http.Response response = await http.get(URl);
  //   var jsonBody = jsonDecode(response.body);
  //   AllCharacters allCharacters = AllCharacters.fromJson(jsonBody);
  //   print(allCharacters.toString());
  //   return allCharacters;
  // }

}
