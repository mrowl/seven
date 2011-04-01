a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

my_str = []
a.each do |val|
    my_str.push(val)
    if my_str.length == 4
        p my_str
        my_str = []
    end
end

a.each_slice(4) {|a| p a}
