import 'dart:async';

import 'package:rickmorty/core/model/character_model.dart';
import 'package:rickmorty/core/model/info_model.dart';
import 'package:rickmorty/data/api/api.dart';

class CharacterRepository {
  static final StreamController<List<Character>> charactersController = StreamController<List<Character>>.broadcast();
  static Stream<List<Character>> get characterStream => charactersController.stream;
  static Info? charactersInfo;
  static int currentPage = 0;
  static List<Character> currentCharacters = [];

  static void updateCharacters(List<Character> characters) {
    currentCharacters = currentCharacters + characters;
    charactersController.sink.add(currentCharacters);
  }

  static Future<void> getCharacters() async {
    if (charactersInfo == null || currentPage <= charactersInfo!.pages) {
      final response = await Api.httpGet('character?page=${currentPage + 1}');
      charactersInfo = Info.fromMap(response['info']);
      final results = response['results'];
      List<Character> characters = results.map<Character>((character) => Character.fromMap(character)).toList();
      updateCharacters(characters);
      currentPage++;
    }
  }
}
