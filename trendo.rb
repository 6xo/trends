page_content = <<"EOS"
#ここにページのソース
EOS
#puts page_content
$sum1 = 0
$sum2 = 0
raw_data_array = page_content.split("rows\":") [1].split("var htmlChart").first
split_raw = raw_data_array.split("],")
#puts split_raw
split_raw.each do |sr|
  source = sr.split("Date(")[1].split(",")
  num1 = source[5]
  num2 = source[9]
  #puts "#{num1}" + "#{num2}"
  $sum1 = $sum1 + source[5].to_i
  $sum2 = $sum2 + source[9].to_i
end
rate = $sum2.to_f/$sum1
puts "#{$sum1}" + "," + "#{$sum2}" + "#{rate}"
File.open("result.txt","a") do |io|
  p io.puts "#{$sum1}" + "," + "#{$sum2}" + "," + "#{rate}"
end