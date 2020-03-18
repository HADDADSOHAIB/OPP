# rubocop:disable Metrics/BlockNesting, Style/GlobalVars, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Layout/LineLength, Lint/RedundantCopDisableDirective
require_relative '../lib/game_utils.rb'
require_relative '../lib/game_status.rb'

RSpec.describe GameUtils do
  let(:utils) { GameUtils.new }
  let(:status) { GameStatus.new }
  describe '#initialize' do
    it 'initialize the player turn to 1' do
      expect(utils.player_turn).to eql(1)
    end
  end

  describe '#make_move' do
    it 'return -1 when the value is outside of 1..3 range' do
      expect(utils.make_move(0, 2)).to eql(-1)
      expect(utils.make_move(5, 2)).to eql(-1)
      expect(utils.make_move(2, 0)).to eql(-1)
      expect(utils.make_move(2, 5)).to eql(-1)
    end
    it 'return 0 when the value provided is a filled case' do
      status.rest_board
      $players_moves[1][1] = 4
      expect(utils.make_move(2, 2)).to eql(0)
    end
    it 'return 1 when the values are valid' do
      status.rest_board
      expect(utils.make_move(2, 2)).to eql(1)
    end
    it 'the $players_moves case is filled when the values are valid' do
      status.rest_board
      turn = utils.player_turn.dup
      utils.make_move(2, 2)
      expect($players_moves[1][1]).to eql(turn)
    end
    it 'After a move, the player turn change when the values are valid' do
      status.rest_board
      turn = utils.player_turn.dup
      utils.make_move(2, 2)
      expect(utils.player_turn).to_not eql(turn)
    end
  end

  describe 'display_move' do
    it "return 'x' when the case is filled with 1" do
      status.rest_board
      $players_moves[1][1] = 1
      expect(utils.display_move(2, 2)).to eql('x')
    end
    it "return 'o' when the case is filled with 4" do
      status.rest_board
      $players_moves[1][1] = 4
      expect(utils.display_move(2, 2)).to eql('o')
    end
    it "return ' ' when the case is filled not with 4 nor 1" do
      status.rest_board
      $players_moves[1][1] = 'nxc'
      expect(utils.display_move(2, 2)).to eql(' ')
    end
  end

  describe 'position_available?' do
    it 'return false when the case is filled' do
      status.rest_board
      $players_moves[1][1] = 4
      expect(utils.position_available?(2, 2)).to eql(false)
    end

    it 'return false when the case is filled' do
      status.rest_board
      expect(utils.position_available?(2, 2)).to eql(true)
    end
  end
end
# rubocop:enable Metrics/BlockNesting, Style/GlobalVars, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Layout/LineLength, Lint/RedundantCopDisableDirective
