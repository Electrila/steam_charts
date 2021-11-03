class SteamCharts::CLI
    def call
        puts "Welcome to Steam Charts!"
        get_search_options
        get_user_selection
        # get_games_from_user_selection
        # list_games
    end

    def get_search_options
        @search_options = ["Search by Trending Games", "Search by Top 10 Games", "Search by Top Records", "Search by All Top Games"]
    end

    def get_user_selection
        @search_options.each.with_index(1) do |option, index |
            puts "#{index}. #{option}"
        end
    end

end