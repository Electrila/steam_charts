class SteamCharts::TopGame

    @@all = []
    attr_accessor :title, :current_players, :peak_players, :hours_played

    def initialize(title, current_players, peak_players, hours_played)
        @title = title
        @current_players = current_players
        @peak_players = peak_players
        @hours_played = hours_played
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end