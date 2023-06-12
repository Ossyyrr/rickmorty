import 'package:flutter/material.dart';
import 'package:rickmorty/core/model/character_model.dart';
import 'package:rickmorty/ui/pages/character_page/widget/character_appbar.dart';
import 'package:rickmorty/ui/widget/animation_translation.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Character character = ModalRoute.of(context)?.settings.arguments as Character;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: character.id,
              child: Image.network(
                character.image,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
            Positioned(
              left: 0,
              top: 8,
              child: AnimationTranslation(child: CharacterAppBar(character: character)),
            ),
          ],
        ),
      ),
    );
  }
}
