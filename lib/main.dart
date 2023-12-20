import 'package:flutter/material.dart';
import 'package:my_app/src/PokemonDetailScreen.dart';
// import file people vào file main
import 'package:my_app/src/people.dart';

import 'package:my_app/src/pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        onGenerateRoute: (settings) {
          if (settings.name == '/PokemonDetailScreen') {
            final value = settings.arguments as Pokemon;
            return MaterialPageRoute(
              builder: (_) => PokemonDetailScreen(selectedPokemon: value),
            );
          }
          return null; // Let `onUnknownRoute` handle this behavior.
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            if (_counter >= 6)
              const Expanded(
                child: PokemonScreen(),
              ),
            // for (var person in people)
            //   ListTile(
            //     leading: Image.network(person.picture),
            //     title: Text(person.name),
            //     onTap: () => {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Scaffold(
            //             appBar: AppBar(),
            //             body: PersonDetail(person),
            //           ),
            //         ),
            //       ),
            //     },
            //   ),
            // Thêm PokemonScreen ở đây
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PersonDetail extends StatelessWidget {
  final Person person;
  // Quan trọng là phần này
  const PersonDetail(this.person, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(person.name),
      Text(person.phone),
    ]));
  }
}
