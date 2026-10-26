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

---
numbering:
  title:
    offset: 0
---

(NB2_functions)=
# Functions in Python & basics of plotting


(NB2_test)=
## Pre/Post-test
> This test is for testing your current skills in Python. You can use it in two ways:
> * **pre-test:** to test your skills beforehand. If you are already proficient in Python, and can do this test within approximately 15 minutes, you can scan through the notebook rather than carefully reading each sentence.
> * **post-test:** to test your skills after Notebook 2. Check whether you learned enough.

**Analysing some data**<br>
As Eric passed the first test, he is now exposed to a more difficult challenge. He obtained a dataset consisting of five measurements. By plotting the data he expects that the underlying relation is $y = a \cdot x + b$, with $a$ and $b$ constants that need to be determined. As he still lacks the ability to have Python determine these coefficients, he just tries values for $a$ and $b$ and produces the corresponding graph. He then visually assesses the correctness of the values for $a$ and $b$.

- plot the measurements in the graph as black dots
- make an educated guess for the coefficients $a$ and $b$
- write a function that takes $x$, $a$ and $b$ as input and calculates y (
- make a test array in the given domain for x, using an interval of 0.1 (so [0.0, 0.1, ...]) 
- calculate for all values of x_test the value of y 
- plot these data in the same graph as the measurements as red dashed line (`r--`) 


```python
x = np.array([0, 1, 2, 3, 4, 5])
y = np.array([1.2, 3.6, 6.0, 8.4, 10.8, 13.2])

### YOUR CODE


x_test = ...
y_test = ...
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-98b92489332760b6", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB2_learning_obj)=
## Learning objectives

In this notebook, we will explore the implementation of functions in Python. 

After completing this notebook, you are able to:
* define functions with input parameters to execute a piece of code (use functions as "methods")
* create and use functions that return a value (or multiple values)
* import and use functions from libraries / modules
* use Shift-Tab to bring up the help for a function from a library
* predict if a variable name in a function refers to a local variable or a global variable
* make a plot using the matplotlib library
<!-- #endregion -->

```{iframe} https://www.youtube.com/embed/9Os0o3wzS_I
:width: 50%
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-98b92489332760b6", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB2_var_func)=
## Various functions

(NB2_func_typesave)=
### Functions to save typing

In programming, you often want to repeat the same sequence of commands over and over again. 

One way to do this is to copy and paste the same piece of code over and over again. This is actually quite easy, but runs quickly into a problem: let's say you want to change a little bit what that code will do, then you need to change it in many places. If you change it in one place but forget in another, then your program might crash (ie. give an error). Or even worse, and even harder to [debug](https://en.wikipedia.org/wiki/Debugging) the mistake may not give an error message but give you the wrong answer!

For this reason (among others), programming languages allow programmers to define "functions". Functions are pieces of code that you can give a name and then enable you to them use over and over again, without having to retype the code text. 

As an example, let's say that we want to print out the value of a variables named `a` and `b` using a long sentence:
<!-- #endregion -->

```python
a = 6
b = 4
print("The value of variable a is", a)
print("The value of variable b is", b)

a = a/2
b = 3
print("The value of variable a is", a)
print("The value of variable b is", b)

a = a+1
b = 1.5
print("The value of variable a is", a)
print("The value of variable b is", b)

a = a-20
b = -1e4
print("The value of variable a is", a)
print("The value of variable b is", b)

a = a+1j
b = 1
print("The value of variable a is", a)
print("The value of variable b is", b)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-fb10310a1ec1a391", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
To save a lot of typing, one can define a simple function to do this work for us: 
<!-- #endregion -->

```python
def print_status():
    print("The value of variable a is", a)
    print("The value of variable b is", b)

a = 6
b = 4
print_status()

a = a/2
b = 3
print_status()

a = a+1
b = 1.5
print_status()
```

Or even more convenient:

```python
def print_status(a,b):
    print("The value of variable a is", a)
    print("The value of variable b is", b)

a = 6
print_status(a+1,1.5)
print_status(a-20,-1e4)
print_status(a+1j,1)
```

To define a function, you use the following syntax:

```{code-cell} python
def function_name():
     ...
```

Here, you replace the `...` with the code you want to function to execute. The Python code inside the function should be <a  href=https://en.wikipedia.org/wiki/Indentation_(typesetting)>indented</a> by starting each line with a <a href=https://en.wikipedia.org/wiki/Tab_key>tab</a>. By default, adding a tab will produce 4 spaces in your code. You can also "indent" your code by manually adding spaces, but you must make sure to add 4 spaces each time. The Jupyter Notebook will try to detect if you make a mistake in your indentation, and will sometimes color your text in red if it detects a mistake. 

```{important}
Tabs in Python are VERY IMPORTANT: python uses tabs to know which code is inside the function and which is not. If you make a mistake with the tabs in such a way that Python cannot understand what you mean, it will give you an `IdentationError`.
```

In notebooks, you can also select a line, or multiple lines, and then use `Tab` to increase their indentation level, or use `Shift-Tab` to decrease their indentation level.

```python
def test_tab_and_shift_tab():
    some code
        that is indendented
    try selecting this text
    and then pushing tab 
    and shift-tab
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-a12ce8709fcf3b9f", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In the given example, it may not be such a big deal, but you can imagine that as the code in your function becomes more and more complicated, it will save you a lot of time. Also, imagine that I wanted to change the wording of the sentence I print: in the case with the function, I would only have to do this once, while in the example without function, I would have to manually change this at 5 different places. 
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-cc004d60a3c3b17c", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB2_ex_first_func
Write your own function that contains two lines of code. The first line should make a new variable `var2` that converts `var` to an integer. The second line of your code should print the value of `var2`. 

Using this code, play around with the indentation (add extra tabs and spaces for example) to see how 'critical' Python is with indentation. For example: does three spaces work instead of `Tab`? Does one space work? What about `Tab` on the first line and three spaces on the second line? Can you make Python trigger an `IdentationError`? 
```
<!-- #endregion -->

```python
var=3.5

# Your function and out below

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-1be65f1712abb44d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB2_func_input)=
### Functions with input variables

Let's say that we want to print out the status of variables that we do not know the name of ahead of time, as in the example above. Say we wanted to make a function that could print out a message with the status of value of ANY variable. How could we do this? 

In the example above, our function explicitly printed out variables `a` and `b`. But this only works because I know in advance that the person using my function has defined variables `a` and `b`. But what if I want to print the value of variable `c`? 

To allow functions to be more generic, and therefore more "reusable" in general, Python allows you to define "input variables" for your function. The syntax for this is the following:

```{code-cell} python
def function_name(x):
    ...
```

When you do this, for the code INSIDE your function, a variable `x` will be defined that will have the value given by the input value given to the function by the user. Let's look at a specific example:
<!-- #endregion -->

```python
def print_status2(x):
    print("The value passed to the function is", x)

a = 1.5
print_status2(a)

a = 1+1j
print_status2(a)

print_status2(1.5323)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-34acac6dd514c884", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
How does this work? 

When the function `print_status(a)` is called, Python "sends" ("passes" in computer speak) the value of `a` to the function. Inside the function, Python creates a new (temporary) variable called `x`, that is defined ONLY while the function code is running. This temporary variable `x` is then assigned the value that was sent to the function, and then the code is executed. When the function is finished, the variable `x` is destroyed. (Try adding the code `print(x)` above outside the function and see what happens!)

Note, as you can see in the third example, the things you pass to functions do not even need to be variables! This is fine because the function only needs the value of the argument that is passed to the function. 
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-53fd3c06a26175a3", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB2_ex_type_number
Ask the user to type a number $x$, calculate its square $x^2$ and return the value as a one-decimal float (peak at notebook 1 how to properly do so using %f).
```
<!-- #endregion -->

```python
# Your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-581873fe20420dc6", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB2_mult_inp)=
### Functions with multiple inputs

Functions can also take multiple input variables. To do this, you put them all in between the brackets `()`, separated by commas. For example, with 3 variables, the syntax is:

```{code-cell} python
def function_name(variable1, variable2, variable3):
    ...
```

You would then use this function in the following way:

```{code-cell} python
function_name(argument1, argument2, argument3)
```

When you do this, inside the function, `variable1` will get assigned the value of `argument1`, `variable2` will get assigned the value of `argument2`, and `variable3` will get assigned the value of `argument3`. This matching of the position in the list is called matching by "positional order".  

Note that there are several different names used for the "input variables" of a function: often, computer scientists will also use the name "input arguments" (or just "arguments), or "input parameters" (or just "parameters"). 
<!-- #endregion -->

```python
def print_status3(x, y):
    print("The value of the first input variable is ", x)
    print("The value of the second input variable is ", y)

print_status3(1,2)
print_status3(2.5,1.5)
print_status3(a, 2*a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-78e05b5cbe11902b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB2_ex_status
Make a  new function `print_status4()` that takes three variables as arguments and prints out messages telling the user the values of each of them (as above, but with three input variables). Test it to make sure it works. 
```
<!-- #endregion -->

```python
# Your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-fbf7e40e800af968", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB2_func_return)=
### Functions that return a value

In addition to receiving values as inputs, functions can also send back values to the person using the function. In computer programming, this is called the "return value". 

When you create a function, you can use the `return` command to specify what value should be sent back to the person using the function. Let's look at an example:
<!-- #endregion -->

```python
def my_formula(x):
    y = x**2 + 3
    return y
```

In this case it could be more convenient just to type:

```python
def my_formula(x):
    return x**2 + 3
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-3da704c82b41c669", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
To "capture" the value returned by the function, you can assign it to a variable, or just directly "use" the result of the function if you want:
<!-- #endregion -->

```python
result = my_formula(3.5)
print(result)
print(my_formula(4.6))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-9710d6768449ded8", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note that as soon as python sees the `return` command, it stops running the function, so any code after it will not be executed:
<!-- #endregion -->

```python
def myfunction(x):
    print("This gets printed.")
    return x**2 + 3
    print("This does not.")
    
print(myfunction(5))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-aef6b10798831fa6", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
If you want to send back more than one result to the user of your function, you can separate the results with commas when you use the `return` command. 
<!-- #endregion -->

```python
def functie(x,y):
    return x**2, y**3

s, p = functie(2,4)
print(s,p)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-c20b50841a685607", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB2_ex_two_real
Write a function that takes two real numbers as input and returns the sum and product of the two numbers. In your function, try to send *both* of the calculated numbers back as a return value. 
```
<!-- #endregion -->

```python
# Your function here
def product_and_sum(...):
    ...
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-35103493f788b1d5", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB2_ex_calc_sum
Now USE your function to calculate the sum and product of `a` and `b`, "capturing" the sum and product in variables `s` and `p`:
```
<!-- #endregion -->

```python
a = 1.5
b = 2.5

#...some code that uses the return value of your function to set variable s and p...

print("Sum is:", s)
print("Product is:", p)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-af1bcb8c3a7ded79", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB2_func_import)=
### Importing functions from libraries

One of the big advantages of Python is that there are huge collection of libraries that include code for doing a huge number of things for you! We will make extensive use of the library `numpy` for numerical calculations in Python, and the library `matplotlib` for generating scientific plots. Beyond this, nearly anything you want to be able to do on a computer can be found in Python libraries, which is one of the reasons Python is so popular. 

In order to make use of these libraries of code, you need to "import" them into the "namespace" of your kernel. 

("Namespace" is Python-speak for the list of functions and variable names that you can find in the running copy of Python that is connected to your notebook.)

Here, we will show you a few examples of different ways of importing code into your notebook from a library (also called a "module"). For this, we will take the example we used already in Notebook 1: in the module `time`, there is a function called `sleep()` that will perform the task of "pausing" for a number of seconds given by the its argument. 

You can find out more about the `time` module by looking at its [documentation webpage](https://docs.python.org/3/library/time.html)

and specifically about the `sleep()` function [here](https://docs.python.org/3/library/time.html#time.sleep)

(NB2_func_import_mod)=
### Importing a whole module

The simplest way to be able use the `sleep`  function of the `time` module is to import it using the following command:
<!-- #endregion -->

```python
import time
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-6ebea512349a5084", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
You can see it has been imported by using the `%whos` command: 
<!-- #endregion -->

```python
%whos
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-6d7e43494d90fc23", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Once it has been imported, you can access all the functions of the module by adding `time.` in front of the function name (from the time module) in your code:
<!-- #endregion -->

```python
print("Starting to sleep")
time.sleep(5)
print("Done!")
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-36d70980cc576500", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
If you import the whole module, you will have access to all the functions in it. To see what functions are in the module for you to use type `dir(time)`, which will generate this list.
<!-- #endregion -->

```python
dir(time)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-36d70980cc576500", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Sometimes, if you will be using the functions from the module a lot, you can give it a different "prefix" to save yourself some typing:
<!-- #endregion -->

```python
import time as tm
print("Starting to sleep")
tm.sleep(5)
print("Done!")
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-f6efa5c8f5b4ef63", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
We will use this a lot when using the `numpy` module, shortening its name to `np` when we import it, and also for the `matplotlib.pyplot` submodule, which we will shorten to `plt`. (These are also typically used conventions in the scientific community.)
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-7f7189cfda3188a5", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB2_func_imp)=
#### Importing a single function

You can also import a single function from a library:
<!-- #endregion -->

```python
from time import sleep
from datetime import datetime
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-b9ce119a2966790a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
When you do this, the function `sleep()` will be available directly in your notebook kernel "namespace" without any prefix:
<!-- #endregion -->

```python
start_timer = datetime.now()
print("Starting to sleep")
sleep(5)
print("Done!")
end_timer = datetime.now()
print(end_timer-start_timer)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-d62c06ba6b0ce825", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Using `%whos`, we can now see that we have three different ways to use the `sleep()` function. We also used a self-built stopwatch showing how long it took to run some code. This is a very convenient way to improve your own code, speeding it up is especially important when using large chunks of code.
<!-- #endregion -->

```python
%whos
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-6f0445a2973bf90c", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
If you look around on the internet, you will also find people that will do the following

```{code-cell} python
from numpy import *
```

This will import all the functions from numpy directly into the namespace of your kernel with no prefix. You might think: what a great idea, this will save me loads of typing! Instead of typing `np.sqrt()` for example, to use the square-root function, I could just type `sqrt()`. 

While true, it will save typing, it also comes with a risk: sometimes different modules have functions that have the same name, but do different things. A concrete example is the function `sqrt()`, which is available in both the `math` module and the `numpy` module. Unfortunately, `math.sqrt()` will give an error when using numpy arrays (which we will learn more about in later notebooks). 

```{tip}
Don't use the math library, especially not in combination with numpy - it will do weird stuff.
```

If you import both of them, you will overwrite these functions by the second import, and if you're not careful, you will forget which one you are using, and it could cause your code to break. It will also "crowd" your notebooks namespace: using the `whos` function, you will suddenly see hundreds or even thousands of functions, instead of only just a module. 

For these reasons, it is generally advised not to use `import *`, and it is considered poor coding practice in modern Python.
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-59161c880f8689e6", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB2_shifttab)=
#### Shift-Tab for getting help

Like the tab completion we saw in the first notebook, Jupyter also can give you help on functions you have imported from libraries if you type `Shift-Tab`. 

Say I forgot how to use the `datetime()` function. If I type the word "datetime" and then push `Shift-Tab`, Jupyter will bring up a help window for that function.

Try it: click on any part of the word `datetime` in the following code cell and push `Shift-Tab`:
<!-- #endregion -->

```python
datetime
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-7daff037eb77301f", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
You can also find the same help as the output of a code cell by using the `help()` function:
<!-- #endregion -->

```python
help(datetime)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-c7820259378fabba", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
There are extensive online resources for many modules. The most used modules have helpful examples. 
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-3c31a778f00cba2b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB2_ex_abs
Find help for the built-in functions `abs`, `int`, and `input`. Which of the help functions are easy to read? Which one does not provide such useful information (compared to the online documentation page)? (Put each help command in a separate cell)
```
<!-- #endregion -->

```python
# Your code here

```

```python
# Your code here

```

```python
# Your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-76f8da331b6edf11", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB2_ex_glob
Import the function `glob` from the library `glob` and print its help information. What does the function `glob("../*")` do? 
```
<!-- #endregion -->

```python
# run the help here
```

```python
# your code here
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-10519772f1b5d68a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB2_glob_var)=
## Global variables, local variables, and variable scope

In our first functions above, we saw a couple of examples of using variables inside functions. 

In the first example, we used the variables `a` and `b` inside our function that we created outside our function, directly in our notebook. 

In the second example, we used the "temporary" variable `x` inside our function. 

These were two examples of different variable "scope". In computer programming, <a href=https://en.wikipedia.org/wiki/Scope_(computer_science)>scope</a> define the rules Python uses when it tries to look up the value of a variable. 

In the slightly simplified picture we will work with here, variables can have two different types of "scopes": **global scope** and **local scope**. 

If Python looks for a variable value, it first looks in the local scope (also called `local namespace`). If it does not find it, Python will go up into the global scope (also called the `global namespace`) and look for the variable there. If it does not find the variable there, it will trigger an error (a `NameError` to be precise).

How do I create a global variable? By default, if you create a variable directly in your notebook (and not in a function in your notebook), it will always be **global**. So, actually, you've already created a bunch of global variables! 

Any variables you define inside a function in your code will be a **local** variable (including the input variables automatically created if your function takes any arguments). 

If you want to create a global variable inside a function, or make sure the variable you are referring to is the global variable and not the local one, you can do this by the `global` qualifier, which we will look at in a minute. 

Let's take a look at this in more detail by analysing a few examples. 

**Example 1** Accessing a global variable inside a function
<!-- #endregion -->

```python
a1 = 5

def my_func():
    print(a1)
    
my_func()
a1 = 6
my_func()
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-b4bb5a3316fe89c9", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In this example, when Python is inside the function `my_func()`, it first looks to see if there is a variable `a1` in the local scope of the function. It does not find one, so it then goes and looks in the global scope. There, it finds a variable `a1`, and so it uses this one. 


**Example 2** An example that doesn't work (unless you've run the next cell, in which case it will only fail again after you restart your kernel)
<!-- #endregion -->

```python
def my_func():
    print(b1)
    
my_func()
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-10458e43f3723d0b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
This code gives a `NameError` because there is no variable `b1` yet created in the global scope. If we run the following code cell and try the code above again, it will work. 
<!-- #endregion -->

```python
b1 = 6
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-6074899777a25fae", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Here you can see one risk of languages like Python: 
```{warning}
because of the persistent memory of the kernel, code can succeed or fail depending on what code you have run before it...
```
```{tip}
This is why you kill your kernel, clear all outputs and re-run the entire script!!
```

If you want to see the error message above again, you can delete variable `b1` using this code and run it again:
<!-- #endregion -->

```python
del b1
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-e5003608c97f5668", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
**Example 3** Variables defined in the local scope of a function are not accessible outside the function
<!-- #endregion -->

```python
def my_func():
    x = 5
    
my_func()

print(x)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-d65b38344a2c4136", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
**Example 4** Variables passed to functions cannot be modified by the function (more on this later when we look at more complicated data structures...sometimes this is different)
<!-- #endregion -->

```python
def my_func(a):
    a = 6
    
a=5
my_func(a)
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-7f9a0c6f80607325", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
This one is a bit subtle (mega-confusing?) because we re-used the same name `a` for the local variable in the function as the global variable outside of the function. However, the operation is quite logical. When the function code starts running, it creates a `local` variable `a` to store the value it received. And now, because there is already a local variable called `a`, using `a` in the function refers to the `local` variable `a`, not the `global` variable `a` we define before calling the function. 
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-5aa7c9bac0e183c9", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
**Example 5** This one is a tricky one.
<!-- #endregion -->

```python
a = 6

def my_func():
    a = 7

print(a)
my_func()
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-f637454870e0a4ec", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
 It would seem that the function would refer to the global variable `a` and therefore change it's value. However, it is tricky since we first use `a` in the function in an assignment. An assignment in python will automatically create a variable if it does not exist, and so python creates a new variable named `a` in the local scope. The name `a` inside the function now refers to this newly created local variable, and therefore the global variable will not be changed. In fact, this guarantees that you cannot change global variables inside a function, unless you use the `global` qualifier shown in the next example.
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-a2c1c2099359531d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
**Example 6** If you want to make sure that the `a` inside your function is referring to the global variable `a`, you can include the line `global a` inside your function to tell python that you mean the global variable `a`. 
<!-- #endregion -->

```python
a = 6

def my_func():
    global a
    a = 7

print(a)
my_func()
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-b86006c7d643e2ba", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note that in general, it is considered bad programming practice to use (too many) global variables. Why? When you write longer and bigger sections of code, it is easier to understand what is going on in your function if your function uses only local variables and communicates back and forth using input parameter and return variables. Using too many global variables in a function can be confusing because they are defined in a different place in your code and so you don't have a good oversight of them. (Bigger projects can easily have  10,000+ lines of code!)  

In computer science, this is a topic of often intense debate (resulting in what nerds refer to as a [flame war](https://www.urbandictionary.com/define.php?term=flame%20war)), with global variables being branded as "dangerous" like in this [stack exchange post](https://stackoverflow.com/questions/423379/using-global-variables-in-a-function)

But we might agree with the comments in this post that "global variables have their place but should be used sparingly".

Summary of the rules for global and local variables:

* If a local variable of the same name exists or is created by Python (by assignment, for example), then python uses the local varible
* If you try to use a variable name that does not exist locally, Python checks for a global variable of the same name
* If you want to change the value of a global inside a function, then you must use the `global` statement to make it clear to Python than you want that name to refer to the global variable
<!-- #endregion -->

```{exercise}
:label: NB2_ex_print_f0
Make a function, dependent on one variable, that may be any differentiable function. You can use any combination of standard functions (e.g. np.sin, np.exp). Use this function to print the values f(0) and f(1).
```

```python
import numpy as np
def f(x):
    return ...
```

```{exercise}
:label: NB2_ex_tangent
We want to find the tangent line at a given value of our function. For this, you may approximate the slope by $\frac{\Delta y}{\Delta x} = \frac{f(a+\epsilon) - f(a-\epsilon)}{2 \epsilon}$, where $\epsilon$ is a sufficiently small number (note that Python's float type is limited to a number of digits, so $\epsilon$ should not be smaller than 1e-8) and $a$ is the point at which we want the tangent line. Make a function that, given a certain point, returns the slope.
```

```python
def determine_slope(a, epsilon):
    dy = ...
    dx = ...
    return dy/dx
```

```{exercise}
:label: NB2_ex_tangent_func
We want to write the tangent line in the form $y = mx + b$. Make a function that, given a point, print outs the tangent line. Hint: use your previously defined functions.
```

```python
def print_tangent(a, epsilon):
    m = ...
    b = ...
    print(...)
    
epsilon = ...
a       = ...
print_tangent(a, epsilon)
```

(NB2_plot)=
## Plotting data and functions with Matplotlib

We already encountered a plot in one of the first assignments. Physicist always want to  plot the data to see what it looks like! The [Matplotlib library](https://matplotlib.org) allows us just to do that.

```{iframe} https://www.youtube.com/embed/qErBw-R2Ybk
:width: 50%
```

(NB2_plotbasics)=
### Plotting basics

Specifically, we will need the [pyplot module of matplotlib](https://matplotlib.org/api/_as_gen/matplotlib.pyplot.html#module-matplotlib.pyplot)

We will import it with the shortcut / "name" / "prefix" plt:


```python
import matplotlib.pyplot as plt
import numpy as np
```

The routine for making [line plots of your data](https://matplotlib.org/api/_as_gen/matplotlib.pyplot.plot.html) is `plt.plot()`: 

We present you a plot with some additional features. Read the code, change values, colors and so on and see the result. Try to understand how each of the changes affect your plot (predict - observe - explain). Note that we included many optional elements, without these Python can perfectly create a proper graph for you.

```python
x = np.arange(0,10,1)
y = 2*x**2
z = 15*x+2

plt.rcParams['figure.dpi'] = 300 #used to set proper display resolution 

plt.figure(figsize=(5, 4))
plt.xlabel("$x$ (m)")
plt.ylabel("$t$ (s)")

plt.plot(x,y,'k.',markersize='4',label='quadratic function')
plt.plot(x,z,'r+',label='linear function')

plt.legend(loc='upper left')

plt.xlim(0,10)
plt.ylim(0,180)
plt.grid() #adds a grid to the plot, not always appreciated by scientists.
plt.axhline(0, ls='-', lw=1, c='grey')
plt.axvline(0, ls=':', lw=1, c='grey')

plt.savefig('my_first_fig.pdf')
plt.show()
```

If you look in the file browser, you will now see a file my_first_fig.pdf. If you open it, you will see that is a high-quality vector graphics PDF.


```{exercise}
:label: NB2_ex_dataset
Below we have a dataset where we expect the data to be based upon the formula $y = a \cdot x + b$. To check whether this is correct, carry out the following tasks:
* plot the raw data as black dots
* write a function for the formula with input variables a and b
* make an estimated guess for the values of a and b
* use the test variable as input to calculate the corresponding values for y
* plot these values for x and y in the same graph, use a red dotted line
```

```python
x = np.array([1.1, 3.4, 4.7, 5.3, 6.8])
y = np.array([1.05, 1.62, 1.95, 2.10, 2.47])

x_test = np.linspace(0,1.2*max(x),1000)

def func(x,a,b):


```

```{exercise}
:label: NB2_ex_coulomb
Coulomb's law reads $F = k_e\frac{q_1\cdot q_2}{r^2}$ in which $k_e$ is Coulomb's constant $k_e = 8.988*10^9 \; \mathrm{N m}^2\cdot \mathrm{C}^{−2}$, $q$ denotes the magnitude of the charge (could be negative value as well!) and $r$ the distance between the charges. 

Write a function that calculates the force between a given number of (opposite) charges and the distance between them.
```

```python
def F(q1,q2,r):
    #your code
```

```{exercise}
:label: NB2_ex_plot
Make a plot that shows the force as function of distance between a proton and an electron in the range $0.5 - 6$ ångström. 
```

```python
#your code

plt.figure()
#your code

```
