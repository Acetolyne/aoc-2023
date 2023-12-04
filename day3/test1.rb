AllArr = []
curarr = []
tot = 0
File.open("input", "r") do |f|
    f.each_line do |line|
        curarr = line.strip().chars
        AllArr.append(curarr)
    end
end
AllArr.each_with_index do |arr, r|
    ispart = false
    partnum = ""
    arr.each_with_index do |c, i|
        begin
            Integer(c)
            partnum += c
            if r == 0
                rowstart = 0
            else
                rowstart = Integer(r)-1
            end
            if r == (AllArr.length()-1)
                rowend = r
            else
                rowend = Integer(r)+1
            end
            if i == 0
                indexstart = Integer(i)
            else
                indexstart = Integer(i)-1
            end
            if i == (arr.length()-1)
                indexend = Integer(i)
            else
                indexend = Integer(i)+1
            end
            rowrange = rowstart..rowend
            indexrange = indexstart..indexend
                rowrange.each do |rr|
                    indexrange.each do |ir|
                        cur = AllArr[rr][ir]
                        if (Integer(cur) rescue false) == false && String(cur) != "."
                            ispart = true
                            ir += 1
                        end
                    end
                end
        rescue
            if ispart == true
                puts "ADDING #{partnum}"
                tot += Integer(partnum)
            end
            partnum = ""
            ispart = false
            next()
        end
    end
    if ispart == true
        puts "ADDING #{partnum}"
        tot += Integer(partnum)
    end
    partnum = ""
    ispart = false
end
puts tot