import sys
import math
import time


def is_factor(factor, product):
    if product % factor == 0:
        return True
    else:
        return False


def campbell_rating(number):
    possible_factor = 2
    number_factors = 2

    while (possible_factor < math.sqrt(number)):
        if is_factor(possible_factor, number):
            number_factors += 2

        possible_factor += 1

    if is_factor(math.sqrt(number), number):
        number_factors += 1

    if number == 1:
        return 1
    else:
        return (number_factors ** 2) / float(number)


def format_time(seconds):
    elapsed_hours = int(seconds // 3600)
    elapsed_minutes = int((seconds % 3600) // 60)
    elapsed_seconds = (seconds % 3600) % 60
    return "{0} Hours {1} Minutes {2} Seconds".format(elapsed_hours, elapsed_minutes, elapsed_seconds)


def main():
    target = int(sys.argv[1])
    threshold = float(sys.argv[2])
    number = 1
    hits = 0
    start_time = time.time()

    while (number <= target):
        rating = campbell_rating(number)

        if rating > threshold:
            hits += 1
            print "{0} has a Campbell rating of {1}".format(number, rating)

        number += 1

    print format_time(time.time() - start_time)
    print "Found {0} results between 1 and {1} with Campbell rating above {2}".format(hits, target, threshold)


if len(sys.argv) < 3:
    print "Usage: CampbellRatings.py <target> <threshold>"
    print "target - The maximum number for which the Campbell rating will be calculated"
    print "threshold - The minimum Campbell rating which will be reported"
else:
    main()
