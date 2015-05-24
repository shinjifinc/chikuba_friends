require 'bundler'
Bundler.require
require 'json'

base_url = 'http://ja.wikipedia.org/w/api.php?format=json&action=query&list=search&srsearch='

File.read('./president_list.csv').split("\n").each do |row|
  company, president = row.split ','
  uri = URI.parse URI.encode("#{base_url}#{company}+#{president}")
  json = Net::HTTP.get uri
  result = JSON.parse json
  next if result['query']['searchinfo']['totalhits'].zero?
  next if result['query']['search'].select{|v|v['title'] == president}.empty?
  #binding.pry
  p company + ' ' + president
end
