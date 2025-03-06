import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Guess The Word',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const GameScreen(),
      ),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Guess The Word')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Wrong Guesses Left: ${6 - gameProvider.wrongGuesses}',
              style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Text(gameProvider.displayWord(),
              style: const TextStyle(fontSize: 30, letterSpacing: 5)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map((letter) {
              return ElevatedButton(
                onPressed: gameProvider.guessedLetters.contains(letter)
                    ? null
                    : () => gameProvider.guessLetter(letter),
                child: Text(letter),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          if (gameProvider.isGameOver())
            Column(
              children: [
                Text(
                  gameProvider.isWinner() ? 'You Won!' : 'You Lost!',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => gameProvider.resetGame(),
                  child: const Text('Play Again'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
