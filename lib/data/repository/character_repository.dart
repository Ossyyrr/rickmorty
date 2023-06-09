import 'dart:async';

import 'package:rickmorty/core/model/character_model.dart';
import 'package:rickmorty/data/api/api.dart';

class CharacterRepository {
  
  static final StreamController<List<Character>> charactersController = StreamController<List<Character>>.broadcast();
  static Stream<List<Character>> get characterStream => charactersController.stream;

  static Future<void> getCharacters() async {
    final response = await Api.httpGet('character');
    final results = response['results'];
    List<Character> characters = results.map<Character>((character) => Character.fromMap(character)).toList();
    charactersController.sink.add(characters);
  }
}
