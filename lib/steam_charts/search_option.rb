class SteamCharts::SearchOption

    @@all = []
    attr_accessor :search_term

    def initialize(search_term)
        @search_term = search_term
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end