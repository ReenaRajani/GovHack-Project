require 'pry'

ARGF.each_with_index do |line, i|
  unless i == 0
    line.strip!
    values = line.split(',')

    gender = values[0]
    state = values[1]
    age = values[2]
    age_min = 0
    age_max = 200
    average = values[3]

    matches = age.match(/Under (?<max>18)/)
    if matches
      age_max = 17
    end

    matches = age.match(/(?<min>\d+) \- (?<max>\d+)/)
    if matches
      age_min = matches['min']
      age_max = matches['max']
    end

    matches = age.match(/(?<min>75) and over/)
    if matches
      age_min = matches['min']
    end

    puts "Income.create :gender => '#{gender}', :state => '#{state}', :age_min => '#{age_min}', :age_max => '#{age_max}', :average => '#{average}'"
  end
end