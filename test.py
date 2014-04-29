from timeit import Timer
from module import c_rating
from module import campbell_rating
from module import max_campbell_rating

print campbell_rating(100, 3)
print max_campbell_rating(1, 100, 2)


reps = 10
t = Timer('campbell_rating(4000000, 2)', 'from module import campbell_rating')
s = Timer('c_rating.campbell_rating(4000000, 2)', 'from module import c_rating')

t_av = sum(t.repeat(repeat=reps, number=1)) / reps
s_av = sum(s.repeat(repeat=reps, number=1)) / reps
r_av = t_av/s_av
print "average time for campbell_rating is %s" % t_av
print "average time for c_rating is %s" % s_av
print "on average, c_rating is %s times faster than campbell_rating" % r_av
