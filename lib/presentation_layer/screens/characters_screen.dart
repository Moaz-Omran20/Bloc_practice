import 'package:bloc_practice/business_logic_layer/characters_cubit.dart';
import 'package:bloc_practice/presentation_layer/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/models/AllCharacters.dart';
import '../widgets/character_item.dart';

class CharachtersScreen extends StatefulWidget {
  static const String routeName = "CharactersScreen";

  @override
  State<CharachtersScreen> createState() => _CharachtersScreenState();
}

class _CharachtersScreenState extends State<CharachtersScreen> {
  late AllCharacters allCharacters;
  late List<Results> searchedCharacters;
  bool isSearching = false;
  var searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearching
          ? AppBar(
              backgroundColor: const Color(0xFFffc101),
              leading: IconButton(
                  onPressed: () {
                    isSearching = false;
                    setState(() {});
                  },
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
            )
          : AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      isSearching = true;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ))
              ],
              title: const Text(
                "Characters",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: const Color(0xFFffc101),
            ),
      backgroundColor: Colors.white10,
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.characters;
            print("success");
            return BuildLoadedWidget();
          } else {
            return LoadingIndicator();
          }
        },
      ),
    );
  }

  Widget BuildLoadedWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child: BuildCharactersList()),
        ],
      ),
    );
  }

  Widget BuildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 2 / 3),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return searchController.text.isEmpty
            ? CharacterItem(allCharacters.results![index]!)
            : CharacterItem(searchedCharacters[index]);
      },
      itemCount: searchController.text.isEmpty
          ? allCharacters.results!.length
          : searchedCharacters.length,
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
