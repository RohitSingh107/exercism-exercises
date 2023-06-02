""" Card Game """
def get_rounds(number):
    """

     :param number: int - current round number.
     :return: list - current round and the two that follow.
    """
    return [
        number,
        number+1,
        number+2
    ]
def concatenate_rounds(rounds_1, rounds_2):
    """

    :param rounds_1: list - first rounds played.
    :param rounds_2: list - second set of rounds played.
    :return: list - all rounds played.
    """
    return list(rounds_1 + rounds_2)
def list_contains_round(rounds, number):
    """

    :param rounds: list - rounds played.
    :param number: int - round number.
    :return:  bool - was the round played?
    """
    return bool(number in rounds)
def card_average(hand):
    """

    :param hand: list - cards in hand.
    :return:  float - average value of the cards in the hand.
    """
    total = 0
    for i in hand:
        total = total + i
    return total/ (len(hand))
def approx_average_is_average(hand):
    """

    :param hand: list - cards in hand.
    :return: bool - is approximate average the same as true average?
    """
    median = hand[ int( (len( hand ) ) / 2 ) ]
    approx_avg = (hand[0] + hand[-1])/2 
    return bool(median == card_average(hand) or approx_avg == card_average(hand))
def average_even_is_average_odd(hand):
    """

    :param hand: list - cards in hand.
    :return: bool - are even and odd averages equal?
    """
    odd_cards = hand[::2]
    even_cards = hand[1::2]
    return bool(card_average(odd_cards) == card_average(even_cards))
def maybe_double_last(hand):
    """

    :param hand: list - cards in hand.
    :return: list - hand with Jacks (if present) value doubled.
    """
    if hand[-1] == 11:
        hand[-1] = 2 * hand[-1]
    return hand
