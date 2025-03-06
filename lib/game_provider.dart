import 'dart:math';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  final List<String> _wordList = ["FLUTTER", "DEVELOPER", "PROGRAMMING", "HANGMAN"];
  late String _wordToGuess;
  Set<String> guessedLetters = {};
  int wrongGuesses = 0;

  GameProvider() {
    _startNewGame();
  }

  void _startNewGame() {
    final random = Random();
    _wordToGuess = _wordList[random.nextInt(_wordList.length)];
    guessedLetters.clear();
    wrongGuesses = 0;
    notifyListeners();
  }

  String displayWord() {
    return _wordToGuess.split('').map((letter) {
      return guessedLetters.contains(letter) ? letter : '_';
    }).join(' ');
  }

  void guessLetter(String letter) {
    guessedLetters.add(letter);
    if (!_wordToGuess.contains(letter)) {
      wrongGuesses++;
    }
    notifyListeners();
  }

  bool isGameOver() => wrongGuesses >= 6 || isWinner();
  bool isWinner() => _wordToGuess.split('').every((letter) => guessedLetters.contains(letter));

  void resetGame() {
    _startNewGame();
  }
}
