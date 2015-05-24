require 'bundler'
Bundler.require
require 'json'

base_url = 'http://180.42.27.182/relevance_evaluator/api/leaningResult'
category_id = 610

2.upto(33) do |i|
  teacher_id = i
  p (i - 1)
  params = { 'teacherId' => teacher_id, 'categoryId' => category_id }
  json = HTTParty.post(base_url, { body: params.to_json, headers: {'Content-Type' => 'application/json'} }).body
  result = JSON.parse json
  result['documents'].each do |row|
    p row
  end
end
