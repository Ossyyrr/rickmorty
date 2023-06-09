import 'package:flutter/material.dart';
import 'package:rickmorty/core/model/character_model.dart';
import 'package:rickmorty/data/repository/character_repository.dart';
import 'package:rickmorty/ui/pages/characters_page/widget/character_card.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CharactersPage')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color.fromARGB(255, 255, 234, 196)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: StreamBuilder<List<Character>>(
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
                }),
          ),
        ),
      ),
    );
  }
}
