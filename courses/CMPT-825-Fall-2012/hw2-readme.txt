
You should take the files from /cs/fac1/anoop/cmpt825/hw2 and put
your solution in the hw2/answer directory. You must use svn to
submit your solution.

$ svn co https://punch.cs.sfu.ca/svn/CMPT825-1127-YOUR-GROUP-NAME
$ cd CMPT825-1127-YOUR-GROUP-NAME
$ scp -r oak.fas.sfu.ca:/cs/fac1/anoop/cmpt825/hw2 .
$ cd hw2
$ mkdir answer
$ cp ckyparse-nopruning.py answer
$ cd answer # put your answer here
# svn add each file you add to this directory
# DO NOT add the training and test files to your svn repository
$ svn commit -m 'commit message'

To continue working at a later date:

$ cd CMPT825-1127-YOUR-GROUP-NAME/hw2/answer
# OR (on a different machine)
$ svn co https://punch.cs.sfu.ca/svn/CMPT825-1127-YOUR-GROUP-NAME
# if necessary copy the train and test files from my directory
# check if your group members did anything
$ svn update
# work on your homework
$ svn commit -m 'commit message'

Create a file called HANDLE in your hw2 directory which contains
your group handle (no spaces).

Submit HW2 on courses.cs.sfu.ca by submitting the following URL:

https://punch.cs.sfu.ca/svn/CMPT825-1121-YOUR-GROUP-NAME/hw2

Do this as soon as you can. There is no advantage to waiting to
submit. I will pull your solution from the svn server after the
deadline.

You have been provided some source files. See the makefile in the
answer directory for usage. Running 'make' will test the program
and create the output files.

%%

Accurary results (without prior)
--------------------------------
#Parsing run: No pruning
-- All --
Bracketing Recall         =  77.17
Bracketing Precision      =  64.35
F-score                   =  70.18
-- len<=40 --
Bracketing Recall         =  77.17
Bracketing Precision      =  64.35
F-score                   =  70.18
#Parsing run: Pruning, beam = 0.00001, without prior
-- All --
Bracketing Recall         =  77.05
Bracketing Precision      =  64.90
F-score                   =  70.46
-- len<=40 --
Bracketing Recall         =  77.05
Bracketing Precision      =  64.90
F-score                   =  70.46
#Parsing run: Pruning, beam = 0.0001, without prior
-- All --
Bracketing Recall         =  76.57
Bracketing Precision      =  64.96
F-score                   =  70.29
-- len<=40 --
Bracketing Recall         =  76.57
Bracketing Precision      =  64.96
F-score                   =  70.29


Accurary results (with prior)
-----------------------------

#Parsing run: No pruning
-- All --
Bracketing Recall         =  77.17
Bracketing Precision      =  64.35
F-score                   =  70.18
-- len<=40 --
Bracketing Recall         =  77.17
Bracketing Precision      =  64.35
F-score                   =  70.18
#Parsing run: Pruning, beam = 0.00001, with prior
-- All --
Bracketing Recall         =  77.05
Bracketing Precision      =  64.90
F-score                   =  70.46
-- len<=40 --
Bracketing Recall         =  77.05
Bracketing Precision      =  64.90
F-score                   =  70.46
#Parsing run: Pruning, beam = 0.0001, with prior
-- All --
Bracketing Recall         =  77.05
Bracketing Precision      =  64.90
F-score                   =  70.46
-- len<=40 --
Bracketing Recall         =  77.05
Bracketing Precision      =  64.90
F-score                   =  70.46

