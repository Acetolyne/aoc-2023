Game = Struct.new(:id, :red, :green, :blue)
tot = 0
File.open("input", "r") do |f|
    f.each_line do |line|
        @red = 0
        @green = 0
        @blue = 0
        possible = true
        game, results = line.split(":")
        curgame = Game.new(game.split(" ")[1], 0, 0, 0)
        results.split(";").each do |hand|
            
            hand.split(",").each do |set|
                key = set.split(" ")[1]
                val = set.split(" ")[0]
                if instance_variable_get("@" + key).to_i < val.to_i
                    instance_variable_set("@" + key, val)
                end
            end
            # if @red.to_i > @maxred || @green.to_i > @maxgreen || @blue.to_i > @maxblue
            #     possible = false
            # end
        end
        tmp = @red.to_i * @green.to_i * @blue.to_i
        tot += tmp
        # if possible == true
        #     tot += curgame.id.to_i
        # end
    end
end
puts tot
