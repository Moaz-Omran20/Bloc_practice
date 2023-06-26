import 'package:bloc_practice/data_layer/api_manager/characters_api.dart';
import 'package:bloc_practice/data_layer/repositories/characters_repo.dart';
import 'package:bloc_practice/presentation_layer/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic_layer/characters_cubit.dart';

class AppRouter {

  late CharactersApi charactersApi;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersApi = CharactersApi();
    charactersCubit = CharactersCubit(charactersApi);
  }


  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (_) => charactersCubit,
              child: CharachtersScreen(),
            ),);
    }
  }
}