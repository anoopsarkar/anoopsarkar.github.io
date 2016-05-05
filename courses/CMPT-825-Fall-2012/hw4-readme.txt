
You should take the files from /cs/fac1/anoop/cmpt825/hw4 and put
your solution in the hw4/answer directory. You must use svn to
submit your solution.

$ svn co https://punch.cs.sfu.ca/svn/CMPT825-1127-YOUR-GROUP-NAME
$ cd CMPT825-1127-YOUR-GROUP-NAME
$ scp -r oak.fas.sfu.ca:/cs/fac1/anoop/cmpt825/hw4 .
$ cd hw4
$ mkdir answer
$ cp ckyparse-nopruning.py answer
$ cd answer # put your answer here
# svn add each file you add to this directory
# DO NOT add the training and test files to your svn repository
$ svn commit -m 'commit message'

To continue working at a later date:

$ cd CMPT825-1127-YOUR-GROUP-NAME/hw4/answer
# OR (on a different machine)
$ svn co https://punch.cs.sfu.ca/svn/CMPT825-1127-YOUR-GROUP-NAME
# if necessary copy the train and test files from my directory
# check if your group members did anything
$ svn update
# work on your homework
$ svn commit -m 'commit message'

Create a file called HANDLE in your hw4 directory which contains
your group handle (no spaces).

Submit HW4 on courses.cs.sfu.ca by submitting the following URL:

https://punch.cs.sfu.ca/svn/CMPT825-1121-YOUR-GROUP-NAME/hw4

Do this as soon as you can. There is no advantage to waiting to
submit. I will pull your solution from the svn server after the
deadline.

You have been provided some source files. See the makefile in the
answer directory for usage. Running 'make' will test the program
and create the output files.

%%

