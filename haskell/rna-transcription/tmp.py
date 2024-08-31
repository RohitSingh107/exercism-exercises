
convert this python function to haskell

def f(s : str):

    ans = ""
    for c in s:
        if c == 'G':
            ans += 'C'
        elif c == 'C':
            ans += 'G'
        elif c == 'T':
            ans += 'A'
        elif c == 'T':
            ans += 'U'
        else:
            return c
    return ans
