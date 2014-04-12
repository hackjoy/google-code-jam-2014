a = File.open('./input-test.txt')
input = a.readlines

total_games_to_play = input[0].to_i
game_number = 1

file = File.new("output.txt", "w")

until game_number > total_games_to_play
  game_data = input[game_number].split(%r{\s})
  @production_level = 2.0
  @cookie_farm_cost = game_data[0].to_f
  @cookie_farm_volume = game_data[1].to_f
  @target_cookies = game_data[2].to_f
  @total_cookies = 0.0
  @total_time = 0.0

  def better_to_buy?
    time_with_new_farm = @total_cookies / (@production_level + @cookie_farm_volume)
    time_without_new_farm = (@target_cookies - @total_cookies) / @production_level
    time_with_new_farm < time_without_new_farm
  end

  until @total_cookies >= @target_cookies
    if (@total_cookies >= @cookie_farm_cost) && better_to_buy?
      @total_cookies -= @cookie_farm_cost
      @production_level += @cookie_farm_volume
    end
    @total_cookies += @production_level
    @total_time += 1
  end

  file.puts "Case ##{game_number}: #{@total_time}"
  game_number += 1
end
file.close
a.close