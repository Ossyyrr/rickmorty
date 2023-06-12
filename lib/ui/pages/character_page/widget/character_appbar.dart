import 'package:flutter/material.dart';
import 'package:rickmorty/core/model/character_model.dart';

class CharacterAppBar extends StatelessWidget {
  const CharacterAppBar({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        color: Colors.black38,
      ),
      padding: const EdgeInsets.only(left: 8, right: 24, top: 8, bottom: 8),
      alignment: Alignment.topRight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 32),
          ),
          Text(
            character.name,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
