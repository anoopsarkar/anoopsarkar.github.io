---
layout: post
title: "Maryam Siahbani passes her PhD thesis exam"
tags: [graduate-students,news]
---

Maryam Siahbani successfully defended her PhD thesis on July 13th 2016. 

The title of her thesis: "Left-to-Right Hierarchical Phrase-based Machine Translation".

Here is the abstract of her thesis:

Hierarchical phrase-based translation (Hiero for short) models statistical machine translation (SMT) using a lexicalized synchronous context-free grammar (SCFG) extracted from word aligned bitexts. The standard decoding algorithm for Hiero uses a CKY-style dynamic programming algorithm with time complexity O(n^3) for source input with n words. Scoring target language strings using a language model in CKY-style decoding requires two histories per hypothesis making it significantly slower than phrase-based translation which only keeps one history per hypothesis. In addition, the size of a Hiero SCFG grammar is typically much larger than phrase-based models when extracted from the same data which also slows down decoding. In this thesis we address these issues in Hiero by adopting a new translation model and decoding algorithm called Left-to-Right hierarchical phrase-based translation (LR-Hiero for short). LR-Hiero uses a constrained form of lexicalized SCFG rules to encode translation, where the target-side is constrained to be prefix-lexicalized. LR-Hiero uses a decoding algorithm with time complexity O(n^2) that generates the target language output in left-to-right manner which keeps only one history per hypothesis resulting in faster decoding for Hiero grammars. 

The thesis contains the following contributions: 

(i) We propose a novel dynamic programming algorithm for rule extraction phase. Unlike traditional Hiero rule extraction which performs a brute-force search, LR-Hiero rule extraction is linear in the number of rules. 

(ii) We propose an augmented version of LR-decoding algorithm previously proposed by (Watanabe+, ACL 2006). Our modified LR-decoding algorithm addresses issues related to decoding time and translation quality and is shown to be more efficient than the CKY decoding algorithm in our experimental results. 

(iii) We extend our LR-decoding algorithm to capture all hierarchical phrasal alignments that are reachable in CKY-style decoding algorithms. 

(iv) We introduce a lexicalized reordering model to LR-Hiero that significantly improves the translation quality. 

(v) We apply LR-Hiero to the task of simultaneous translation; the first attempt to use Hiero models in simultaneous translation. We show that we can perform online segmentation on the source side to improve latency and maintain translation quality.

Ph.D. Examining Committee:

* Dr. Anoop Sarkar, Senior Supervisor
* Dr. Fred Popowich, Supervisor
* Dr. Leonid Chindelevitch, Internal Examiner
* [Dr. Bill Byrne](http://mi.eng.cam.ac.uk/~wjb31/), External Examiner
* Dr. Nick Sumner, Chair

More information on the [Student theses page]({{ site.baseurl }}/theses)
