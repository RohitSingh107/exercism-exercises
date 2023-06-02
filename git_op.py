
from git import Repo


import os

t = '''
./python/currency-exchange
./python/inventory-management
./python/ghost-gobble-arcade-game
./python/tisbury-treasure-hunt
./python/making-the-grade
./python/meltdown-mitigation
./python/card-games
./python/chaitanas-colossal-coaster
./python/little-sisters-essay
./python/little-sisters-vocab
./python/guidos-gorgeous-lasagna
./python/cater-waiter
'''
  
python_exceptions = set(t.split())


def main():

    # cur_dir = os.getcwd()
    # print(t.split())
    cur_dir = '.'

    repo = Repo('.')

    for d in os.listdir(cur_dir):
        if d == 'shell.nix' or d == 'git_op.py' or d == '.git':
            continue
        # print(d)
        cdir = os.path.join(cur_dir, d)
        for e in os.listdir(cdir):
            ed = os.path.join(cdir, e)

            if d == 'haskell':
                for ef in os.listdir(ed + '/src'):
                    f = os.path.join(ed, 'src/' + ef)
                    if os.path.isfile(f):
                        repo.git.add(f)
                        # print(f)
                    else:
                        print(f"{f} file does not exist")

            if d == 'python':
                if ed in python_exceptions:
                    continue
                # print(f"ed is {ed}")
                f = os.path.join(ed, e + '.py')
                if not os.path.isfile(f):
                    f = os.path.join(ed, e.replace('-', '_') + '.py')

                if os.path.isfile(f):
                    repo.git.add(f)
                    # print(f)
                else:
                    print(f"{f} file does not exist")

            if d == 'bash':
                f = os.path.join(ed, e + '.py')
                if not os.path.isfile(f):
                    f = os.path.join(ed, e.replace('-', '_') + '.sh')

                if os.path.isfile(f):
                    repo.git.add(f)
                    # print(f)
                else:
                    print(f"{f} file does not exist")

    # print(repo.git.status())
    print("Done.")


if __name__ == '__main__':
    main()
