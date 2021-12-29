class SteamCharts::TopRecord

    @@all = []
    attr_accessor :title, :peak_players, :time

    def initialize(title, peak_players, time)
        @title = title
        @peak_players = peak_players
        @time = time
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end