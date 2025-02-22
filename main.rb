# frozen_string_literal: true

require 'colorize'

WORDS = %w[apple bread chair dance eagle fruit green hover joint knife lemon music night olive plant queen river sugar
           table unity value water zebra angel beach clock dream flash glory honey house light night robin smile].freeze
chosen_word = WORDS.sample
@guesses = 0
@correct_guess = false

def game_over?
  @guesses >= 6 || @correct_guess
end

puts 'Welcome to Wordle! Make your guess below.'
until game_over?
  print "Attempt #{@guesses + 1}/6. Enter your guess: "
  guess = gets.chomp.downcase

  if guess.length != chosen_word.length
    puts "Your guess must be #{chosen_word.length} characters long!"
    next
  end

  @guesses += 1

  guess.chars.each_with_index do |char, index|
    if char == chosen_word[index]
      print char.colorize(:green)
    elsif chosen_word.include?(char)
      print char.colorize(:yellow)
    else
      print char.colorize(:red)
    end
  end
  puts

  @correct_guess = guess == chosen_word
  if @correct_guess
    puts 'You guessed the word! Congratulations!'
  elsif @guesses == 6
    puts "Game over! The correct word was: #{chosen_word.capitalize}"
  end

end
