def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b) or ((strand_a is "" or strand_b is "") and not strand_a == strand_b):
        raise ValueError("Length are not equal or empty string")
    else:
        dist = 0
        for index, item in enumerate(strand_a):
            if strand_a[index] != strand_b[index]:
                dist += 1
        return dist

