10.times { |i| puts "scott #{i+1}" }

max = 10
pick = rand(max+1)
guess = max+1
while guess != pick
    guess_str = gets
    guess = guess_str.to_i
    puts 'lower' if guess > pick
    puts 'higher' if guess < pick
end
puts 'you got it'
