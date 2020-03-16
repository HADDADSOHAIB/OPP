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
    elsif full?
      @game_finished = true
      @winner = 0
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

  private

  def full?
    a = $players_moves[0].find(&:zero?)
    b = $players_moves[1].find(&:zero?)
    c = $players_moves[2].find(&:zero?)

    if a.nil? && b.nil? && c.nil?
      true
    else
      false
    end
  end
end