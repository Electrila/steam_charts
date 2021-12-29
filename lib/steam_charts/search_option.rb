class SteamCharts::SearchOption

    @@all = []
    attr_accessor :search_option, :games

    def initialize(search_option)
        @search_option = search_option
        @games = []
        save
    end

    def self.all
        SteamCharts::Scraper.scrape_search_options if @@all.empty?
        @@all
    end

    def get_games
        SteamCharts::Scraper.scrape_games(self) if @games.empty?
    end

    def save
        @@all << self
    end

end