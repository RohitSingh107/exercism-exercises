import re
def count_words(sentence):
    word_list = []
    sentence = sentence.replace(",", " ").replace("_", " ")
    for i in sentence.lower().split():
        p = "".join(re.split("[^a-zA-Z0-9']*", i))
        word_list.append(p.lstrip("'").rstrip("'"))
    return {i : word_list.count(i) for i in word_list}
