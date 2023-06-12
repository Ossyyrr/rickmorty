import 'package:flutter/material.dart';
import 'package:rickmorty/data/repository/character_repository.dart';
import 'package:rickmorty/ui/pages/characters_page/widget/characters_wrap.dart';
import 'package:rickmorty/ui/widget/loader.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  bool isLoading = false;
  Future<void> loadMoreCharacters() async {
    setState(() => isLoading = true);
    await CharacterRepository.getCharacters();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 252, 255),
      body: SafeArea(
        child: NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              if (notification.metrics.extentAfter < 500) {
                debugPrint('Final del scroll');
                loadMoreCharacters();
              }
              return true;
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const CharactersWrap(),
                if (isLoading) const Loader(),
              ],
            )),
      ),
    );
  }
}
