# frozen_string_literal: true

# Holds all the constants for the program
module Constants
  HANGMAN = [
    '
    +---+
    |   |
        |
        |
        |
        |
  =========',
    '
    +---+
    |   |
    O   |
        |
        |
        |
  =========',
    '
    +---+
    |   |
    O   |
    |   |
        |
        |
  =========',
    '
    +---+
    |   |
    O   |
   /|   |
        |
        |
  =========',
    '
    +---+
    |   |
    O   |
   /|\  |
        |
        |
  =========',
    '
    +---+
    |   |
    O   |
   /|\  |
   /    |
        |
  =========',
    '
    +---+
    |   |
    O   |
   /|\  |
   / \  |
        |
  ========='].freeze
end
