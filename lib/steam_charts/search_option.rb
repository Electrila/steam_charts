class SteamCharts::SearchOption

    @@all = []
    attr_accessor :search_term

    def initialize(search_term)
        @search_term = search_term
        save
    end

    def self.all
        SteamCharts::Scraper.scrape_search_options if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end

end