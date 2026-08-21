---
jupyter:
  jupytext:
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.19.5
  kernelspec:
    display_name: Python 3 (ipykernel)
    language: python
    name: python3
---

<!-- #region -->
---
numbering:
  title:
    offset: 0
---


(NB3_flow)=
# Program flow control with Conditional Statements and Loops

(NB3_test)=
## Pre/Post-test
This test is for testing your current skills in Python. You can use it in two ways:
* pre-test: to test your skills beforehand. If you are already proficient in Python, and can do this test within approximately 15 minutes, you can scan through the notebook rather than carefully reading each sentence.
* post-test: to test your skills after Notebook 3. Check whether you learned enough.

**Including password protection**<br>
Although the supervisors are impressed by the work Eric is doing, his co-workers are not as happy by the quick progress Eric is making. Due to the large number of error messages in his code recently, he is convinced someone is messing with his code... Therefore he decides to write a program that asks the user to enter the password and checks whether it is correct. As a typo might occur, the user has three tries, after which the program should shut down. After every try tell the user whether the password is correct or not and how many tries are left. If the user has not provided the right passwork within the required number of attempts, provide a warning message.

Write the code.
<!-- #endregion -->

```python
password = 'practicum123'
tries = 0 

### Your code

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-820ab9eec85e7818", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_objectives)=
## Learning objectives

In this notebook, we will learn how to control the flow of execution of Python code using conditional statements and loops. 

After completing this notebook, you are able to:

* create conditional branching statements using `if`, `elif`, and `else`
* formulate conditions using `==`, `<`, `>`
* combine logical conditions using `and` and `or`
* create a `while` loop that exits on a particular condition
* create a `for` loop that loops over a range of numbers using the `range()` command
* exit loops using the `break` command
* skip the rest of a code block in a loop using `continue`


<!-- #endregion -->
(NB3_cond)=
## Conditional statements

A powerful concept in programming languages are pieces of code that allow you to control if segments or your code are executed or not based of the value of variables in your code. 

In this section, we will look at some of the features of the Python language for conditional execution of your code. 


<div style="width:75%; margin:0 auto;">
    <iframe width="200" height="150" src="https://www.youtube.com/embed/DZwmZ8Usvnk" title="Python Tutorial for Beginners 6: Conditionals and Booleans - If, Else, and Elif Statements" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>

<!-- #region nbgrader={"grade": false, "grade_id": "cell-820ab9eec85e7818", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_if)=
### The `if` statement

We have already seen an example of the `if` statement in the previous notebook. The syntax of the if statement is as follows: 

```
if expression:
    code block to be executed if the expression is "True"
```

Here, `expression` is a piece of code that evaluates to either the value `True` or `False`. Here are a few simple examples:
<!-- #endregion -->

```python
if True:
    print("True is true")   
```

```python
if True:
    print("The code block")
    print("after 'if' statements")
    print("can have multiple lines.")
```

```python
if False:
    print("False is not True (this will not be printed)")
```

```python
if not False:
    print("not False is True")   
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8f5002353d747ef9", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB3_
Try out the following conditional statements, filling in the values specified to replace the `---` in the code cells.

Check if the integer `1` is true:
```
<!-- #endregion -->

```python
if ---:
    print('The expression is true')
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-932ea824ec7ca25c", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Check if `103.51` is true:
<!-- #endregion -->

```python
if ---:
    print('The expression is true')
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-b4c0600a205af8d1", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Check if `-1` is true:
<!-- #endregion -->

```python
if ---:
    print('The expression is true')
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-06bb622a4a2db31e", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Check if condition statements work with boolean  variables:
<!-- #endregion -->

```python
a = True
if ---:
    print('The expression is true')
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-f2462c37fb4f8c16", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Check if conditional statements work with  numerical variables:
<!-- #endregion -->

```python
b = -73.445
if ---:
    print('The expression is true')
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ad422752c90b5a9e", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_comp)=
### Comparison and test operators

In the above, the `expression` in the `if` statements were all directly values that are either True or False (except for the example of `not False`). 

More generally, however, the `expression` can also include comparisons. Some examples of numerical comparisons are given here below:
<!-- #endregion -->

```python
if 5 == 5:
    print("A double equal sign '==' compares the two sides of itself and gives the")
    print("result 'True' if the two sides have the same value")
```

```python
a = 5
if a == 5:
    print("== also works with variables")
```

```python
a = 5
if 5 == a:
    print("The variable can be on either side")
```

```python
a = 5
b = 5
if a == b:
    print("and == also works with two variables")
```

```python
a = 5
if a = 5:
    print("This will give an error! A single = is an assignment operator, not a conditional test")
    print("To check if a is equal to 5, you need to use the double equal sign ==")
```

```python
a = 5
if a == 6:
    print("This will not be printed.")
```

```python
a = 5
if 2*a == 10:
    print("You can also use mathematical expressions")    
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-2c4696ee3922ab23", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In addition to the `==` operator, there are also several other comparison operators such as `<`, `>`, `>=`, `<=`, `!=`
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-f6b4a7e98c6672e0", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB3_
Test the operators `<`, `>`, `>=`, `<=`, `!=` by trying them in an if statement with numerical values. 
```
<!-- #endregion -->

```python
if --- < ---:
    print('The expression is true')
```

```python
if --- <= ---:
    print('The expression is true')
```

```python
if --- > ---:
    print('The expression is true')
```

```python
if --- >= ---:
    print('The expression is true')
```

```python
if --- != ---:
    print('The expression is true')
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-096011724723bedd", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_logic_op)=
### Logical operations

Python also allows you to build the `expression` out of logical combinations of several conditions using the keywords `and`, `or`, and `not`. The value of these operators is as follows
* `and` evaluates to True if both conditions are True
* `or` evaluates to True if either condition is True
* `not`evaluates to True if condition is not True

Below are a few examples. 
<!-- #endregion -->

```python
if True and False:
    print("This will not be printed")
```

```python
if True or False:
    print("This will be printed")
```

```python
if not 5 > 6:
    print("We have already seen 'not' in previous examples. Here, we also combine with an comparison")
```

```python
if not 5 != 5:
    print("This is a very silly example (hard to read, bad coding!)")
```

```python
if 5 < 6 and 10 > 9: 
    print("An example of combining conditional expressions with 'and'")
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8a0f0f9e5985f291", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB3_
Try out the following examples using the if statement form from above for the conditions

**(a)** Check if 5 is smaller than 6, AND 10 is smaller equal than 9:

**(b)** Do you think that the statement `not False or True` evaluates to `True` or `False`? Try it out and see:
```
<!-- #endregion -->

```python
# Your code here
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-fbaf814587160898", "locked": true, "schema_version": 3, "solution": false, "task": false} -->

<!-- #endregion -->

```python
# Your code here
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-a09e89673e9b20d3", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
To understand what happened in part (b), we have to know if Python first performs the operation `False or True` or if it performs the operation `not False` first. The rules for which order Python does things, in can be found in the documentation for <a href=https://docs.python.org/3/reference/expressions.html#operator-precedence>operator precedence</a>. In the example above, we can see that the `not` operator had precedence and Python performed the `not` before it performed the `or`. 

What if I wanted to have Python perform the `or` first? You do this by enclosing `True  or False` in brackets:
<!-- #endregion -->

```python
if not (False or True):
    print("not (False or True) is False so this will not be printed")
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-e8a75bf958008fea", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_elif)=
### The elif and else statements


In Python, you can combine the `if` statement with `elif` and `else` commands in a chain in order to allow you to take actions in the case that the starting `if` statement was false. 

`elif` (else if) is a command that allows you to check another condition if the condition of the starting `if` is `False`. Note that if the `if` criterion is `True`, the `elif` statement will be skipped and not checked. 

`else` is a command that allows you to execute some code if all of the `if` and all the `elif`s are are `False`. 

Note that to be part of the "chain", all the `elif`s and the last `else` must follow directly after each other's code blocks with no other code in between. And a new `if` always starts a new chain. 
You can see how this works in the following examples:
<!-- #endregion -->

```python
a = 5
if a < 6:
    print("a is less than 6")
else:
    print("a is not less than 6")
```

```python
a = 5
if a<6: 
    print("the 'if' statement found that a is less than 6")
elif a<6:
    print("this will never get printed!")
```

```python
a = 5
if a<6: 
    print("the first if found that a is less than 6")
if a<6:
    print("unlike elif, a second if will get executed.")
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-bcd1475b5312a9de", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Since the code inside your `if` code block is just regular code, you can also add another if statement inside that code block. This creates a <a href=https://en.wikipedia.org/wiki/Nesting_(computing)>nested</a> `if` statement inside your first one:
<!-- #endregion -->

```python
# example of a nested if-statement
a=4
if a<6 and a>=0:
    if a>3:
        print("the value of a is 4 or 5")
    else:
        print("the value of a is 0, 1, 2, or 3")
else:
    print("none of these are the case")
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ae510a3a63768c64", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB3_
Practice the use of the if-elif-else statement with the following exercise by filling in the missing conditional statements. You must use all three of `if`, `elif` and `else`. You also can not use the `end` operator.
```
<!-- #endregion -->

```python
def check_number(a):
    ...conditional statement number 1...
        print(a, "is less than or equal to 5")
    ...conditional statement number 2...
        print(a, "is between 5 and 10")
    ...conditional statement number 3...
        print(a, "is greater than or equal to 10")
        
# Testing your function
check_number(1)  
check_number(5)  
check_number(7)
check_number(10)
check_number(15)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-636e6a2b17097f10", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_loops)=
## Loops

Loops are a construction in a programming language that allow you to execute the same piece of code repeatedly. 

In Python there are two types of loops: `while` loops and `for` loops. We will look at `while` loops first and then move on to the more common `for` loops. 

(NB3_while)=
### The while loop

Using the `while` command, you can specify that a block of code gets executed over and over again until a certain condition is satified:

```
while expression:
    code...
```

As long as `expression` is true, then the code block will be executed over and over again.

A simple example where we use a while loop to count to 10:
<!-- #endregion -->

```python
i = 1
while i <= 10:
    print(i)
    i = i+1
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-84200ae77714a458", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In this example here, we use a while loop to add up all the numbers between 1 and 10:
<!-- #endregion -->

```python
i = 1
s = 0

while i<= 10:
    s = s + i
    i = i+1

print("Sum is", s)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-b97c9b714150c6b6", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note that with `while` loops, you have to be careful to make sure that your code block does something that results in your `expression` becomes false at some point, otherwise the loop will run forever. 

For example, when initially I wrote the above cell to calculate the sum, I forgot the `i = i+1` line of code:
<!-- #endregion -->

```python
i = 1
s = 0

while i<= 10:
    s = s + i

print("Sum is", s)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-4d529b9055631e33", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
**This code will never finish: it will go into an infinite loop!** (You can see that it is still running because the `*` beside the `In` text never gets turned into a number.) Note that for this  will have to manually stop the kernel using the stop button in the toolbar or it will run forever...
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-bb322dca784c930d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_while_when)=
### When should I use a while loop?

For both of the examples above, one would typically use `for` loop, which we will see in the next section. One place where `while` loops are very useful is if you do not know ahead of time how many iterations of the loop you will need. 

For example, let's consider the following sum:

$$
S(n) = \sum_{i=1}^n \sin^2(i)
$$

Let's say we want to know: for which $n$ does the sum exceed 30? We can easily check this with a `while` loop:
<!-- #endregion -->

```python
from numpy import sin

i = 1
s = 0

while s<30:
    s += sin(i)**2
    i += 1

print("Sum is", s)
print("i is", i)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-98fdacbdf316c332", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note here I have also used a new operator `+=`: this is a special assignment operator that increments the variable by the specified amount. `a += 1` is equivalent to `a = a + 1` (it just saves a bit of typing, remember: programmers are lazy...). 
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8419ddf039469350", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB3_
Write a function to calculate the factorial of a number using a while loop. The factorial, denoted with !, is the product of all numbers up to that number, i.e. $4!=1\cdot2\cdot3\cdot4$. Note that perhaps unexpectedly for you 0!=1 for which your function also have to give an answer.

*If your code doesn't seem to stop running, you may need to "debug" your code to see where your mistake is (I did). A handy way to do this, for example, is to add a `print(i)` statement inside your while loop: it will enable you to see if the variable `i` is doing what you think it should be...*
```
<!-- #endregion -->

```python
def factorial(a):
    ...
    while(...)
    
print(factorial(4))
print(factorial(0))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8bac96ac75f3228d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_for_loop)=
### The for loops

The `for` loop is designed to execute a piece of code a fixed number of times. The syntax of the `for` loop is:

```
for i in (a, b, c, d, ...):
    code block
```

In each subsequent iteration of the for loop, the variable `i` is assigned next value that is supplied in the list values. 

We can repeat our sum calculation above using the following `for` loop:
<!-- #endregion -->

```python
s = 0

for i in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10):
    s += i
    print(s)
```

It would, however, be much more convenient if we would not have to type all the numbers. Our could be something like this:

```python
s = 0
i = np.arange(1,11)
for i in i:
    s+=i
    print(s)
```

And that brings us to the range function...

<!-- #region nbgrader={"grade": false, "grade_id": "cell-2fa53e57cfc647d0", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB3_
Calculate the sum $\sum_{i=0}^n\sin^2(i)$ for n=10 using a `for` loop.
```
<!-- #endregion -->

```python
# Your code here
for...:
```

### Enumerate

Sometimes it might be usefull to obtain both the element and the index of an array or list. One tool that lets you do that is enumerate.
Enumerate works on every iterable (so on numpy arrays, lists, ...)

```python
A = ['This','is','an','iterable']
for i, word in enumerate(A):
    print('index = ',i,'element = ',word)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-58d187a8c4c8dc2e", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_range)=
### The range() function

You can imagine that if we wanted to perform this sum up to 100, it would be very annoying to type out all of the numbers. For this, Python has a convenient function `range()`, than can automatically generate ranges of numbers for you!

The `range` function can be used in a couple of different ways, which we will look at here. We will see, however, that `range` does some funny things, which is related to the fact that Python "counts from zero" *(more on this later)*. 

But let's look just at some concrete examples for now:

(NB3_range2)=
#### `range(N)`: Print a range of N numbers starting from zero

If you give `range` only one argument, it will give a range of numbers starting from 0, and a total number of numbers determined by the argument.  

As an explicit example, `range(10)` is equivalent to `(0,1,2,3,4,5,6,7,8,9)`:
<!-- #endregion -->

```python
for i in range(10):
    print(i)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-a1e795446fc32a60", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_range3)=
#### `range(N,M)`: Print a range of numbers starting from N and ending at M-1

If you give `range` two arguments `range(N,M)`, it will give a range of numbers starting from `N` and stopping at `M-1`. 

<!-- #endregion -->

```python
for i in range(1,11):
    print(i)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-adce08f894188b15", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
You might ask: why not stop at `M`? If you say the words "range from N to M", you would think that this range should include M? 

There are two reasons I can think of:

1. For programmers, it is nice that `range(0,10)` and `range(10)` do the same thing
2. It will be handy later that `range(j, j+N)` will then always give you `N` numbers in the range

Maybe there are more, I'm not sure (you'd have to ask the nerds who wrote Python...). But in any case, you just need to remember that `range(N,M)` stops at `M-1`...

<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-3f4edd12e92245a9", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_range4)=
#### `range(N,M,S)`: Print a range of numbers less than M, starting from N, with steps of S

This is like the last one, but now with the chance to change the steps:
<!-- #endregion -->

```python
for i in range(1,11,2):
    print(i)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-a67520608225fbaf", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note that the `range` function works only with integers: `range(1,11,0.5)` is not allowed. (For floating point ranges, you can use the `numpy` function `arange`, more on that later...)
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-95d40298b2f365ae", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB3_
Calculate the sum of all numbers from 1 to 100 using a `for` loop with the `range()` function. Compare it to the famous value that Gauss calculated in class as an <a href=https://nrich.maths.org/2478>elementary school student</a>. 
```
<!-- #endregion -->

```python
# Your code here
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-3cf16acbe0d81ace", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_loops_oth)=
### Using for loops with things other than ranges of numbers

In the examples above, we looked at using `for` loops to iterate through a list of integers. 

In Python, however, `for` loops are much more flexible than only iterating over numbers: `for` loops can iterate over any <a href=https://www.programiz.com/python-programming/iterator>iteratable object</a>, including 1-D numpy arrays, which we will see in later notebooks.

But, as an example, here is a piece of code that uses the `numpy` random number generator to calculate the sum of 10 random integers between 0 and 100:
<!-- #endregion -->

```python
from numpy.random import randint

s = 0
for x in randint(0,100,10):
    print(x)
    s += x

print()
print("Sum is ", s)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-55311578c51712a5", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB3_exit)=
### Manually exiting or skipping a loop using break and continue

In addition to the examples we saw above, Python offers two extra commands for controlling the flow of execution in a loop: `break` and `continue`

`break` is a command you can use to force the exiting of either a `for` loop or a `while` loop. For example, you can replace the while loop above using something like this:
<!-- #endregion -->

```python
s = 0
i = 0
while True:
    s += sin(i)**2
    i += 1
    if s > 30: 
        break
        
print(s)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ebe183bb239808e9", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
It looks funny at first, because `while True` looks like you will loop forever! But of course, you are saved by the `break` statement. 

Using `break` statements can sometimes make your code more readable, particularly if you want to be able to exit the loop under different conditions, or have an exit condition trigger a certain piece of code. Here is an example of two conditions: 
<!-- #endregion -->

```python
from numpy.random import randint

i = 0
found_five = False
max_tries = 10

while True:
    i += 1
    n = randint(0,30)
    if n == 5:
        found_five = True
        break
    if i >= max_tries: 
        break
        
if found_five:
    print("We found a 5 after", i, "tries")
else:
    print("We didn't find a 5 in the maximum number number of tries (", max_tries, ")")
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-5c5df9248db93ce5", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
The statement `continue` is used if you want to skip the rest of the code in the code block and restart the next loop. This can sometimes be useful if as a way of avoiding adding an `else` statement. (Remember, programmers are lazy typers...and it can be useful if you have a big long complicated block of code...)
<!-- #endregion -->

```python
s = 0
for i in randint(0,30,100):
    if (i % 5) == 0:
        continue
    s += i

print("The sum of +/-100 random numbers between 0 and 30 excluding those that are divisible by 5 is:", s)
    
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8a7bc126b9fe430a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
This is probably not a great example (if you are smart you can do this with less typing), but in any case, you now know what `continue` does. 
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-10e1b8eed7f40b1c", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB3_
Write code that creates a variable `i` with an initial value of zero. Use a while loop that increments `i` by one as long as `i` is less than one million. Have your loop stop if `i` satisfies the condition $i(i-10) = 257024$. Have your code print the `i` that satisfies this condition (if there is one). 
```
<!-- #endregion -->

```python
# Your code here
```

```{exercise}
:label: NB3_
In order to make sure that the seasons stay aligned with our calendars, leap years of 366 days have been introduced. A leap year is a year which is an integer multiple of 4 (except for years evenly divisible by 100, but not by 400),  https://en.wikipedia.org/wiki/Leap_year.   

Make a function to check whether a certain year is a leap year using if/else statements to return True for leap years and False for normal years.
```

```python
def leap_year(year):
    
    return
```

```python
# Check if your function works. The years 4, 2000, 2012 are examples of leap years,
# whereas the years 2021 and 2100 are not.
years = [1, 4, 100, 400, 2000, 2012, 2020, 2021, 2024, 2100]
for year in years:
    print(year, leap_year(year))
```

```python
#autotestingscript
import numpy as np
test = []

for year in years:
    test.append(leap_year(year)) 

answercheck = [False, True, False, True, True, True, True, False, True, False]
```

```python
#auto check
np.testing.assert_array_equal(test, answercheck, 'error', True)
```

```{exercise}
:label: NB3_
Sometimes we want to find the peaks in our data. One way to do this is to go through the array and check for every value if the values left and right are smaller.

Write some code that finds the peak(s) of the array and that prints the index and value of all peaks.
```

```python
y = np.array([2, 2, 3, 4, 5, 4, 3, 8, 6, 4])    # dummy data

# your code here


```

```{exercise}
:label: NB3_
To keep your computer safe from others, it is probably password protected. Usually you have a few tries before the password entry is disabled for some time.

You can enter your password three times before a timeout is given. If the timeout (sleep) is over, you have three other tries. The timeout time in seconds is given by $T = 60 + i^3$, where $i$ is the number of tries. 

Write the code. 
```

```python
#your code here

password = 'practicum123'
tries = 0 


```
