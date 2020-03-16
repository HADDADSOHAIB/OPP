#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockNesting, Style/GlobalVars, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Layout/LineLength
# This is the logic side which will come in the next milestone
class GameStatus
  attr_accessor :score, :game_finished, :winner, :choosen_option
  $players_moves = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]

  def initialize
    @score = [0, 0]
    @game_finished = false
    @winner = 0
    @choosen_option = 0
  end

  def update_status
    @ligne1 = $players_moves[0][0] + $players_moves[0][1] + $players_moves[0][2]
    @ligne2 = $players_moves[1][0] + $players_moves[1][1] + $players_moves[1][2]
    @ligne3 = $players_moves[2][0] + $players_moves[2][1] + $players_moves[2][2]
    @ligne4 = $players_moves[0][0] + $players_moves[1][0] + $players_moves[2][0]
    @ligne5 = $players_moves[0][1] + $players_moves[1][1] + $players_moves[2][1]
    @ligne6 = $players_moves[0][2] + $players_moves[1][2] + $players_moves[2][2]
    @ligne7 = $players_moves[0][0] + $players_moves[1][1] + $players_moves[2][2]
    @ligne8 = $players_moves[0][2] + $players_moves[1][1] + $players_moves[2][0]

    if @ligne1 == 3 || @ligne2 == 3 || @ligne3 == 3 || @ligne4 == 3 || @ligne5 == 3 || @ligne6 == 3 || @ligne7 == 3 || @ligne8 == 3
      @game_finished = true
      @winner = 1
      @score[0] += 1
      @choosen_option = 0
    elsif @ligne1 == 12 || @ligne2 == 12 || @ligne3 == 12 || @ligne4 == 12 || @ligne5 == 12 || @ligne6 == 12 || @ligne7 == 12 || @ligne8 == 12
      @game_finished = true
      @winner = 2
      @score[1] += 1
      @choosen_option = 0
    else
      @game_finished = false
      @winner = 0
    end
  end

  def update_option(option)
    @choosen_option = option
    @game_finished = false
    $players_moves = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  end
end

class GameUtils
  attr_accessor :player_turn
  def initialize
    @player_turn = 1
  end

  def make_move(move_x, move_y)
    if $players_moves[move_y - 1][move_x - 1].zero?
      $players_moves[move_y - 1][move_x - 1] = @player_turn
      @player_turn = (@player_turn == 1 ? 4 : 1)
      true
    else
      puts 'Bad move, choose another.'
      false
    end
  end

  def display_move(move_x, move_y)
    if $players_moves[move_y - 1][move_x - 1] == 1
      'x'
    elsif $players_moves[move_y - 1][move_x - 1] == 4
      'o'
    else
      ' '
    end
  end

  def position_available?(move_x, move_y)
    $players_moves[move_y - 1][move_x - 1].zero?
  end
end

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
# rubocop:enable Metrics/BlockNesting, Style/GlobalVars, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Layout/LineLength
