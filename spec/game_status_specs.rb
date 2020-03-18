require_relative '../lib/game_status.rb'

RSpec.describe GameStatus do
  let(:status){ GameStatus.new }
  describe '#initialize' do
    it "initialize @score to [0, 0]" do
      expect(status.score).to eql([0, 0])
    end

    it "initialize @game_finished to false" do
      expect(status.game_finished).to eql(false)
    end

    it "initialize @winner to 0" do
      expect(status.winner).to eql(0)
    end

    it "initialize @choosen_option to 0" do
      expect(status.choosen_option).to eql(0)
    end

    it "$players_moves variable exist" do
      expect($players_moves).to_not eql(nil)
    end
  end

  describe '#update_status' do
    it "Player 1 win if he fill ligne 1" do
      $players_moves[0][0] = 1
      $players_moves[0][1] = 1
      $players_moves[0][2] = 1
      status.update_status
      expect(status.winner).to eql(1)
    end
    it "Player 1 win if he fill ligne 1" do
      $players_moves[0][0] = 1
      $players_moves[0][1] = 1
      $players_moves[0][2] = 1
      score = status.score.dup
      status.update_status
      expect(status.score[0]).to eql(score[0] + 1)
    end
  end
end