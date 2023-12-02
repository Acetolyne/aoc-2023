tot = 0
File.open("input", "r") do |f|
    f.each_line do |line|
        a = line.scan(/\d/).values_at(0, -1)
        tot += a.join.to_i
    end
end
puts "#{tot}"
