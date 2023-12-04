Game = Struct.new(:id, :red, :green, :blue)
tot = 0
@maxred = 12
@maxgreen = 13
@maxblue = 14
File.open("input", "r") do |f|
    f.each_line do |line|
        possible = true
        game, results = line.split(":")
        curgame = Game.new(game.split(" ")[1], 0, 0, 0)
        results.split(";").each do |hand|
            @red = 0
            @green = 0
            @blue = 0
            hand.split(",").each do |set|
                key = set.split(" ")[1]
                val = set.split(" ")[0]
                instance_variable_set("@" + key, val)
            end
            if @red.to_i > @maxred || @green.to_i > @maxgreen || @blue.to_i > @maxblue
                possible = false
            end
        end
        if possible == true
            tot += curgame.id.to_i
        end
    end
end
puts tot
