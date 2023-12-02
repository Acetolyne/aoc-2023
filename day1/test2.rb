tot = 0
numbers = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
File.open("input", "r") do |f|
    f.each_line do |line|
        a = ""
        b = ""
        c = ""
        #Get the first number
        numbers.each do |n|
            a = line.scan(/([\d]|[z][e][r][o]|[o][n][e]|[t][w][o]|[t][h][r][e][e]|[f][o][u][r]|[f][i][v][e]|[s][i][x]|[s][e][v][e][n]|[e][i][g][h][t]|[n][i][n][e])/)
        end 
        #puts a[0].join()
        #Getting the second number is not so easy as a string number may start in the previous number
        #advance on step into the string until the end
        for x in 0..line.length() do
            tmpline = line[x..-1]
            #if the substring starts with anything we are looking for then replace the value
            b = tmpline.scan(/^([\d]|[z][e][r][o]|[o][n][e]|[t][w][o]|[t][h][r][e][e]|[f][o][u][r]|[f][i][v][e]|[s][i][x]|[s][e][v][e][n]|[e][i][g][h][t]|[n][i][n][e])/)
            if b.join().to_s.match((/[[:alnum:]]/))
                c = b
            end
        end
        
        if a[0].join().match?(/[[:digit:]]/)
            x = a[0].join()
        else
            x = numbers.find_index(a[0].join())
        end
        if c[-1].join().match?(/[[:digit:]]/)
            y = c[-1].join()
        else
            y = numbers.find_index(c[-1].join())
        end
        z = x.to_s << y.to_s
        tot += z.to_i
    end
end
puts "#{tot}"