class SteamCharts::CLI
    def call
        puts "\nWelcome to Steam Charts!\n"
        get_search_options
        list_search_options
        get_user_choice
    end

    def get_search_options
        @search_options = ["Trending", "Top Games by Current Players", "Top Records"]
    end

    def list_search_options
        puts "Please choose an option"
        @search_options.each.with_index(1) do |option, index |
            puts "#{index}. #{option}"
        end
    end

    def get_user_choice
        user_choice = gets.strip.to_i
        display_games_for(user_choice) if valid_choice(user_choice, @search_options)
    end

    def valid_choice(input, data)
        input <= data.length && input > 0
    end

    def display_games_for(user_choice)
        choice = @search_options[user_choice - 1]
        puts "Here are the current results for '#{choice}':\n"
        if choice == "Trending"
            SteamCharts::Scraper.scrape_trending_games
            SteamCharts::TrendingGame.all.each.with_index(1) do |game, index|
                puts "#{index}. #{game.title} | 24-hour Change: #{game.change_24_hrs} | Current Players: #{game.current_players}"
            end
        elsif choice == "Top Games by Current Players"
            SteamCharts::Scraper.scrape_top_games
            SteamCharts::TopGame.all.each.with_index(1) do |game, index|
                puts "#{index}. #{game.title} | Current Players: #{game.current_players} | Peak Players: #{game.peak_players} | Hours Played: #{game.hours_played}"
            end
        elsif choice == "Top Records"
            SteamCharts::Scraper.scrape_top_records
            SteamCharts::TopRecord.all.each.with_index(1) do |game, index|
                puts "#{index}. #{game.title} | Peak Players: #{game.peak_players} | Time: #{game.time}"
            end
        end
    end

end