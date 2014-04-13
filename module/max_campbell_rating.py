from operator import itemgetter
from module import campbell_rating


def max_campbell_rating(start, end, power):
    ratings = []
    for i in range(start, end + 1):
        ratings.append(campbell_rating(i, power))

    return sorted(ratings, key=itemgetter(1))[-1]
