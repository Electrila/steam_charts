require_relative "steam_charts/version"
require_relative "steam_charts/cli"
require_relative "steam_charts/scraper"
require_relative "steam_charts/trending_game"
require_relative "steam_charts/top_game"
require_relative "steam_charts/top_record"

require "pry"
require "open-uri"
require "nokogiri"
require "mechanize"
require "date"

module SteamCharts
  class Error < StandardError; end
end
