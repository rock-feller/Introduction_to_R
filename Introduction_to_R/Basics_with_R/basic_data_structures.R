#Vectors, Data Frames, and Functions

#################### 
## Functions are your friends
#################### 
## While basic operations, such as addition, are invaluable features
## of R, the real core of R comes in the form of functions. Functions,
## in general, take arguments and convert them into output. That
## output can be a detailed statistical test, a chart or graph, or a
## simple summation -- the important thing to realize is that
## fundamentally all functions in R obey similar rules. A function in
## R is anything that can be specified by a name with a set of
## parentheses after it -- containing the function's arguments.
## Arguments are the input a function needs to perform its task and
## produce the desired output.

## This will become slightly clearer when I discuss the help utility
## below, but arguments can either be required or they can take on
## default values if unspecified. Because it would be tricky to keep
## track of the order of 10 possible inputs, which all might be
## optional, R allows the naming of these arguments in the
## function. This makes R functions easy to write and read, after a
## bit of acclimation.

## Take the log() function. It has one required argument, the number for
## which you want the logarithm, obviously. But it also has one
## optional argument, base. This argument defaults to e if omitted.

## So, you can determine the natural log of something quite easily, as
## in,

log(10) 

## To get the log base-10 of 10, you can write either 

log(10, 10) 

log(10, base=10) 

## "So, why would I ever want to do the second option?" you ask. Here,
## it would not much matter. It would be slightly easier to understand
## what is going on to a reader of your code in the second case, but
## maybe not enough useful to justify the extra typing.

## But as we move to more complex functions, especially the graphic
## functions like plot, the number of potential arguments is huge. Do
## you want a sub-caption for the y-axis? Most likely not, but when
## you do need one it is very valuable argument to have waiting in the
## wings. In those functions, the first couple of arguments will be
## specified without a name and then the rest will look like the
## base=10 argument above. For example, almost every plot you produce
## will need a label on the x-axis, say, so you will find yourself
## typing xlab= a lot.

#################### 
## Getting help
#################### 

## When you do not know what a function does or what arguments is
## takes, R's in-line help system is exceptionally handy. The easiest
## way to access help on a specific function, such as log, is

?log

## But equivalently, you can type

help(log)

## When the item you need help on is an operator, rather than a
## standard function (like the addition operator, +) only the second
## of these will work, and you must include the operator in quotes, as
## in

help("+") 


## Help files in R can seem intimidating. The trick is to know what
## you don't need to know. Often you will end up using only a few of
## the arguments. Most arguments will have standard, acceptable
## defaults noted by something like name=FALSE. You do not need to
## understand every argument in a function to get it to do what you
## want.

## The descriptions can be helpful, but you'll also want to look at
## the examples. The examples tend to be targeted at common scenarios
## and are most often well framed.

## Lastly, the "see also" section may be useful if you are looking for
## a function but only know the name of a similar function.


## Conversely, you might know what a function does, but not know R's
## name for it. There is no incredibly satisfactory solution to this,
## but a good first step is to search within the in-line help
## documentation for the concept:

help.search("average") 

## Or, equivalently,

??average

## The next step is to search the R website, http://www.r-project.org,
## for any help it can provide. The easiest way to do this from within
## R is to type

RSiteSearch("average") 

## With these tools in hand, you should be ready to troubleshoot most
## of your R foibles yourself!
## 



######################################################################  
## Introduction to Vectors
######################################################################

#################### 
## What is a vector?
####################

## Statisticians worry about multiple numbers, not single numbers like
## we have seen so far. So it is not surprising that most of the
## computation you will perform in R will involve more complex data
## structures.

## The simplest such structure is the vector, which is nothing more
## than a list of numbers, stored in the same place. All the rules you
## learned about assignment, above, still apply here, but there are
## some complications.

#################### 
## Inputting your own vector
#################### 
## In order to generate vectors of any length, R has a somewhat
## non-intuitive method, the function c(). The name "c" is short for
## concatenate, if that helps you remember its very important role in
## R. The function takes any number of arguments, which have values of
## numbers or vectors.  Some examples:

my.vector <- c(1,2,3)
x <- 5
y <- 10
my.other.vector <- c(x,y) 

my.last.vector <- c(my.vector, 365, my.other.vector) 

## It is pretty straightforward, once you get the hang of it.


## Hands off the keyboard! Pick up a writing implement:
## some.ages <- c(1,4,2)
## some.ages <- c(some.ages,3,some.ages+1)
## What does some.ages equal?

## Now decomment the above code by removing the "##" to execute the
## commands and compare your answers.

#################### 
## Generating Sequences
####################

## There are many occasions in R when you need a patterned sequence of
## numbers. As mentioned last in the last tutorial, most counting can
## be accomplished by use of the seq() function. If you haven’t
## already done so, it is worth taking a look at the help-file on
## seq() because it has a few arguments that can make your life
## easier.

?seq

## For example, seq() can generate a vector of a certain length
## between certain endpoints by typing

x <- seq(0,1,length.out=20)

## giving you a vector of length 20 between 0 and 1, confirmable by
## typing

length(x)

## A very common need in R is to generate vectors with an interval of
## 1 between each element.  R has a shorthand for this using the colon
## notation, as follows,

y <- 5:10

## #############################
## Element-wise vector operations
## 
###################################
#We can perfom elementwise operations with vectors as in the operations below
x <- 1:6
2*x
y <- 1:5
z <- 6:10
y+z
y*z
#################### 
## Indexing vectors
####################

## R has an incredibly useful way of accessing items from a
## dataset. Each item in a dataset has its own index, or numbered
## location, in the object’s structure. Square brackets are used to
## extract an item or items from a dataset, but it is crucial to
## understand that there are two completely distinct ways in which
## brackets are used to access items. I will consider the two methods
## for accessing a vector of length n in turn below.

## The first option: Logical 

## Requirements: Logical vector of length n
## Use it for: Finding a subset of data based on a rule

## Logical indexing works as if you’ve asked your indexing vector the
## question, "Do you want this item?” for each of the items in the
## vector.

x <- 1:5

x[c(T,F,F,F,T)]
## If we combine this logical indexing with the relational and logical
## operators you learned above, we have an exceptionally powerful tool
## to retrieve data that meet any set of criteria.

y<-rnorm(10000)

hist(y[!((y>-2)&(y<0))])

## I will give more insight below when I discuss indexing data
## frames. Stay tuned.

## In any operation in R, vectors will be automatically repeated until
## they reach the necessary length for the operation to make
## sense. For example, note the results of

1:6 + 1:2

## The same repetition holds for logical vectors.

## The second option: Numerical

## Requirements: Value or vector of any length with values 
## (1 to n) OR (-n to -1) 
## Use it for: Single item retrieval or shuffling, sorting, and repeating

## Accessing single items with brackets and a single index should be
## straightforward

x <- 3*(0:5)

x[4]

## One tedious way of creating a new vector of values from a vector’s
## elements would be

c(x[2],x[3],x[4]) #TEDIOUS

## So R makes it much easier by allowing a vector of indices to
## generate a vector.  Thereby, the command above becomes

x[2:4]

## There is nothing preventing you from accessing any element any
## number of times.

x[c(2,2,2,5,5,5)]

## Additionally, R allows you to use negative indices, indicating
## which items you want to exclude, as in,

x[c(-1,-6)]

## This is fine and productive as long as you remember never to mix
## negative and positive indices – R will not know what you want it to
## do:

x[c(-1,4)] #BAD


#################### 
## Sorting vectors
####################

## In Tutorial 1, you were introduced to the sort() function, which is
## handy.

## Now that you have been introduced to indexing, you may have an
## inkling of how much more powerful the sorting functions of R can
## become.

## As an introduction, let’s say you have a 4-element vector,

my.vector <- 5:8

## Using numerical indexing, we can manually re-order this vector by
## calling each of its indices once in our preferred order, for
## example

my.vector[c(2,3,4,1)]

## or, for a quick reversal

my.vector[4:1]

## Now, manually generating the vector of indices is not monumentally
## useful, which is where the function order() comes in. As
## demonstration, imagine we have a vector of student names and a
## corresponding vector of student heights (in meters).

stud.names <- c("Carol", "Walter", "Rachael", "Petunia", "Clark",
                "Justin")

stud.heights <- rnorm(6,1.7,.12)

## What we definitely don’t want to do is to perform sort() on each of
## these vectors independently. This will eliminate the pairing of the
## name to the height. So how can we sort one vector and have the
## other vector align correctly? Try order() on the names,

order(stud.names)

## Note that it returns the indices in the right order, not the values
## themselves.

## From what you learned above, you know it is now an easy matter to
## sort both of our vectors, as follows,

stud.names[order(stud.names)] #same effect as sort()

stud.heights[order(stud.names)]

## And, obviously, sorting the names by the heights is exactly
## analogous, and it will make for a pretty plot

barplot(stud.heights[order(stud.heights)],
        names.arg=stud.names[order(stud.heights)],
        ylab="Height (m)", main=
          "Student Heights")


## I have conveniently skipped over an important concept, because R
## handles it fairly intuitively, but I want to mention the
## terminology.  The variable stud.names and the results of ls(), for
## example, are called vectors of strings or character arrays.”  R
## handles them conveniently, so we don’t need to worry too much about
## them, but knowing the terminology will improve your understanding
## of R’s in-line help documents.

######################################################################
## SECTION B. Data Frames, Redux
######################################################################

## Re-introduction to data frames 

## Before we cover advanced topics of data frames, I wanted to point out the
## function data.frame() which puts data together to form data
## frames. This is a key alternative to using the prefab data frames
## that you used in last week’s assignment.

## First I want to generate a vector of student class-years to
## correspond to the stud.names before creating a data frame (Freshmen
## as 1, Sophomores as 2, etc.).

stud.years <- c(4,2,2,3,1,3)

## Now making a data frame is easy (each argument will just add more
## columns to the data), the only trick being that we have to assign
## the constructed data frame to a variable, as follows,

student.data <- data.frame(stud.heights,stud.years)

student.data

## Voila! Your own data frame. But, wait, where are our the student names?
## And can we have better column headings than our redundant variable
## names?

## The answers lie in two new functions that we will use with
## assignment notation, names() and row.names(). Let’s take a look:

names(student.data)

row.names(student.data)

## What we see are vectors of strings corresponding to the columns and
## rows, respectively. We can change these by assigning replacement
## strings to the indexed values or by substituting our own vector of
## strings.

names(student.data)[1] <- "heights"

names(student.data)[2] <- "class.years"

row.names(student.data) <- stud.names

## The result is downright beautiful:

student.data


## Indexing data frames 

## As with vectors, brackets and logical or numerical vectors are still
## the way to access data frames, but with a slight complication, 
## because data frames are multidimensional. The solution (which also
## holds for matrices, etc.) is to separate the two dimensions with a
## comma. R treats the first entry as the row number and the second
## entry as the column number; thus, to access the second column of
## the fourth row, type

student.data[4,2]

## Or the second column of the last three rows,

student.data[4:6,2]

## Not too tricky? There are two further complications.

## To access an entire row or entire column, leave the index blank, as
## in,

student.data[,1] #FIRST COLUMN

student.data[3,] #THIRD ROW

student.data[,] #ENTIRE FRAME, equivalent to "student.data"

## The only other complication is the ability to enter the names() or
## row.names() as indices:

student.data["Justin",]

## Putting all of this together, we can quickly generate subsets of
## our data:

tall.students <- student.data[student.data$height >
                                mean(student.data$height),]

## Or sort our data by various aspects:

student.data[order(student.data$class.years),]