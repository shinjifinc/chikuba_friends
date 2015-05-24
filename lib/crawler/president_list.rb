require 'bundler'
require 'open-uri'
Bundler.require

base_url = 'http://shachomeikan.jp/presidents/search/page:'

def parse_page(url)
  doc = Nokogiri::HTML.parse(open(url) { |f| f.read })
  doc.css('div#listAreaW p.txt a').map { |v| [v.children[0].text, v.children[2].text] }
end

1.upto(5) do |i|
  parse_page(base_url + i.to_s).each do |v|
    company, president = v
    puts "#{company},#{president}\n"
  end
end
