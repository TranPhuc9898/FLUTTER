// ignore_for_file: public_member_api_docs, sort_constructors_first
// src/pokemon.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/src/PokemonDetailScreen.dart';

class Pokemon {
  final String name;
  final String url;

  Pokemon({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory Pokemon.fromJson(Map<String, dynamic> map) {
    return Pokemon(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  @override
  String toString() => 'Pokemon(name: $name, url: $url)';
}

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: fetchPokemon(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Pokemon>? pokemonList = snapshot.data;
              if (pokemonList != null) {
                return ListView.builder(
                  itemCount: pokemonList.length,
                  itemBuilder: (context, index) {
                    print("31231231231 $index");
                    return ListTile(
                      title: Text(pokemonList[index].name),
                      subtitle: Text(pokemonList[index].url),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PokemonDetailScreen(
                        //       selectedPokemon: pokemonList[index],
                        //     ),
                        //   ),
                        // );x
                        Navigator.pushNamed(context, '/PokemonDetailScreen',
                            arguments: pokemonList[index]);
                      },
                    );
                  },
                );
              }
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<List<Pokemon>> fetchPokemon() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=10&limit=10'));
    if (response.statusCode == 200) {
      List<dynamic> results = json.decode(response.body)['results'];
      List<Pokemon> pokemonList =
          results.map((item) => Pokemon.fromJson(item)).toList();
      return pokemonList;
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}
