import 'package:flutter/material.dart';
import 'package:rickmorty/core/model/character_model.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/character', arguments: character);
      },
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Hero(
                tag: character.id,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  height: 140,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    character.name,
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Image.asset(
                  character.species == Species.human ? 'assets/human.png' : 'assets/alien.png',
                  width: 30,
                  height: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
