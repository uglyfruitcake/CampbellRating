import math


def campbell_rating(long num, int power):
    r = (num_factors(num) ** power)/float(num)
    return [num, r]


cdef is_factor(long factor, long product):
    if product % factor == 0:
        return True
    else:
        return False


cdef num_factors(long number):
    cdef long possible_factor
    cdef long number_factor
    cdef float st
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