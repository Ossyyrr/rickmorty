import 'dart:convert';

import 'package:rickmorty/core/model/character_model.dart';
import 'package:rickmorty/core/model/info_model.dart';

class ApiResponse {
  Info info;
  List<Character> results;

  ApiResponse({
    required this.info,
    required this.results,
  });

  factory ApiResponse.fromJson(String str) => ApiResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromMap(Map<String, dynamic> json) => ApiResponse(
        info: Info.fromMap(json["info"]),
        results: List<Character>.from(json["results"].map((x) => Character.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}
