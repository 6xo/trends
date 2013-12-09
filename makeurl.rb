require 'net/http'
require 'uri'

def open(url)
  Net::HTTP.get(URI.parse(url))
end
$keywords.each do |keyword|
  puts keyword
  url_es = "http://www.google.com/trends/fetchComponent?hl=ja&q=#{$base_keyword},+#{keyword}&geo=JP&date=4/2013+3m&cmpt=q&content=1&cid=TIMESERIES_GRAPH_0&export=5&w=500&h=330"
  $url = URI.escape(url_es)
  puts $url
  File.open("makeurl.txt","a") do |io|
    p io.puts $url
    p io.puts ""
  end
end