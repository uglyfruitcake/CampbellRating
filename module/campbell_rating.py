import math
from operator import itemgetter


def campbell_rating(num, power):
    r = (num_factors(num) ** power)/float(num)
    return [num, r]


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
        return number_factors
