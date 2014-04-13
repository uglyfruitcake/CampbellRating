import math
from operator import itemgetter


def campbell_rating(limit, power):
    ratings = []
    for i in range(1, limit):
        r = (num_factors(i) ** power)/float(i)
        ratings.append([i, r])

    return sorted(ratings, key=itemgetter(2))[1]


def is_factor(factor, product):
    if product % factor == 0:
        return True
    else:
        return False


def num_factors(number):
    possible_factor = 2
    number_factors = 2
    sqrt = math.sqrt(number)

    while possible_factor < sqrt:
        if is_factor(possible_factor, number):
            number_factors += 2
        possible_factor += 1

    if is_factor(sqrt, number):
        number_factors += 1

    if number == 1:
        return 1
    else:
        return number
