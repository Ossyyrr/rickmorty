import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickmorty/ui/pages/character_page/character_page.dart';
import 'package:rickmorty/ui/pages/characters_page/characters_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.patrickHand().fontFamily,
      ),
      initialRoute: '/characters',
      routes: {
        '/characters': (context) => const CharactersPage(),
        '/character': (context) => const CharacterPage(),
      },
    );
  }
}
