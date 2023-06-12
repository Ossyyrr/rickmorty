import 'package:flutter/material.dart';
import 'package:rickmorty/core/model/character_model.dart';
import 'package:rickmorty/ui/pages/character_page/widget/character_appbar.dart';
import 'package:rickmorty/ui/widget/animation_translation.dart';
import 'package:rickmorty/ui/widget/character_image_hero.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Character character = ModalRoute.of(context)?.settings.arguments as Character;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimationTranslation(child: CharacterAppBar(character: character)),
            Container(
              margin: const EdgeInsets.all(16),
              child: CharacterImageHero(character: character, height: 200, width: 200),
            ),
          ],
        ),
      ),
    );
  }
}
