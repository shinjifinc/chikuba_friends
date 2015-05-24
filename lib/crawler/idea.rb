require 'open-uri'
require 'bundler'
Bundler.require

binding.pry

# スクレイピング先のURL
url = 'http://www.kayac.com/vision/philosophy'

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

doc = Nokogiri::HTML.parse(html, nil, charset)

h3s = []
ps = []

doc.css("h3").each_with_index do |h3, i|
  h3s[i+1-5] = h3.text if i >= 4
end
doc.css("p").each_with_index do |p, j| #始めが１ずれている
  ps[j-5] = p.text if j >= 5
end

puts h3s.join("\n")
