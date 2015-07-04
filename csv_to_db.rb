require 'pry'

ARGF.each_with_index do |line, i|
  unless i == 0
    line.strip!
    values = line.split(',')
    puts "PropertyPrice.create :date => '#{values[0]}', :region => '#{values[1]}', :median => '#{values[2]}'"
  end
end