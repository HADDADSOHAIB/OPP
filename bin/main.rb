#!/usr/bin/env ruby
# This is from a logic side which will come in the next milestone
require_relative '../lib/logic'
status = Game_status.new
utils = Game_utils.new

puts ''
puts 'Hello, welcome to the game.'
puts '---------------------------'
puts ''
puts ''

while status.choosen_option != 2
  while status.choosen_option != 1 && status.choosen_option != 2
    puts 'Options:'
    puts '1 - Start a new game'
    puts '2 - Exit the game'
    puts ''
    puts 'Choose an option (type 1 or 2):'
    status.update_option(Integer(gets.chomp))
    puts ''
    puts ''
    puts 'Incorrect choice, choose from these options' if status.choosen_option != 1 && status.choosen_option != 2
  end

  exit if status.choosen_option == 2

  puts 'Score:'
  puts '-------------'
  puts "Palyer 1: #{status.score[0]}"
  puts '-------------'
  puts "Palyer 2: #{status.score[1]}"
  puts '-------------'

  puts ''
  puts ''

  # This variable will be moved to logic area later
  until status.game_finished
    puts ''
    puts ''

    # display is a function in logic file that display either ' ', o or x
    puts '    -------------'
    puts "    | #{utils.display_move(1, 1)} | #{utils.display_move(2, 1)} | #{utils.display_move(3, 1)} |"
    puts '    -------------'
    puts "    | #{utils.display_move(1, 2)} | #{utils.display_move(2, 2)} | #{utils.display_move(3, 2)} |"
    puts '    -------------'
    puts "    | #{utils.display_move(1, 3)} | #{utils.display_move(2, 3)} | #{utils.display_move(3, 3)} |"
    puts '    -------------'
    puts ''
    puts ''

    valid_move = false
    until valid_move

      puts "player #{utils.player_turn == 4 ? 2 : 1} move:"
      puts ' 1- position (1, 1)' if utils.position_available?(1, 1)
      puts ' 2- position (1, 2)' if utils.position_available?(1, 2)
      puts ' 3- position (1, 3)' if utils.position_available?(1, 3)
      puts ' 4- position (2, 1)' if utils.position_available?(2, 1)
      puts ' 5- position (2, 2)' if utils.position_available?(2, 2)
      puts ' 6- position (2, 3)' if utils.position_available?(2, 3)
      puts ' 7- position (3, 1)' if utils.position_available?(3, 1)
      puts ' 8- position (3, 2)' if utils.position_available?(3, 2)
      puts ' 9- position (3, 3)' if utils.position_available?(3, 3)
      puts ''
      puts 'Make your move :'
      print 'Choose x: '
      move_x = Integer(gets.chomp)
      print 'Choose y: '
      move_y = Integer(gets.chomp)
      puts ''
      puts ''
      valid_move = utils.make_move(move_x, move_y)
      status.update_status if valid_move
      puts ''
      puts ''
    end
  end

  puts "the winner of this round is player #{status.winner}."
  puts 'Score:'
  puts '-------------'
  puts "Palyer 1: #{status.score[0]}"
  puts '-------------'
  puts "Palyer 2: #{status.score[1]}"
  puts '-------------'

  puts ''
  puts ''

  while status.choosen_option != 1 && status.choosen_option != 2
    puts 'Options:'
    puts '1 - Continue playing'
    puts '2 - Exit the game'
    puts ''
    puts 'Choose an option (type 1 or 2):'
    status.update_option(Integer(gets.chomp))
    puts ''
    puts ''
    puts 'Incorrect choice, choose from these options' if status.choosen_option != 1 && status.choosen_option != 2
    puts ''
    puts ''
  end
end
