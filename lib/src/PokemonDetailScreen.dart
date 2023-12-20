import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/src/pokemon.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon selectedPokemon;

  const PokemonDetailScreen({Key? key, required this.selectedPokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${selectedPokemon.name}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('URL: ${selectedPokemon.url}',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
