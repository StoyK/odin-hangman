# frozen_string_literal: true

require_relative 'constants'

# The game class holds the word, guesses and all of the game logic
class Game
  def pick_word
    dict = File.open('../words.txt', 'r')
    words = []
    dict.each_line do |line|
      line = line.chomp
      words << line if line.length.between?(5, 12)
    end
    dict.close
    words.sample
  end

  def initialize
    @word = pick_word
    @clues = []
    @word.length.times { @clues << '_' }
    @guessed = []
    @wrong_guessed = []
    @guesses = Constants::HANGMAN.length
    render 'Welcome to hangman!'
  end

  def render(msg = nil)
    system('clear')
    puts msg unless msg.nil?
    print 'Already guessed: '
    @wrong_guessed.each { |char| print "#{char}, " }
    puts "\n\n"
    @clues.each { |char| print "#{char} " }
    puts Constants::HANGMAN[Constants::HANGMAN.length - @guesses]
  end

  def give_clue(guess)
    @word.split('').each_with_index { |correct, i| @clues[i] = guess if guess == correct }
  end

  def enter_char(char)
    if @word.include?(char)
      give_clue char
      @guessed << char
      render 'Correct guess!'
    elsif @guessed.include?(char)
      render 'You have already guessed that!'
    else
      @guessed << char
      @wrong_guessed << char
      @guesses -= 1
      render 'Wrong guess!'
    end
  end

  def correct_guess(guess)
    unless guess.length == 1
      puts 'Only type one letter'
      false
    end

    unless guess.match(/\A[[:alpha:][:blank:]]+\z/)
      puts 'You can only put in letters'
      false
    end

    true
  end

  def play
    print 'Enter a letter: '
    guess = gets.chomp
    play unless correct_guess guess
    enter_char guess
  end

  def you_win
    system('clear')
    puts 'You win!'
    puts "The correct word was: #{@word}"
  end

  def you_lost
    system('clear')
    puts 'You lost!'
    puts "The correct word was: #{@word}"
  end

  def over?
    if @clues.join == @word
      you_win
      true
    elsif @guesses.zero?
      you_lost
      true
    else
      false
    end
  end
end

