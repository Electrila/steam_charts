require_relative "steam_charts/version"
require_relative "steam_charts/cli"
require_relative "steam_charts/search_option"
require_relative "steam_charts/scraper"

require "pry"
require "open-uri"
require "nokogiri"
require "mechanize"

module SteamCharts
  class Error < StandardError; end
  # Your code goes here...
end
