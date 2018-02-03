require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './podcast.rb'

class Scraper

    def get_page
      doc = Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))
        binding.pry
      doc.css(".podcastRow").each do |post|
        podcast = Podcast.new
        podcast.name = post.css("h3").text.gsub(/\t/, '').strip
        podcast.rank = post.css(".numberImage").text.gsub(/\t/, '').strip
        podcast.summary = post.css("p").text.strip
        end
      end
    end
