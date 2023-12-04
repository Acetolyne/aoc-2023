AllArr = []
AllConnectedParts = []
tot = 0
File.open("input", "r") do |f|
    f.each_line do |line|
        curarr = line.strip().chars
        AllArr.append(curarr)
    end
end

AllArr.each_with_index do |line, r|
    line.each_with_index do |char, i|
        if char == "*"
            AllConnectedParts.clear
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
            if i == (line.length()-1)
                indexend = Integer(i)
            else
                indexend = Integer(i)+1
            end
            rowrange = rowstart..rowend
            indexrange = indexstart..indexend
            tmpind = indexstart
            #check the surrounding areas for digits
            rowrange.each do |rr|
                tmpind = indexstart
                indexrange.each do |ir|
                    if ir >= tmpind
                        char = AllArr[rr][ir]
                        if !(Integer(char) rescue false) == false
                            partnum = ""
                            tmpind = ir
                            #Move backward to end of line
                            while !(Integer(AllArr[rr][tmpind-1]) rescue false) == false
                                tmpind -= 1
                            end
                            #Iterate until end of number adding digits
                            while !(Integer(AllArr[rr][tmpind]) rescue false) == false
                                partnum += String(AllArr[rr][tmpind])
                                tmpind += 1
                            end
                            #ir = tmpind
                            AllConnectedParts.append(partnum)
                        end
                    end
                    #puts "#{r}:#{i}"
                end
            end
            puts "#{AllConnectedParts}"
            if AllConnectedParts.length() == 2
                tot += Integer(AllConnectedParts[0]) * Integer(AllConnectedParts[1])
            end
        end
    end
end
puts tot