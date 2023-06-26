import 'package:flutter/material.dart';

import '../../data_layer/models/AllCharacters.dart';
import 'home_appbar.dart';

class SearchAppBar extends StatefulWidget {
  SearchAppBar(AllCharacters allCharacters);



  @override
  State<SearchAppBar> createState() => _SearchAppBarState(AllCharacters());
}

class _SearchAppBarState extends State<SearchAppBar> {
  var searchController = TextEditingController();
  late AllCharacters allCharacters;
  late List<Results> searchedCharacters;


  _SearchAppBarState(this.allCharacters);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFffc101),
      leading: IconButton(
          onPressed: () => HomeAppBar(allCharacters),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      title: TextField(
        onChanged: (searchedCharacter) {
          addSearchCharactersToSearchList(searchedCharacter);
        },
        controller: searchController,
        cursorColor: Colors.black,
        autofocus: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          // disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: "Find a character...",
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            searchController.clear();
            setState(() {});
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
  void addSearchCharactersToSearchList(String searchedCharacter) {
    searchedCharacters = allCharacters.results!
        .where((character) =>
        character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }
}
