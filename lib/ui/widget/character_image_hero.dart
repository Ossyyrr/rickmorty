import 'package:flutter/material.dart';
import 'package:rickmorty/core/model/character_model.dart';

class CharacterImageHero extends StatelessWidget {
  const CharacterImageHero({
    super.key,
    required this.character,
    this.height,
    this.width,
  });

  final Character character;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.network(
          character.image,
          fit: BoxFit.cover,
          width: width ?? (MediaQuery.of(context).size.width / 2) - 20,
          height: height ?? 140,
        ),
      ),
    );
  }
}
