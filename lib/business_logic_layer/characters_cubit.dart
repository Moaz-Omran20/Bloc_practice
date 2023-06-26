import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data_layer/api_manager/characters_api.dart';
import 'package:bloc_practice/data_layer/models/AllCharacters.dart';
import 'package:meta/meta.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersApi charactersApi;
   AllCharacters? characters;

  CharactersCubit(this.charactersApi) : super(CharactersInitial());

  AllCharacters? getAllCharacters() {
    charactersApi.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters=characters;
      print(characters);
    });
    return characters;
  }
}
