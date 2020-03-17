# rubocop:disable Metrics/BlockNesting, Style/GlobalVars, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Layout/LineLength, Lint/RedundantCopDisableDirective
class GameUtils
  attr_accessor :player_turn
  def initialize
    @player_turn = 1
  end

  def make_move(move_x, move_y)
    if move_x > 3 || move_x < 1 || move_y > 3 || move_y < 1
      return -1
    elsif $players_moves[move_y - 1][move_x - 1].zero?
      $players_moves[move_y - 1][move_x - 1] = @player_turn
      @player_turn = (@player_turn == 1 ? 4 : 1)
      return 1
    else
      return 0
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
# rubocop:enable Metrics/BlockNesting, Style/GlobalVars, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Layout/LineLength, Lint/RedundantCopDisableDirective
