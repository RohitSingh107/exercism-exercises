
from git import Repo
#
#
#

import os
from collections import deque
from typing import Deque

def main():

    # cur_dir = os.getcwd()
    cur_dir = '.'

    repo = Repo('.')

    for d in os.listdir(cur_dir):
        if d == 'shell.nix' or d == 'git_op.py' or d == '.git':
            continue
        print(d)
        cdir = os.path.join(cur_dir, d);
        for e in os.listdir(cdir):
            ed = os.path.join(cdir, e)

            if d == 'haskell':
                for ef in os.listdir(ed + '/src'):
                    f = os.path.join(ed, 'src/' + ef)
                    if os.path.isfile(f):
                        repo.git.add(f)
                        print(f)
                    else:
                        print("This file does not exist")

            if d == 'python':
                f = os.path.join(ed, e + '.py')
                if not os.path.isfile(f):
                    f = os.path.join(ed, e.replace('-', '_') + '.py')

                if os.path.isfile(f):
                    repo.git.add(f)
                    print(f)
                else:
                    print("This file does not exist")

    print(repo.git.status())
                


if __name__ == '__main__':
    main()





