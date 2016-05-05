
You should take the files from /cs/fac1/anoop/cmpt825/hw3 and put
your solution in the hw3/answer directory. You must use svn to
submit your solution.

$ svn co https://punch.cs.sfu.ca/svn/CMPT825-1127-YOUR-GROUP-NAME
$ cd CMPT825-1127-YOUR-GROUP-NAME
$ scp -r oak.fas.sfu.ca:/cs/fac1/anoop/cmpt825/hw3 .
$ cd hw3
$ mkdir answer
$ cp ckyparse-nopruning.py answer
$ cd answer # put your answer here
# svn add each file you add to this directory
# DO NOT add the training and test files to your svn repository
$ svn commit -m 'commit message'

To continue working at a later date:

$ cd CMPT825-1127-YOUR-GROUP-NAME/hw3/answer
# OR (on a different machine)
$ svn co https://punch.cs.sfu.ca/svn/CMPT825-1127-YOUR-GROUP-NAME
# if necessary copy the train and test files from my directory
# check if your group members did anything
$ svn update
# work on your homework
$ svn commit -m 'commit message'

Create a file called HANDLE in your hw3 directory which contains
your group handle (no spaces).

Submit HW3 on courses.cs.sfu.ca by submitting the following URL:

https://punch.cs.sfu.ca/svn/CMPT825-1121-YOUR-GROUP-NAME/hw3

Do this as soon as you can. There is no advantage to waiting to
submit. I will pull your solution from the svn server after the
deadline.

You have been provided some source files. See the makefile in the
answer directory for usage. Running 'make' will test the program
and create the output files.

%%

q1 files: recap.input.gz, recap.test.gz, recap.train.gz, scoreRecap.pl
q2 files: wfreq.utf8.gz, cn-gold.data.gz, cn-test.data.gz, score-cnwseg.perl

TrueCase
--------

using disambig 
command: sh recap.sh
error rate = 0.025675919397944

using disambig plus recap first letter of unknown words
command: sh recap.sh | perl recapUnknownWords.pl recap.map
error rate = 0.0221999967208277

using disambig plus recap first letter of first word
command: sh recap.sh | perl recapFirstWord.pl
error rate = 0.0232985194536899

using disambig plus recap first letter of first word and unknown words
command: sh recap.sh | perl recapFirstWord.pl | perl recapUnknownWords.pl recap.map
error rate = 0.0202980767654244

plus using various hacks from recapHacks.pl
error rate = 0.0199045760849961


Chinese Word Segmentation
-------------------------

Greedy match:
TRUE WORDS RECALL:	0.400
TEST WORDS PRECISION:	0.250
SUMMARY:
TOTAL INSERTIONS:	69464
TOTAL DELETIONS:	236
TOTAL SUBSTITUTIONS:	60593
TOTAL NCHANGE:	130293
TOTAL TRUE WORD COUNT:	154864
TOTAL TEST WORD COUNT:	224092
TOTAL TRUE WORDS RECALL:	0.607
TOTAL TEST WORDS PRECISION:	0.420
F MEASURE:	0.496
OOV Rate:	0.230
OOV Recall Rate:	0.561
IV Recall Rate:	0.621

Dynamic Programming:
TRUE WORDS RECALL:	0.700
TEST WORDS PRECISION:	0.538
SUMMARY:
TOTAL INSERTIONS:	19385
TOTAL DELETIONS:	2705
TOTAL SUBSTITUTIONS:	20731
TOTAL NCHANGE:	42821
TOTAL TRUE WORD COUNT:	154864
TOTAL TEST WORD COUNT:	171544
TOTAL TRUE WORDS RECALL:	0.849
TOTAL TEST WORDS PRECISION:	0.766
F MEASURE:	0.805
OOV Rate:	0.230
OOV Recall Rate:	0.564
IV Recall Rate:	0.933

