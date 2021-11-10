class SteamCharts::Scraper

    def num_comma_formatter(num)
        reverse_digits = num.to_s.chars.reverse
        reverse_digits.each_slice(3).map(&:join).join(",").reverse
    end

    def self.scrape_search_options
        page = Nokogiri::HTML(open("https://steamcharts.com"))
        search_options = page.css("div.content h2")
        search_options.each do |option|
            search_term = option.text
            SteamCharts::SearchOption.new(search_term)
        end
    end

end