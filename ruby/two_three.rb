filename = ARGV[0]
regex = ARGV[1]

File.new(filename).each{|line| puts "#{$.}: #{line}" if line =~ /#{regex}/}
