import operator as op

def all_except_option(opt, xs):
    if opt in xs:
        return filter(lambda x: x != opt, xs)
    else:
        return None

def get_substitutions(substitutions, opt):
    result = [] 
    for each in substitutions:
        temp = all_except_option(opt, each)
        if temp:
            result.extend(temp)
    return result

def similar_names(substitutions, full):
    return [full] + [
        {'first': x, 'middle': full['middle'], 'last': full['last']}
        for x in get_substitutions(substitutions, full['first'])
    ]

BLACK = 0
RED = 10

DIAMONDS = 0
SPADES = 10
HEARTS = 20
CLUBS = 30

JACK = 11
QUEEN = 12
KING = 13 
ACE = 14

def card_color(card):
    suit, value = card
    if suit in (DIAMONDS, HEARTS):
        return RED
    else:
        return BLACK

def card_value(card):
    suit, value = card
    if value in (JACK, QUEEN, KING):
        return 10
    elif value == ACE:
        return 11
    else:
        return value
