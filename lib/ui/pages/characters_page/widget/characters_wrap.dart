import 'package:flutter/material.dart';
import 'package:rickmorty/core/model/character_model.dart';
import 'package:rickmorty/data/repository/character_repository.dart';
import 'package:rickmorty/ui/pages/characters_page/widget/character_card.dart';

class CharactersWrap extends StatelessWidget {
  const CharactersWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/rickmorty.png',
            height: 100,
          ),
          const SizedBox(height: 24),
          StreamBuilder<List<Character>>(
            stream: CharacterRepository.characterStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (!snapshot.hasData) {
                CharacterRepository.getCharacters();
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final characters = snapshot.data;
              return Center(
                child: Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  children: characters!.map((character) {
                    return CharacterCard(character: character);
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
