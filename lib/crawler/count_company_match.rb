require 'bundler'
Bundler.require

output = File.read('./data/president_list.csv').split("\n").each do |row_president|
  p row_president if File.read('./data/idea_company.txt').split("\n").select do |row_idea|
    row_president.include? row_idea
  end.any?
end
