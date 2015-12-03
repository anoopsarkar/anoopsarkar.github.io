---
layout: post
title: "History of the Viterbi Algorithm"
---

Required reading: [The Viterbi Algorithm: A Personal History](http://arxiv.org/abs/cs/0504020) by G. David Forney Jr.

The Viterbi algorithm originated as a decoding algorithm for
convolution codes. Nowdays the Viterbi algorithm has widespread
use, particularly in speech recognition and natural language
processing. 

The interesting points from the above article (to tempt you into reading it):

* Viterbi devised the algorithm to help him teach:

  > the Viterbi algorithm for convolution codes ... came out of my
    teaching ... I found information theory difficult to teach, so I
    started developing some tools.

* The Viterbi algorithm, when first published, was not known to be
related to dynamic programming methods and also not known to provide
the optimal or maximum likelihood solution. The original paper
states that:

  > this decoding algorithm is clearly suboptimal

* It was G. David Forney, Jr who later proved that the Viterbi
algorithm was an exact recursive algorithm for the shortest path
through a trellis diagram. The relationship to dynamic programming
then became clear.

The article also provides various places where the Viterbi algorithm
has been used in practice, including the Galileo mission to Jupiter
in 1992 (it was used to boost the transmission bandwidth when the
primary antenna failed to deploy).

The article also mentions various relationships between algorithms
for "codes on graphs" and Pearl's belief propogation algorithm for
Bayesian networks. The following paper is a good reference on this
topic:

> S. M. Aji and R. J. McEliece, "The generalized distributive law,"
  IEEE Trans. Inform. Theory, vol. 46, pp. 325-343, Mar. 2000.

