class SteamCharts::Scraper

    def self.num_comma_formatter(num)
        reverse_digits = num.to_s.chars.reverse
        reverse_digits.each_slice(3).map(&:join).join(",").reverse
    end

    def self.scrape_trending_games
        mechanize = Mechanize.new
        page = mechanize.get("https://steamcharts.com")
        page.at("table#trending-recent tbody").css("tr").each do |game|
            title = game.at("td.game-name.left a").text.strip
            change_24_hrs = game.at("td.gain").text.strip
            current_players = num_comma_formatter(game.at("td.num").text.strip)
            SteamCharts::TrendingGame.new(title, change_24_hrs, current_players)
        end
    end

    def self.scrape_top_games
        mechanize = Mechanize.new
        page = mechanize.get("https://steamcharts.com")
        page.at("table#top-games tbody").css("tr").each do |game|
            title = game.at("td.game-name.left a").text.strip
            current_players = num_comma_formatter(game.at("td.num").text.strip)
            peak_players = num_comma_formatter(game.at("td.num.period-col.peak-concurrent").text.strip)
            hours_played = num_comma_formatter(game.at("td.num.period-col.player-hours").text.strip)
            SteamCharts::TopGame.new(title, current_players, peak_players, hours_played)
        end
    end

    def self.scrape_top_records
        mechanize = Mechanize.new
        page = mechanize.get("https://steamcharts.com")
        page.at("table#toppeaks tbody").css("tr").each do |game|
            title = game.at("td.game-name.left a").text.strip
            peak_players = num_comma_formatter(game.at("td.num").text.strip)
            date = DateTime.parse(game.at("td.num").next_element.text.strip).strftime("%b %Y")
            SteamCharts::TopRecord.new(title, peak_players, date)
        end
    end
    
end