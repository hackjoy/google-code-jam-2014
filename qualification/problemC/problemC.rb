a = File.open('./input-test.txt')
input = a.readlines

total_games_to_play = input[0].to_i
game_number = 1

file = File.new("output.txt", "w")

until game_number > total_games_to_play
  game_data = input[game_number].split(%r{\s})
  @yAxis = game_data[0].to_i
  @xAxis = game_data[1].to_i
  @mines = game_data[2].to_i

  # check if combination of the input that will let one click win?
  # if yes
    file.puts # the game board
  # if no
    file.puts "Case ##{game_number}: #{"Impossible"}"

  game_number += 1
end
file.close
a.close