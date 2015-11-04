require 'round'

player1 = Player.new('Bob', 200)
player2 = Player.new('Jake', 400)
player3 = Player.new('Rosalinda', 300)
players = [player1, player2, player3]
round = Round.new(players)
round.first
round.second
round.third
round.last
