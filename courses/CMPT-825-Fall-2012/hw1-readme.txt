
You should take the files from /cs/fac1/anoop/cmpt825/hw1 and put
your solution in the hw1/answer directory. You must use svn to
submit your solution.

$ svn co https://punch.cs.sfu.ca/svn/CMPT825-1127-YOUR-GROUP-NAME
$ cd CMPT825-1127-YOUR-GROUP-NAME
$ scp -r oak.fas.sfu.ca:/cs/fac1/anoop/cmpt825/hw1 .
$ cd hw1
$ mkdir answer
$ cp perc.py perc_train.py readme.txt answer
$ cd answer # put all your answer programs here
# svn add each file you add to this directory
# DO NOT add the training and test .gz files to your svn repository
$ svn commit -m 'commit message'

To continue working at a later date:

$ cd CMPT825-1127-YOUR-GROUP-NAME/hw1/answer
# OR (on a different machine)
$ svn co https://punch.cs.sfu.ca/svn/CMPT825-1127-YOUR-GROUP-NAME
# if necessary copy the train and test files from my directory
# check if your group members did anything
$ svn update
# work on your homework
$ svn commit -m 'commit message'

Create a file called HANDLE in your hw1 directory which contains
your group handle (no spaces).

Submit HW1 on courses.cs.sfu.ca by submitting the following URL:

https://punch.cs.sfu.ca/svn/CMPT825-1127-YOUR-GROUP-NAME/hw1

Do this as soon as you can. There is no advantage to waiting to
submit. I will pull your solution from the svn server after the
deadline.

You have been provided some source files. See the makefile for
usage. Running 'make' will train and test the program. Running 'make
debug' runs it on the smaller training set (useful for debugging
your program).

All text output should be printed to standard output (stdout). Just
use print which prints to stdout by default.

Programs that take input must read it from standard input (stdin).

%%

A sample model file called 'debug.model' is provided.  To see the
weight vector in this model do the following steps after you start
the python interpreter.

>>> import perc
>>> print perc.perc_read_from_file('debug.model')

Notice that each feature is a FEAT, LABEL pair that is a key in a
dictionary and the value assigned to it is the weight.

$ cd answer; time make all > all.log 2> all.errors
real	0m20.652s
user	0m20.217s
sys	0m0.349s

$ cat all.log
python perc_train.py ../tagset.txt ../train.txt.gz ../train.feats.gz perc.model
python perc.py ../tagset.txt ../test.txt.gz ../test.feats.gz perc.model  > perc.output
../conlleval < perc.output
processed 47377 tokens with 23852 phrases; found: 23911 phrases; correct: 22163.
accuracy:  95.40%; precision:  92.69%; recall:  92.92%; FB1:  92.80
             ADJP: precision:  74.31%; recall:  73.29%; FB1:  73.79  432
             ADVP: precision:  79.40%; recall:  79.68%; FB1:  79.54  869
            CONJP: precision:  41.67%; recall:  55.56%; FB1:  47.62  12
             INTJ: precision: 100.00%; recall:  50.00%; FB1:  66.67  1
              LST: precision:   0.00%; recall:   0.00%; FB1:   0.00  0
               NP: precision:  93.16%; recall:  93.03%; FB1:  93.09  12405
               PP: precision:  96.28%; recall:  97.80%; FB1:  97.03  4887
              PRT: precision:  82.50%; recall:  62.26%; FB1:  70.97  80
             SBAR: precision:  86.38%; recall:  82.99%; FB1:  84.65  514
               VP: precision:  92.87%; recall:  93.92%; FB1:  93.39  4711

$ cat all.errors
number of mistakes: 5683
number of mistakes: 3624
number of mistakes: 2475
number of mistakes: 1839
number of mistakes: 1390
number of mistakes: 1055
number of mistakes: 842
number of mistakes: 682
number of mistakes: 550
number of mistakes: 485
number of mistakes: 456
number of mistakes: 425
number of mistakes: 317
number of mistakes: 312
number of mistakes: 273

