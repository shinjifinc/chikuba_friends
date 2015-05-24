require 'bundler'
Bundler.require
require 'json'

base_url = 'http://180.42.27.182/document_analyzer/api/document'
category_id = 610

File.read('./wikipedia_president.txt').split("\n").each.with_index(1) do |row, i|
  id, category_id, contents = row.split "\t"
  params = { 'documentId' => id, 'categoryId' => category_id, 'text' => contents }
  #binding.pry
  json = HTTParty.post(base_url, { body: params.to_json, headers: {'Content-Type' => 'application/json'} }).body
  result = JSON.parse json
  p result
end
