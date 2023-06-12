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
      backgroundColor: const Color.fromARGB(255, 240, 252, 255),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimationTranslation(child: CharacterAppBar(character: character)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  CharacterImageHero(character: character, height: 200, width: 200),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Detalles:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('Especie: ${character.species?.name.toUpperCase() ?? '-'}'),
                      Text('Estado: ${character.status?.name.toUpperCase() ?? '-'}'),
                      Text('Ubicación: ${character.location?.name.toUpperCase() ?? '-'}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
