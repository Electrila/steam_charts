class SteamCharts::Scraper

    def num_comma_formatter(num)
        reverse_digits = num.to_s.chars.reverse
        reverse_digits.each_slice(3).map(&:join).join(",").reverse
    end

    def self.scrape_search_options
        page = Nokogiri::HTML(open("https://steamcharts.com"))
        search_options = page.css("div.content h2")
        search_options.each do |option|
            search_option = option.text
            SteamCharts::SearchOption.new(search_option)
        end
    end

    def self.scrape_games(search_option)
        if search_option = "1"
            mechanize = Mechanize.new
            page = mechanize.get("https://steamcharts.com")
            page.at("table#trending-recent tbody").css("tr").each do |game|
                title = game.at("td.game-name.left a").text.strip
                change_24_hrs = game.at("td.gain").text.strip
                current_players = game.at("td.num").text.strip
                SteamCharts::TrendingGame.new(title, search_option, change_24_hrs, current_players)
            end
        end
    end

end