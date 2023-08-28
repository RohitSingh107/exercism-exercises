#
#
# # find the issues and bugs in this python code

from typing import List
from collections import deque
import sys

# def find_fewest_coins(coins : List[int], target) -> List[int | float]:
#
#     if target < 0:
#         raise ValueError("target can't be negative")
#
#     dp = [float('inf') for _ in range(target+1)]
#
#     dp[0] = 0
#     
#     for i in range(1, target+1):
#         for coin in coins:
#             if i - coin >= 0:
#                 dp[i] = min(dp[i], dp[i- coin] + 1)
#
#     if dp[target] == float('inf'):
#         raise ValueError("can't make target with given coins")
#
#     ans = deque()
#
#     current = target
#
#     while current > 0:
#         for coin in coins:
#             if current - coin >= 0 and dp[current - coin] == dp[current] - 1:
#                 ans.append(coin)
#                 current -= coin
#                 break
#     return list(ans)
def find_fewest_coins(coins : List[int], target) -> List[int | float]:

    if target < 0:
        raise ValueError("target can't be negative")


    dp = [[-1 for _ in range(len(coins) +1)] for _ in range(target +1)]
    ans = f(target, len(coins) -1, coins, dp) 

    if ans is None:
        raise ValueError("can't make target with given coins")
    else:
        return ans


# correct this code
def f(target : int, c : int, coins : List[int], dp) -> List[int] | None:
    # print(f"target is {target}")

    if target == 0:
        return []
    if target < 0 or c < 0:
        return None

    if dp[target][c] != -1:
        return dp[target][c]

    take = f(target - coins[c], c, coins, dp)

    not_take = f(target, c -1, coins, dp)

    # print(f"target is {target}, c is {c}")
    # print(not_take, take)

    if take is None and not_take is None:
        dp[target][c] = None
        return dp[target][c]
    elif take is None and not_take is not None:
        dp[target][c] = not_take
        return dp[target][c]
    elif take is not None and not_take is None:
        dp[target][c] =  take + [coins[c]]
        return dp[target][c]
    elif take is not None and not_take is not None and  len(not_take) > len(take) + 1:
        dp[target][c] =  take + [coins[c]]
        return dp[target][c]
    else:
        dp[target][c] =  not_take
        return dp[target][c]



#
# target = 40
# coins = [1, 5, 10, 25, 100]

# target = 23
# coins = [1, 4, 15, 20, 50]

# target = 999
# coins = [1, 2, 5, 10, 20, 50, 100]

# target = 3
# coins = [5,10]

# target = 27
# coins = [4,5]

#
# print(find_fewest_coins(coins, target))
# print(f(target, len(coins) - 1, coins, dp))
#




