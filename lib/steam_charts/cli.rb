class SteamCharts::CLI
    def call
        puts "\nWelcome to Steam Charts!\n"
        get_search_options
        list_search_options
        get_user_choice
    end

    def get_search_options
        @search_options = ["Search by Trending Games", "Search by Top 10 Games", "Search by Top Records", "Search by All Top Games"]
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
        puts "Here are the current results for #{choice}:\n"
        puts "games"
    end

end