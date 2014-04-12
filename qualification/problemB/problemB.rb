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
  @current_cookies = 0.0
  @total_time = 0.0

  def better_to_buy?
    time_with_new_farm = @target_cookies / (@production_level + @cookie_farm_volume)
    time_without_new_farm = (@target_cookies - @current_cookies) / @production_level
    time_with_new_farm < time_without_new_farm
  end

  def buy_cookie_farm
    @current_cookies -= @cookie_farm_cost
    @production_level += @cookie_farm_volume
  end

  def generate_target_cookies
    @total_time += (@target_cookies - @current_cookies) / @production_level
    @current_cookies = @target_cookies
  end

  def generate_cookies_for_new_farm
    @total_time += (@cookie_farm_cost - @current_cookies) / @production_level
    @current_cookies += @cookie_farm_cost
  end

  until @current_cookies >= @target_cookies
    if @current_cookies < @cookie_farm_cost ; generate_cookies_for_new_farm
      better_to_buy? ? buy_cookie_farm : generate_target_cookies
    end
  end

  file.puts "Case ##{game_number}: #{@total_time}"
  game_number += 1
end
file.close
a.close