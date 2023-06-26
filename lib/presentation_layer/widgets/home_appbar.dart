import 'package:bloc_practice/presentation_layer/widgets/search_appbar.dart';
import 'package:flutter/material.dart';

import '../../data_layer/models/AllCharacters.dart';

class HomeAppBar extends StatelessWidget {

  late AllCharacters allCharacters;

  HomeAppBar(this.allCharacters);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () => SearchAppBar(allCharacters),
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ],
      title: const Text(
        "Characters",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFffc101),
    );
  }
}
