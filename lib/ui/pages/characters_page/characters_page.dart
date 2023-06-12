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
      body: SafeArea(
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
            print(notification.metrics.extentAfter);
            if (notification.metrics.extentAfter < 400) {
              debugPrint('Final del scroll');
              CharacterRepository.getCharacters();
            }
            return true;
          },
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
