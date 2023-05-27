""" Song from numbers"""
def convert(number):
    raindrops = {3: "Pling", 5: "Plang", 7:"Plong"}
    return "".join([s for f, s in raindrops.items() if number % f is 0] or str(number))
