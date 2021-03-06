#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockNesting, Style/GlobalVars, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Layout/LineLength, Lint/RedundantCopDisableDirective
require_relative '../lib/game_status.rb'
require_relative '../lib/game_utils.rb'
status = GameStatus.new
utils = GameUtils.new

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
    new_option = gets.chomp
    status.update_option(new_option.to_i) unless new_option.to_i.zero?
    puts ''
    puts ''
    puts 'Incorrect choice, choose from these options' if status.choosen_option != 1 && status.choosen_option != 2
  end

  exit if status.choosen_option == 2
  status.update_option(0)
  puts 'Score:'
  puts '-------------'
  puts "Palyer 1: #{status.score[0]}"
  puts '-------------'
  puts "Palyer 2: #{status.score[1]}"
  puts '-------------'
  puts ''
  puts ''
  until status.finished?
    puts ''
    puts ''
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
      move_x = gets.chomp.to_i
      print 'Choose y: '
      move_y = gets.chomp.to_i
      puts ''
      puts ''
      valid_move = utils.make_move(move_x, move_y)
      if valid_move == -1
        puts 'Bad move, stay in the following range x: 1..3 and y:1..3.'
      elsif valid_move.zero?
        puts 'Bad move, this move is already taken, choose only the moves in the provided list.'
      else
        status.update_status
      end
      puts ''
      puts ''
    end
  end
  if status.winner.zero?
    puts 'This round is a draw'
  else
    puts "the winner of this round is player #{status.winner}."
  end
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
    new_option = gets.chomp
    if new_option.to_i != 0
      status.update_option(new_option.to_i)
      status.update_winner(0)
      status.rest_board
    end
    puts ''
    puts ''
    puts 'Incorrect choice, choose from these options' if status.choosen_option != 1 && status.choosen_option != 2
    puts ''
    puts ''
  end
end
# rubocop:enable Metrics/BlockNesting, Style/GlobalVars, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Layout/LineLength, Lint/RedundantCopDisableDirective
