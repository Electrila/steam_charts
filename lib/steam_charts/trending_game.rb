class SteamCharts::TrendingGame

    @@all = []
    attr_accessor :title, :change_24_hrs, :current_players

    def initialize(title, change_24_hrs, current_players)
        @title = title
        @change_24_hrs = change_24_hrs
        @current_players = current_players
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end