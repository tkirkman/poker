require 'player'
require 'round'
require 'byebug'

class PokerGame
  attr_accessor :name, :num_of_players, :amount

  RANDOM_NAMES = %w[Bob Jake Timmy Gina Bobina Ty Tinley Lexus Mary Rosa Gregy]

  def initialize(name, num_of_players=1, amount=500)
    @name = name
    @num_of_players = num_of_players
  end

  def create_player
    player1 = Player.new(name, amount)
    @players.push(player1)
  end

  def create_other_players
    other_players = (1..num_of_players).map {|player| Player.new(random_name, amount)}
    @players = other_players
  end

  def play
    while true do
       round = Round.new(@players)
       round.first
       round.second
       round.third
       p round.last
       prompt = gets.chomp
       return if prompt = /[Y|y]es/
    end
  end

  private

  def random_name
    num = Random.rand(10)
    RANDOM_NAMES[num]
  end
end

p "WELCOME TO RUBY POKER!"

p "What is your name?"
player_name = gets.chomp

p "How many other players? (Default: 1)"
players = gets.chomp.to_i
players = 1 if players == 0


p "What is the starting amount? (Default: 500)"
amount = gets.chomp.to_i
amount = 500 if amount == 0

game = PokerGame.new(player_name, players, amount)
game.create_other_players
game.create_player
game.play
