class SteamCharts::CLI
    def call
        puts "\nWelcome to Steam Charts!\n"
        get_search_options
        list_search_options
        get_user_choice
    end

    def get_search_options
        @search_options = SteamCharts::SearchOption.all
    end

    def list_search_options
        puts "Please choose an option"
        @search_options.each.with_index(1) do |option, index |
            puts "#{index}. #{option.search_option}"
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
        puts choice.text
        # choice.get_games
        # puts "Here are the current results for '#{choice.search_option}':\n"
        # choice.games.each.with_index(1) do |game, index|
        #     puts "#{index}. #{game.title}"
        # end
    end

end