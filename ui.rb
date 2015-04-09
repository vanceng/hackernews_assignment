require 'nokogiri'
require_relative 'post'
require_relative 'comment'
require_relative 'webscraper'
require_relative 'command_options'
require 'open-uri'
require 'colorize'

user_website = ARGV[0]
scraper = WebScraper.new(user_website)
puts scraper.create_post
CommandOptions.ask_comments(scraper)








