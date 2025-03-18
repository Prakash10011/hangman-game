Guess The Word Game :

Overview:
This is a "Guess The Word" game built using Flutter with Provider for state management. The player tries to guess a hidden word by selecting letters from the alphabet. The game tracks wrong guesses and ends when the player guesses the word correctly or reaches the maximum allowed wrong guesses.

Features:
Displays the hidden word with underscores for unguessed letters
Allows letter guessing with interactive buttons
Tracks wrong guesses and shows remaining attempts
Displays a win or loss message at the end of the game
Provides a "Play Again" button to reset the game

How It Works:
Game Initialization:
A random word is selected from a predefined list in GameProvider.
The hidden word is shown with underscores representing unguessed letters.

Guessing Letters:

Player taps a letter button → Letter is checked against the hidden word.
If correct → Letter is revealed in the word.
If wrong → Wrong guess count increases.

Game Over Conditions:

Maximum of 6 wrong guesses allowed.
If all letters are guessed → Player wins.
If wrong guess limit is reached → Player loses.

Game Reset:

After a win or loss → "Play Again" button resets the game with a new word.

Project Structure:
Key Files:

main.dart – Contains the main game UI and state interaction using Provider.
game_provider.dart – Manages game state, word selection, and game logic.
pubspec.yaml – Manages dependencies like provider.

State Management:
Provider is used for state management.
setState() is replaced with notifyListeners() to update the UI dynamically.

Changes Made:
Implemented state management with Provider.
Added win/loss tracking and feedback to the user.
Enabled dynamic UI updates based on the current game state.

Why These Changes:
To create a responsive and interactive game using state management.
To provide a smooth user experience with clear win/loss feedback.
To enable easy extension and scalability with state separation.
