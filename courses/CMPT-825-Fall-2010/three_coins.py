
# try these inputs:
#  python2.6 three_coins.py 5 0.3 0.3 0.6 HHH TTT HHH TTT HHH
#  python2.6 three_coins.py 5 0.3 0.3 0.6 HHH TTT HHH TTT
#  python2.6 three_coins.py 5 0.3 0.7 0.7 HHH TTT HHH TTT 
#  python2.6 three_coins.py 11 0.3 0.7001 0.7 HHH TTT HHH TTT 
#  python2.6 three_coins.py 11 0.3 0.6999 0.7 HHH TTT HHH TTT 

import math
import sys

# number of iterations for EM
num_iters = 5

# coin 0 has probability lmbda
lmbda = 0.3

# coin 1 has probability p_1 of heads
#p_1 = 0.6999
p_1 = 0.3

# coin 2 has probability p_2 of heads
#p_2 = 0.7
p_2 = 0.6

# First toss coin 0
# if coin 0 == H then toss coin 1 three times
# if coin 0 == T then toss coin 2 three times

#observations = ["HHH", "TTT", "HHH", "TTT"]
observations = ["HHH", "TTT", "HHH", "TTT", "HHH"]

if len(sys.argv) > 5:
  num_iters = int(sys.argv[1])
  lmbda = float(sys.argv[2])
  p_1 = float(sys.argv[3])
  p_2 = float(sys.argv[4])
  observations = sys.argv[5:]

print "num_iters =", num_iters
print "lambda =", lmbda
print "p_1 =", p_1
print "p_2 =", p_2
print "observations =", observations
print

def observed(x, y):
  if len(x) < 1: 
    return 0.0
  prob = 1.0
  for i in x:
    if i == 'H':
      if y == 'H': prob = prob * p_1
      else: prob = prob * p_2
    if i == 'T':
      if y == 'H': prob = prob * (1 - p_1)
      else: prob = prob * (1 - p_2)
  return prob

def posterior(y, x):
  return (lmbda * observed(x, y)) / (lmbda*observed(x, 'H') + (1-lmbda)*observed(x, 'T'))

def expected_counts(observations, print_posterior=0):
  count = 0.0
  count_p_1 = 0.0
  total_p_1 = 0.0
  count_p_2 = 0.0
  total_p_2 = 0.0
  total = len(observations)
  for obs in observations:
    for y in "HT": 
      post = posterior(y, obs)
      if print_posterior == 1: print y, obs, post
      if y == 'H': 
        count += post
      for x in obs:
        if y == 'H' and x == 'H': 
          count_p_1 += post
          total_p_1 += post
        if y == 'H' and x == 'T': 
          total_p_1 += post
        if y == 'T' and x == 'H': 
          count_p_2 += post
          total_p_2 += post
        if y == 'T' and x == 'T': 
          total_p_2 += post
  print
  print "Iteration", i
  print "lambda =", count / total
  print "p_1 =", count_p_1 / total_p_1
  print "p_2 =", count_p_2 / total_p_2
  return (count / total, count_p_1 / total_p_1, count_p_2 / total_p_2)

for i in range(1,num_iters+1):
  (lmbda, p_1, p_2) = expected_counts(observations, 1)

