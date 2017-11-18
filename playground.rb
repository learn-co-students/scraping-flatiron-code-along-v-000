require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open("http://games.espn.com/ffl/leaders?slotCategoryId=0&scoringPeriodId=1&seasonId=2017"))
rows = doc.css('tr')
column_names = rows.shift.css('th').map(&:text)
week = column_names[1]

text_all_rows = rows.map do |row|
  row.css('td').map(&:text)
end

indexes_to_delete = [0, 1]

stat_rows = text_all_rows.reject.with_index { |e, i| indexes_to_delete.include? i }
puts week

stat_rows.each do |row|
    puts "#{row[0]}: #{row[-1]}"
end
