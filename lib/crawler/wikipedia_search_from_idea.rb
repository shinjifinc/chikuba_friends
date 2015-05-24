require 'bundler'
Bundler.require
require 'json'

base_url = 'http://ja.wikipedia.org/w/api.php?format=json&action=query&list=search&srsearch='

File.read('./data/idea_company.txt').split("\n").each do |company|
  uri = URI.parse URI.encode("#{base_url}#{company}")
  json = Net::HTTP.get uri
  result = JSON.parse json
  next if result['query']['searchinfo']['totalhits'].zero?
  #result['query']['search'].each do |v| 
  #  presidents << v['title'] if v['snippet'] =~ /会長|社長|取締役|創業者/
  #end
  p company + ' ' + result['query']['search'].map{|v|v['title']}.join(',')
end
