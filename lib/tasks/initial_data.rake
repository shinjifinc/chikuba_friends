namespace :initial_data do
  task import: :environment do
    File.read('./data/company_with_idea.tsv').split("\n").each do |row|
      company, idea = row.split "\t"
      CompanyIdea.create! company_name: company, idea: idea
    end
  end
end
