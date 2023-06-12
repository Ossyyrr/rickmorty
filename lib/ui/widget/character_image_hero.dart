import 'package:flutter/material.dart';
import 'package:rickmorty/core/model/character_model.dart';

class CharacterImageHero extends StatefulWidget {
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
  State<CharacterImageHero> createState() => _CharacterImageHeroState();
}

class _CharacterImageHeroState extends State<CharacterImageHero> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.character.id,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: GestureDetector(
          onDoubleTap: () => setState(() => isPressed = !isPressed),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: (widget.width ?? (MediaQuery.of(context).size.width / 2) - 20) * (isPressed ? 2 : 1),
            height: (widget.height ?? 140) * (isPressed ? 2 : 1),
            child: Image.network(
              widget.character.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
