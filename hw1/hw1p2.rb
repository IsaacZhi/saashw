class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game != nil
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless ( game[0] != nil && game[1] != nil)
  raise NoSuchStrategyError unless ( game[0].length == 2 && game[1].length == 2)
  raise NoSuchStrategyError unless ( game[0][1].length == 1 && game[1][1].length == 1)
  raise NoSuchStrategyError unless ( game[0][1].upcase.match(/^[RPS]$/) && game[1][1].upcase.match(/^[RPS]$/))

  if ( game[0][1].upcase == game[1][1].upcase )
    return game[0]
  end

  strategy = ["RS", "SP", "PR"]
  zero_vs_one = game[0][1].upcase + game[1][1].upcase
#one_vs_zero = game[1][1] + game[0][1]
  if ( strategy.include? zero_vs_one)
    return game[0]
  else
    return game[1]
  end
end

=begin
p ["Dave", "S"] == rps_game_winner([["Armando", "P"], ["Dave", "S"]])
#p rps_game_winner(nil)
#p rps_game_winner([])
p ["Armando", "s"] == rps_game_winner([['Armando', 's'], ["Dave", "S"]])
p ["Armando", "P"] == rps_game_winner([["Armando", "P"], ["Dave", "R"]])
=end


def rps_tournament_winner(tournament)
  if ( tournament[0][1].class == String )
    return rps_game_winner(tournament)
  else
    first = rps_tournament_winner(tournament[0])
    second = rps_tournament_winner(tournament[1])
    return rps_game_winner([first, second])
  end
end

=begin
tour =
[
  [
    [ ["Armando", "P"], ["Dave", "S"] ],
    [ ["Richard", "R"], ["Michael", "S"] ],
  ],
  [
    [ ["Allen", "S"], ["Omer", "P"] ],
    [ ["David E.", "R"], ["Richard X.", "P"] ]
  ]
]
p rps_tournament_winner(tour)
=end

