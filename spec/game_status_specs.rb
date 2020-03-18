require_relative '../lib/game_status.rb'

RSpec.describe GameStatus do
  let(:status){ GameStatus.new }
  describe '#initialize' do
    it "initialize @score to [0, 0]" do
      expect(status.score).to eql([0, 0])
    end
  end

  describe '#initialize' do
    it "initialize @game_finished to false" do
      expect(status.game_finished).to eql(false)
    end
  end

  describe '#initialize' do
    it "initialize @winner to 0" do
      expect(status.winner).to eql(0)
    end
  end

  describe '#initialize' do
    it "initialize @choosen_option to 0" do
      expect(status.choosen_option).to eql(0)
    end
  end

  describe '#initialize' do
    it "$players_moves variable exist" do
      expect($players_moves).to_not eql(nil)
    end
  end
end