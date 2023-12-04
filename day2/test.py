file = open("input", "r")

f = file.read()
lines = f.split("\n")
tot = 0

for line in lines:
    lineisvalid = True
    a = line.split(":")
    id = a[0].split(" ")[1]
    hands = a[1].split(";")
    for hand in hands:
        b = hand.split(",")
        for values in b:
            print(values)
            x = values.strip().split(" ")
            # value = b[0]
            # key = b[1]
            print(x[0])
            print(x[1])
            if x[1] == "red":
                if int(x[0]) > 12:
                    lineisvalid = False
            if x[1] == "green":
                if int(x[0]) > 13:
                    lineisvalid = False
            if x[1] == "blue":
                if int(x[0]) > 14:
                    lineisvalid = False
    if lineisvalid:
        tot += int(id)
        str(1)
print(tot)
        
                    


