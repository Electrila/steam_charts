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
        if valid_choice(user_choice, @search_options)
            puts "valid"
        else
            puts "invalid"
        end
    end

    def valid_choice(input, data)
        input <= data.length && input > 0
    end

end