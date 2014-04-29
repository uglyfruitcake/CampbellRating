︠4f0adfd8-81b1-4e98-91d9-74bb1efc53e1︠
# Let's try plotting the campbell rating for the first 500 integers.
# Primes are shaded red.

# Some interesting patterns start to appear.

from module import c_rating

ratings = []
pratings = []
for i in range(1, 500):
    if i in Primes():
        pratings.append(campbell_rating(i, 2))
    else:
        ratings.append(campbell_rating(i, 2))

r = list_plot(ratings, base=2)
p = list_plot(pratings, color='red', base=2)
q = p + r
show(q, scale='loglog')

︡79108505-7128-406c-8fa0-36517e5f699d︡{"once":false,"file":{"show":true,"uuid":"db8e6309-40ae-4891-bb22-ebf94f467b61","filename":"/projects/2594a8b7-aa3f-4dc5-bde1-3892f7298bc8/.sage/temp/compute12dc0/18455/tmp_c8GiVi.png"}}︡
︠8ce2b9e4-c9ff-4730-94be-6f605502d8e8︠
# Let's have a look at the primes by themselves.
# We'll plot the campbell rating for the first 300 primes
# and then we'll plot the campbell rating against the index of those primes
# (index being 1 for the first prime, 2 for the second etc.).

from module import c_rating

f(x) = x/(x - 1)
pr = primes_first_n(300)
pratings = []
prat = []
for i in pr:
    x = campbell_rating(i, 2)
    pratings.append(x)
    prat.append(x[1])


list_plot_loglog(pratings, color='red', ymin=-1, base=2)
list_plot_semilogy(prat, ymin=-1, base=2)



︡02806703-03cb-483f-8bb4-31cfee7ec83e︡{"once":false,"file":{"show":true,"uuid":"dc937754-3752-449d-aaa0-eaee6e6c3e81","filename":"/projects/2594a8b7-aa3f-4dc5-bde1-3892f7298bc8/.sage/temp/compute12dc0/18455/tmp_RPmgV_.png"}}︡{"once":false,"file":{"show":true,"uuid":"ec1eebe5-72b0-4bfb-bc50-2d5e774d2592","filename":"/projects/2594a8b7-aa3f-4dc5-bde1-3892f7298bc8/.sage/temp/compute12dc0/18455/tmp_jvnbtq.png"}}︡
︠a337b226-79c9-4cde-ad01-58ae7c62a352︠
# Let's see if we can find a function that fits
# the relationship between the index of a prime and its campbell rating.

from module import c_rating

def get_prime_ratings(N, power):
    """Returns a list of the Nth primes ratings of the form (N, Rating)"""
    prime_ratings = []
    for i in range(1,N):
        p = nth_prime(i)
        r = c_rating.campbell_rating(p, power)
        prime_ratings.append((i, r[1]))
    return prime_ratings


def plot_fit(data, model):
    """Plots the original data with the graph produced by using the parameters from find_fit"""
    var('a, b, x')
    fit = find_fit(data, model, solution_dict=True)
    num_points = len(data)
    return plot(model(a = fit[a], b = fit[b]), (x,1,num_points), scale = "semilogy") + points(data,color='red')
    

def c_rating_plot(N, power,  model):
    """N - integer, number of primes to use
    power - integer, the power to use in campbell_rating
    model - a function, the base model to be used to find a fit
    
    Returns - The original data and the graph produced by find_fit all plotted together"""
    data = get_prime_ratings(N, power)
    return plot_fit(data, model)


m(x) = (a/x)*log(b/x)

c_rating_plot(40, 3, m)
︡202ef7b3-738f-4ac6-a964-9e00c8a47a70︡{"once":false,"file":{"show":true,"uuid":"e4d5c9fe-2a8b-4ad1-936c-487577e085bd","filename":"/projects/2594a8b7-aa3f-4dc5-bde1-3892f7298bc8/.sage/temp/compute12dc0/5515/tmp_Rijdum.png"}}︡
︠289461e7-7b19-4b10-b216-33f389fffa4b︠









