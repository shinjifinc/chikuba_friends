require 'bundler'
Bundler.require
require 'json'

base_url = 'http://180.42.27.182/relevance_evaluator/api/teacher'
category_id = 610

#File.read('./teacher.txt').split("\n").each do |row|
  #teacher_id, documents, category_id = row.split ' '
2.upto(33) do |i|
  teacher_id = i
  documents = i - 1
  #params = { 'teacherId' => teacher_id, 'categoryId' => category_id, 'documents' => { 'relevant' => documents.split(',') } }
  params = { 'teacherId' => teacher_id, 'categoryId' => category_id, 'documents' => { 'relevant' => [documents] } }
  #binding.pry
  json = HTTParty.post(base_url, { body: params.to_json, headers: {'Content-Type' => 'application/json'} }).body
  result = JSON.parse json
  p result
end
