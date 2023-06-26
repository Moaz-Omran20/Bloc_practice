import 'package:bloc_practice/data_layer/models/AllCharacters.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  Results character;

  CharacterItem(this.character);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black,
          alignment: Alignment.bottomCenter,
          child: Text(
            "${character.name}",
            style: const TextStyle(
                height: 1.3,
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        child: Container(
            color: Colors.grey,
            child: character.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: "assets/images/loading2.gif",
                    image: "${character.image}",
                    fit: BoxFit.fill,
                  )
                : Image.asset("assets/images/nike.png")),
      ),
    );
  }
}
