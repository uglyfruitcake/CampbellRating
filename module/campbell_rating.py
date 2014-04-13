import math


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
    st = math.sqrt(number)

    while possible_factor < st:
        if is_factor(possible_factor, number):
            number_factors += 2
        possible_factor += 1

    if possible_factor == st:
        number_factors += 1

    if number == 1:
        return 1
    else:
        return number_factors