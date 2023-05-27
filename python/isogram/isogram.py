def is_isogram(string):
    string = string.replace(" ", "").replace("-", "")
    return len((set(string.lower())))== len(string.lower())
