a = File.open('./input.txt')
input = a.readlines

total_games_to_play = input[0].to_i
game_number = 1
line_number = 1

file = File.new("output.txt", "w")

until game_number > total_games_to_play
  first_row_number = input[line_number].to_i
  second_row_number = input[line_number + 5].to_i
  first_numbers = input[line_number + first_row_number].split(%r{\D})
  second_numbers = input[line_number + 5 + second_row_number].split(%r{\D})
  result = first_numbers.delete_if {|n| !second_numbers.include? n }
  print result
  if result.length == 0
    file.puts "Case ##{game_number}: Volunteer cheated!"
  elsif result.length == 1
    file.puts "Case ##{game_number}: #{result[0]}"
  else
    file.puts "Case ##{game_number}: Bad magician!"
  end

  line_number += 10
  game_number += 1
end
file.close
a.close