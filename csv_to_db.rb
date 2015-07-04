require 'pry'

ARGF.each_with_index do |line, i|
  unless i == 0
    line.strip!
    values = line.split(',')

    gender = values[0]
    state = values[1]
    age = values[2]
    average = values[3]

    matches = age.match(/(Under (?<max>18)|(?<min>\d+) \- (?<max>\d+)|(?<min>75) and over)/)
    puts "min: #{matches['min']} max: #{matches['max']}"
  end
end