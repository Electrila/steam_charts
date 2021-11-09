class SteamCharts::Scraper

    def scrape_search_options
        mechanize = Mechanize.new
        page = mechanize.get("https://steamcharts.com")
    end

end