import 'package:flutter/material.dart';
import 'package:rickmorty/core/model/character_model.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.network(
          character.image,
          fit: BoxFit.cover,
          width: (MediaQuery.of(context).size.width / 2) - 20,
          height: 140,
        ),
      ),
    );
  }
}
