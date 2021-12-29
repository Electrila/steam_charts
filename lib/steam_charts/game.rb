class SteamCharts::TrendingGame

    @@all = []
    attr_accessor :title, :search_option, :change_24_hrs, :current_players

    def initialize(title, search_option, change_24_hrs, current_players)
        @title = title
        @search_option = search_option
        @change_24_hrs = change_24_hrs
        @current_players = current_players
        add_to_games
        save
    end

    def self.all
        @@all
    end

    def add_to_games
        @search_option.games << self
    end

    def save
        @@all << self
    end

end