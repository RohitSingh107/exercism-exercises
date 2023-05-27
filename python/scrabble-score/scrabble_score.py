def score(word):

    score = 0
    point_table = {
        1 : ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        2 : ["D", "G"],
        3 : ["B", "C", "M", "P"],
        4 : ["F", "H", "V", "W", "Y"],
        5 : ["K"],
        8 : ["J", "X"],
        10 : ["Q", "Z"]
    }

    for l in word.upper():
        for k in point_table.keys():
            if l in point_table[k]:
                score += k
        
    return score
