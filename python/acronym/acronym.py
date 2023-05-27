import string
def abbreviate(words):
    words = words.replace("-", " ")
    words = words.translate(str.maketrans('', '', string.punctuation))

    acr = ""
    for word in words.split():
        acr = acr + word[0].title()
        # print(word)
    return acr

# print(abbreviate("Portable Network Graphics"))
