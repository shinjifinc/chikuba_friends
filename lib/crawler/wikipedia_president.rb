require 'bundler'
Bundler.require
require 'json'

base_url = 'http://ja.wikipedia.org/w/api.php?format=json&action=query&prop=revisions&rvprop=content&titles='
category_id = 610

File.read('./wikipedia_search.txt').split("\n").each.with_index(1) do |row, i|
  company, president = row.split ' '
  uri = URI.parse URI.encode("#{base_url}#{president}")
  json = Net::HTTP.get uri
  result = JSON.parse json
  #binding.pry
  page_id = result['query']['pages'].keys[0]
  puts "#{i}\t#{category_id}\t#{result['query']['pages'][page_id]['revisions'][0]['*'].gsub(/\n/,'')}\n"
end
