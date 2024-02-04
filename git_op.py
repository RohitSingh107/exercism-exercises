
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

    for lang in os.listdir(cur_dir):
        if lang == 'shell.nix' or lang == 'git_op.py' or lang == '.git' or lang == '.gitignore':
            continue
        lang_dir = os.path.join(cur_dir, lang)
        for exercise in os.listdir(lang_dir):
            exercise_dir = os.path.join(lang_dir, exercise)
            # print(f"e is {exercise}, ed is {exercise_dir}")

            if lang == 'haskell':
                for ef in os.listdir(exercise_dir + '/src'):
                    f = os.path.join(exercise_dir, 'src/' + ef)
                    if os.path.isfile(f):
                        repo.git.add(f)
                        # print(f)
                    else:
                        print(f"{f} file does not exist")

            if lang == 'python':

                for ef in os.listdir(exercise_dir):
                    if ef.endswith('.py') and not 'test' in ef:
                        exercise_file_path = os.path.join(exercise_dir, ef)
                        # print(exercise_file_path)
                        if os.path.isfile(exercise_file_path):
                            repo.git.add(exercise_file_path)
                        else:
                            print(f"{exercise_file_path} file does not exist")
                    

            if lang == 'bash':
                for ef in os.listdir(exercise_dir):
                    if ef.endswith('.sh'):
                        exercise_file_path = os.path.join(exercise_dir, ef)
                        print(exercise_file_path)
                        if os.path.isfile(exercise_file_path):
                            repo.git.add(exercise_file_path)
                        else:
                            print(f"{exercise_file_path} file does not exist")

    # print(repo.git.status())
    print("Done.")


if __name__ == '__main__':
    main()
