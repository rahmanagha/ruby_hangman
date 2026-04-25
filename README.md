# Hangman

A command‑line implementation of the classic word‑guessing game Hangman, built with Ruby. Try to uncover the secret word letter by letter before the hangman is complete or risk it all with a full‑word solve.

This project is part of [The Odin Project](https://www.theodinproject.com/) Ruby curriculum, demonstrating object‑oriented design, file I/O, serialization with YAML, and a clean separation of concerns.

## 🎮 Features

  - Random word selection from a curated list of 10,000 English words (5–12 letters).
  - Turn‑by‑turn letter guessing with immediate feedback.
  - Full‑word "solve" command: guess the entire word at once (win instantly or lose immediately).
  - Save and load games using safe YAML serialization.
  - Quit with optional save prompt.
  - Replay loop: start a new game or resume a saved one without restarting the program.
  - Visual hangman progression (9 stages) displayed after each wrong guess.
  - Duplicate guess detection—no wasted turns.
  - Case‑insensitive input handling.

## ▶️ How to Play

1. **Clone the repository**

```bash
    git clone https://github.com/rahmanagha/ruby_hangman.git
   
    cd ruby_hangman
```

2. **Ensure Ruby is installed**

This project requires Ruby 2.7 or higher.
  
   `ruby --version`
   
3. **Run the game**

   `ruby main.rb`

4. **Choose your mode**

  - If you have saved games, you'll be asked whether to continue a saved game or start a new one.
  - Otherwise, a new game begins immediately.

5. **During the game**   

  - Enter a single letter (a–z) to guess.
  - Special commands (type instead of a letter):
      - `solve` – guess the whole word. If correct, you win; if wrong, you lose.
      - `save` – save your current progress to a file for later.
      - `quit` – exit (you'll be asked if you want to save first).
  - Duplicate guesses are ignored and don't count as mistakes.

6. **After the game**

  - You'll be asked if you want to play again. If yes, you'll return to the saved‑vs‑new choice (if saves exist) or a new game.


## 📁 Project Structure

```
   ruby_hangman/
   ├── .gitignore
   ├── .prettierignore
   ├── lib/
   │   ├── board.rb              # Display, hangman art, turn tracking
   │   ├── game.rb               # Orchestrator: turns, save/load, solve, quit
   │   ├── player.rb             # Input handling, guess history, keywords
   │   ├── secret_word.rb        # Word loading, feedback, full‑word check
   │   └── validatable.rb        # Shared validation (letter, duplicates)
   ├── google-10000-english-words.txt  # Word list
   ├── main.rb                   # Entry point, welcome message, replay loop
   ├── LICENSE
   └── README.md
```

   > Note: A saves/ directory is created automatically the first time you save a game. Saved files are stored there with a .yaml extension and are ignored by Git.

## 🛠️ Built With

  - Ruby – A dynamic, open‑source programming language with a focus on simplicity and productivity.
  - YAML – For human‑readable saved‑game serialization (safe loading).

## 🚀 Future Enhancements

  - Allow custom word lists
  - Implement difficulty levels (word length, max guesses)
  - Write RSpec tests for core logic

## 📝 License

This project is open source and available under the MIT License.

### 📄 Additional Notes

  - The word list (google-10000-english-words.txt) is sourced from Google's public‑domain English word frequency data.
  - The hangman ASCII art is stored in Board::HANGMANPICS and supports 9 stages (0–8 wrong guesses).