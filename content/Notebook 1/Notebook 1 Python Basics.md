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

(NB1)=
# Python for physicists, an introduction


(NB1_pre)=
## Pre/Post-test
This test is for testing your current skills in Python. You can use it in two ways:
* pre-test: to test your skills beforehand. If you are already proficient in Python, and can do this test within approximately 15 minutes, you can scan through this notebook rather than carefully reading each sentence.
* post-test: to test your skills after Notebook 1. Check whether you learned enough.

If you have not done any programming before, you skip this test and use it as a posttest.

**Fixing Python errors in a database**

Eric has recently taken up a new job at the University. His first job is to work on the TU database. As the previous programmer was a lazy basterd, the code has many flaws. Yes.... your job is to fix these.

In the TU database information on the building locations are stored. However, when printing the information, errors are reported (see below). 

**1)** Fix the errors so that the information is printed correctly.

```python
Street_name = 'Lorentzweg '
Number = 1
Full_adress = Street_name + Number

print(Full_adress)
```

In building a larger database, Eric decides to store the data in a different way, much more convenient than the use of multiple dubious variable names. Below, a first attempt is made. However, due to a typo, one address needs to be changed. But the method used to fix the problem is not working. 

**2)** Explain why it is not working in this way.

**3)** Fix the error(s).

**4)** Explain why the chosen type, written by the former programmer, is not completely nonsense.

```python
Building = (22,58)
Streetname = ('Lorentzweg ', 'Van der Maasweg ')
Number = ('1','8')
Number[1] = '9'

Full_adress = Building[1] + Streetname[1] + Number[1]
print(Full_adress)
```

<!-- #region -->
(NB1_learningobjectives)=
## Learning objectives

Python has become the standard programming language in physics research. To teach you the basics of programming (in Python) we have prepared six notebooks for you, each notebook focussing on a different aspect. The first three notebooks relate to the basics of programming. Notebook 4 and 5 relate to data-analysis in physics using Python. The last notebook focusses on the statistics related to measurement uncertainty.  

In this course, you will work using a platform called "Jupyter Notebooks". Jupyter notebooks are a way to combine formatted text (like the text you are reading now), Python code (which you will use below), and the result of your code and calculations all in one place. Go through these notebooks and run the examples. Try to understand their functioning and, if necessary, add code (such as print statements or variable overviews) to make it clear for you. In addition, there are exercises and practice cells where you can program for yourself. Don't be afraid to start coding yourself: writing code and making mistakes is the best way to learn Python.

In this notebook, you will learn the basic concepts of programming in Python. To get started, we will first explain the basic concepts of what Python is and how it works. 

After completing this notebook, you are able to:
* start the python interpreter and run code in a notebook
* stop and start notebook kernels
* create variables
* use `%whos` to list the variables stored in the memory of the python kernel
* determine the type of a variable 
* convert between different variable types (float, int, etc)
* collect user input using the `input()` command
* print variable values using the `print()` command
* use list, tuples and np.arrays and understand the differences
* combine arrays and insert data


We have embedded various YouTube clips in the first notebooks, which are **NOT** required to watch (we even recommend to not look at these videos because these are time consuming!) but might provide additional help and information when necessary. The last two notebooks include prerecorded lectures that we recommend to watch.

The solutions for the exercises in this notebook, and future ones, can be found at the bottom of the notebook, so that you can check your answer or have a peek if you are getting stuck. But don't look too quickly... thinking about how to solve a problem rather than solving it using the answers is much more educational!

```{iframe} https://www.youtube.com/embed/bxWrXhLFN2s
```

<!-- #endregion -->

(NB1_note)=
## NOTE

When programming in the browser, some of the exercise cannot be made. For instance, stopping and rerunning the kernel is not possible. Also, it is not possible to ask input from the user. Once you have installed the software, you can return to these exercises and try to run them again.

Also, your code will be lost when programming in the browser. Write down the code you want to keep!

<!-- #region nbgrader={"grade": false, "grade_id": "cell-e68e92ac1082dd04", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB1_whatis)=
## What is Python? And what are Jupyter Notebooks?

Python is an [interpreted computer programming language](https://en.wikipedia.org/wiki/Interpreted_language) . Using Python, you can ask your computer to do specific things, like perform a calculation, draw a graph, load data from a file, or interact with the user. 

Every time you run Python, either by running it on the command line, or by running it in a Jupyter notebook like you are now, a Python **"kernel"** is created. This kernel is a copy of the Python program ("interpreter") that runs continuously on your computer (until you stop it).

Jupyter notebooks are a way to interact with the Python kernel. Notebooks are divided up into "cells", which can be either a text cell (in a special text formatting language called [markdown](https://en.wikipedia.org/wiki/Markdown), like the one you are reading now. There are also code cell  (containing your code), like the cell below it. 

The selected cell is surrounded by a box. If you press "ENTER" in a text cell you can start editing the cell. If you push "Run" above, or push "Shift-Enter", the code will be "run". If it is a code cell, it will run a command (see below). If it is a markdown cell, it will "compile" the markdown text language into formatted (HTML) text. 

You can give commands to this kernel by typing commands using the Python language into the code cells of the notebook. Here, you can find an example of a code cell that contains a simple Python command `print`, which prints a text string to the command line.
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ee6ac0827c6a6783", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
To send this command to the Python kernel, there are several options. First, select the cell (so that it is either blue or green), and then:

1. Click on the **Run** button above in the toolbar. This will execute the cell and move you to the next cell.
2. Push **Shift-Enter**: this will do the same thing
3. Push **Control-Enter**: this will run the cell but leave it selected (useful if you want to re-run a cell a bunch of times)

When you run the cell, the code will be sent to the Python kernel, which will translate your Python command into a binary language your computer CPU understands, send it to the CPU, and read back the answer. If the code you run produces an "output", meaning that the kernel will send something back to you, then the output that your code produces will be displayed below the code cell in the "output" section of the code cell. This is a scheme of what this process looks like "behind the scenes": 

```{figure} Notebook_1_behind_the_scenes.png
:width: 50%
```

After you have run the code cell, a number will appear beside your code cell. This number tells you in which order that piece of code was sent to the kernel. Because the kernel has a "memory", as you will see in the next section, this number can be useful so that you remember in which order the code cells in your notebook were executed. 

In the example above, the code cell contains only a single line of code, but if you want, you can include as many lines as you want in your code cell:
<!-- #endregion -->

```python
print("Hello")
print("world")
print("Goodbye")
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8698bcb51f5ce066", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In the above, the text in the code cell are all Python commands. In addition, if you start a line in a code cell with a `#`, Python will ignore this line of text. This is used to add **comments** to your code. It is good programming practice to use comments to explain what the code is doing:
<!-- #endregion -->

```python
# This will print out a message
print("This is a message")
```

It might be hard at first to write proper comments. The comments should be short but still add information that is of value. One can question the value of the comment above as it hardly adds information to what the code is already saying... Some more information can be found [here](https://stackabuse.com/commenting-python-code/).

<!-- #region nbgrader={"grade": false, "grade_id": "cell-4919a733b4210f11", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
Print your own string to the command line. Can you print special characters as well?
```
<!-- #endregion -->

```python
# your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-74c3c19c58006da4", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB1_memory)=
### The Python kernel has a memory
In addition to asking Python to do things for you, like the "Hello world" example above, you can also have Python remember things for you. To do this, you can use the following syntax:
<!-- #endregion -->

```python
a = 5
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-84c1e3509c93658b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In Python, the `=` symbol represents the **assignment operator**: it is an instruction to **assign** the value of `5` to the variable `a`. If variable `a` already exists, it will be over-written with the new value (in fact, `a` is a Python object). If variable `a` does not yet exist, then Python will create a new variable for you automatically.

For you, the cell above will create a "variable" named `a` in memory of the Python kernel that has the value of 5. We can check this by printing the value of a:
<!-- #endregion -->

```python
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-99b80d998fcc74ff", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Besides numerical values variables can also be strings, which are sequences of characters. You make a string by putting the text between quotes, as seen above in "Hello World".

Note that we can also add a message if we add a string and a numerical value in the `print()` statement by combining things with commas:
<!-- #endregion -->

```python
print("The value of a is", a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-a4382a92b6e9aeec", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise} 
Combine multiple strings and numerical values in a single `print` statement using the `,` separator.
```
<!-- #endregion -->

```python
# your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-cbf03d005dae5d5d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise} 
Change the value of `a` to 7 by executing the following cell, and then re-run the **above** cell containing the command `print(a)` (the one with output `5`). What value gets printed now in that cell?  
```
<!-- #endregion -->

```python
# your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-2b713ce46a7bca48", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
As you can see in notebooks that the location of your code doesn’t matter, but the order in which you execute them does!!

We can also use variables to set the values of other variables:
<!-- #endregion -->

```python
b = 0
print(b)
b = a 
print(b)
```

A 'funny' thing happens with the command **b = a**. As we say that b and a are the same, rather than creating a new spot in the memory where the information is stored, the variables **b** and **a** obtain the same *memory address*. If we call upon **a**, Python searches its memory, and obtains the data stored at that  unique id. We can see this using **id** function. 

```python
print(id(a))
print(id(b))
a = 5
b = 10
print(id(a))
print(id(b))
```

This is important to know because if we say **a = b** and we change the value of **b**, the value of **a** changes as well! We will go into more detail later on.  

<!-- #region nbgrader={"grade": false, "grade_id": "cell-16240c968680ffa4", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Sometimes, if you execute a lot of cells, or maybe even re-execute a cell after changing its contents, you might lose track of what variables are defined in the memory of your Python kernel. For this, there is a convenient built-in "magic" command called `%whos` that can list for you all the variables that have been defined in your kernel, along with their values:
<!-- #endregion -->

```python
a=5 
%whos
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-d61c3a57fbd93ed6", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
_(Some notes about `%whos`: `%whos` is not a "native" command of the Python language, but instead a "built-in" command that has been added by the creators of Jupyter. Because of this, you cannot use it outside of Jupyter / iPython...)_

If we define some new variables, they will also appear in the list of defined variables if you execute `%whos`:
<!-- #endregion -->

```python
c = 10
d = 15.5
```

```python
%whos
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-bea496517f99df02", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In this case the variables' names are displayed, their values, but also their type. Type defines the format in which a variable is stored in memory. In this case `int` stands for integer and `float` stands for floating point number, which is the usual way in which real numbers are stored in a computer. We will learn more about Python variable types below.
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-80d1461986f4d365", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
### Starting and stopping the kernel

When you open a notebook for the first time, a new kernel will be started for you, which will have nothing in its memory. 

Important to understand: if you close the tab of your browser that has the notebook, Jupyter **will not** shut down the kernel! It will leave the kernel running and when you re-open the notebook in your browser, all the variables you defined will still be in the memory. You can test this by closing this notebook right now, clicking on the link to open it in the "tree" file browser tab of Jupyter, and then re-running the cell above with the command `%whos`. 

How do I shutdown a kernel? And how do I know if a notebook on my computer already has a kernel running? 

* First, as you may have noticed, when you closed this notebook and went back to the "tree" file browser, the notebook icon had turned green. This is one way that Jupyter tells you that a notebook file has a running kernel.

* Second: in the "tree" view of the Jupyter interface, there is a link at the top to a tab "Running" that will show you all the running kernels and allow you to stop them manually. 

Sometimes, you may want to restart the kernel of a notebook you are working on. You may want to do this to clear all the variables and run all your code again from a "fresh start" (**which you should always do before submitting an assignment!!!! Kill the kernel, run all cells and kill the kernel again. Any errors show up directly**). You may also need to do this if your kernel crashes (the "status" of your kernel can be seen in the icons at the right-hand side of the Jupyter menu bar at the top of the screen). 

For this, there is both a menubar "Kernel" at the top, along with two useful buttons in the toolbar: 

* "Stop": tells the kernel to abort trying to run the code it is working on, but does not erase its memory
* "Restart": "kill" the kernel (erasing its memory), and start a new one attached to the notebook.

```{figure} Notebook_1_stop_button.png
:width: 20%
```

```{figure} Notebook_1_restartkernelmenu.png
:width: 60%
```

To see this in action, you can execute the following cell, which will do nothing other than wait for one minute:
<!-- #endregion -->

```python
from time import sleep
sleep(60)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-6c0352859b13ed82", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
You will notice that while a cell is running, the text beside it shows `In [*]:`. The `*` indicates that the cell is being executed, and will change to a number when the cell is finished. You will also see that the small circle beside the `Python 3` text on the right side of the Jupyter menu bar at the top of the page will become solid. Unless you have a lot of patience, you should probably stop the kernel, using the "Stop" button, or the menu item "Kernel / Interrupt".

```{exercise}
List the stored variables using the `%whos` command. Subsequently, restart the kernel. What variables are stored in the memory of the kernel before and after the restart? 
```
<!-- #endregion -->

```python
# your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-fd74d0d65cf02f0a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB1_Pyt_var)=
## Python variable types

As we saw above, in Python, variables have a property that is called their "type". When you use the assignment operator `=` to assign a value to a variable, Python will automatically pick a variable type it thinks fits best, even changing the type of an existing variable if it thinks it is a good idea. 

You have, in fact, already seen information about the types of variables in the `%whos` command again:
<!-- #endregion -->

```python
%whos
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-6f2bfadc72282277", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In the second column, you can see the **type** that Python chose for the variables we created. `int` corresponds to integer numbers, `float` corresponds to floating-point numbers. You can see that for variable `c`, Python had to choose a `float` type (because 15.5 is not an integer), but for `a` and `b`, it chose integer types. 

_(In general, Python tries to choose a variable type that makes calculations the fastest and uses as little memory as possible.)_

If you assign a new value to a variable, it can change the variables type:
<!-- #endregion -->

```python
a = a/2
type(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8ac075dfca80d989", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Because 5/2 = 2.5, Python decided to change the type of variable `a` from `int` to `float` after the assignment operation `a = a/2`. 

When you are using floating point numbers, you can also use an "exponential" notation to specify very big or very small numbers: 
<!-- #endregion -->

```python
c = 1.5e-8
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-9f4aa0b51687698a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
The notation `1.5e-8` is a notation used in python to indicate the number $1.5 \times 10^{-8}$.

A third type of mathematical variable type that you may use in physics is a complex number. In Python, you can indicate a complex number by using `1j`, which is the Python notation for the complex number $i$:
<!-- #endregion -->

```python
d = 1+1j
type(d)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-212eb128ab19078d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
The notation `1j` is special, in particular because there is **no space** between the number `1` and the `j`. This is how Python knows that you are telling it to make a complex number (and not just referring to a variable named `j`...). The number in front of the `j` can be any floating point number. For example:
<!-- #endregion -->

```python
0.5j
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-770f5a2d267d39b4", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In addition to the mathematical variable types listed above, there are also other types of variables in Python. A common one you may encounter is the "string" variable type `str`, which is used for pieces of text. To tell Python you want to make a string, you enclose the text of your string in either single forward quotes `'` or double forward quotes `"`:
<!-- #endregion -->

```python
e = "This is a string"
f = 'This is also a string'
type(e)
```

```python
print(e)
print(f)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-6e76757478040b18", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
You can also make multiline strings using three single quotes:
<!-- #endregion -->

```python
multi = \
'''
This string
has 
multiple lines.
'''
print(multi)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-31e4b55de81cef07", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note here that I have used a backslash: this a way to split Python code across multiple lines. 

Although it's not obvious, Python can also do "operations" on strings, the `+` mathematical operators we saw above also works with strings. 

```{exercise}
Discover what the `+` operator does to a string, i.e. print the output of the sum of two strings.
```
<!-- #endregion -->

```python
# Your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-1fa7be3de8eb7f5a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
A useful variable type we will introduce here is the "boolean" type `bool`. A boolean variable can have two values: `True` or `False`. You type them in directly as `True` and `False` with no quotes (you will see them turn green). 
<!-- #endregion -->

```python
g = False
type(g)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-12ff71b21d9d01e3", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
We will use boolean types much more later when we look at program control flow, but a simple example using the `if` statement is given below: 

No panic if you don't yet understand the `if` statement, there will be another entire notebook dedicated to them. This is  just  an example of why  boolean variables  exist.
<!-- #endregion -->

```python
if True:
    print("True is always true.")

if g:
    print("g is true!")
    
if not g:
    print("g is not true!")
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-7f2acb9e44b581d8", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
You can try changing the value of `g` above to `False` and see what happens if you run the above code cell again.

Also, useful to know: numbers (both `int` and `float`) can also be used in True / False statements! Python will interpret any number that is not zero as `True` and any number that is zero as `False`. 
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-4016c53a455f3656", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise} 
Discover which *numbers* can be used as `True` and `False` in Python by changing the value of `g` above and re-running the cells.
```
<!-- #endregion -->

```python

```

<div style="width:75%; margin:0 auto;">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/khKv-8q7YmY?si=xuqTRiY9S-0SDe8g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>


<div style="width:75%; margin:0 auto;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/W8KRzm-HUcc?si=Y7FuNiikMHbZIazj" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>


(NB_tuples)=
### Lists & Tuples

It often happens that you want to store data that belong together (a collection of items). You have different options, we discuss lists & tuples, and subsequent (for numerical purposes) numpy arrays.

Let us think of storing personal data where we need to know: First name; Family name; Address; City. We then can make a list, see below.

```python
Person_1 = ['Feek','Pols','Lorentzweg',1,'Delft']
print(Person_1)
print(type(Person_1), type(Person_1[0]), type(Person_1[3]))
```

It is interesting to see that Person_1 is a list and that within the list other types exist (Note: the first item is referred to by 0 as computers start to count at 0). If we make a mistake, we can replace an item in the list.

```python
Person_1[0] = 'Freek'
print(Person_1)
```

Another way we can store data is using a tuple, see below. Note that the only difference with a list is the use of the brackets.

```python
Person_2 = ('Erik','Janssen','Lorentzweg',1,'Delft')
print(Person_2)
print(type(Person_2), type(Person_2[0]), type(Person_2[3]))
```

So, what is the difference then between a list and a tuple? The most important difference is that tuples are immutable, you cannot change them:

```python
Person_2[1] = 'Jansen'
```

```python
a = [2,3,4]
b = a
b[0] = -10
print(a)
```

In the example above, something strange happens. We did not change **a**, did we? But remember that **b** is not a copy of **a** with a new location in the memory. Rather than that, **b** obtains the same location in the memory (you can check with id(a)). If we change **b**, we thus change **a**! We can also make tuples with only a single item stored. We have to make use of a comma, otherwise Python will not recognize it as a tuple.

```python
#not a tuple
n_a_t = (1)
#a tuple
a_t = (1,)

#checking
print(type(n_a_t))
print(type(a_t))
```

Lists are mutable and are thus called variables. However, a tuple cannot be varied and is thus not a variable. It is called an object. Since it is immutable, it requires less space. We can still make effective use of tuples (and lists):

```python
a = [2,3,5]
b = (2,3,5)
print(a[0]*2)
print(b[0]*2)
```

```{exercise}
Try to change the first value of **b**. In order to do so, make sure **b** becomes a list! You can make use of b = list(a).
```

```python

```

(NB1_np_arr)=
### Numpy Arrays

Until now, the variable types we have been working with in Python represent relatively simple data types:

* `int`: integer numbers
* `float`: floating point numbers
* `complex`: complex-valued floating point numbers
* `bool`: boolean "truth" values (which can have `True` and `False`)
* `str`: strings 
* `list`: mutuable list of variables
* `tuple`: immutuable list of variables

The first four are very simple data types, but actually the last one is more complicated than it looks . The `list` is a vector like-variable type. However, unlike physical vectors, it cannot be multiplied, subtracted, etc. 

Here, we will introduce a new datatype that is handy for Physics calculations and that comes from the Python software package [numpy](https://numpy.org) called **numpy arrays**.

*What are numpy arrays?*

Numpy arrays are a way to work in Python with not just single numbers, but a whole bunch of numbers. With numpy arrays these numbers can be manipulated just like you do in, for example, linear algebra when one works with vectors:

https://en.wikipedia.org/wiki/Row_and_column_vectors

For example, a (column) vector $\vec{a}$ with 5 entries might look like this:

$$
\vec{a} = \begin{bmatrix}
1 \\
2 \\
3 \\
4 \\
5
\end{bmatrix}
$$

In linear algebra you are used to manipulate these vectors, this can be done in a similar way with numpy arrays. We will use numpy arrays extensively in Python as vectors, like above, but also for storing, manipulating, and analyzing datasets (like a column of an excel spreadsheet). 

To use numpy arrays, we first need to import the numpy library, which we will do using the shortened name "np" (to save typing):

```python
import numpy as np
```

Now that we have imported numpy, we can use functions in numpy to create a numpy array. A simple way to do this is to use the function np.array() to make a numpy array from a comma-separated list of numbers in square brackets:

```python
a = np.array([1,2,3,4,5])
print(a)
```

Note  that numpy does not make a distinction between row vectors and column vectors: they are just vectors. But what if we want an array running from 0 to 100, and only the even numbers? Do we type all numbers? Certainly not! We can use for instance numpy's linspace or arange:

```python
array_evennr_1 = np.linspace(0,100,51)
print(array_evennr_1)

array_evennr_2 = np.arange(0,101,2)
print(array_evennr_2)
```

Note the difference between the two ways of making the array and their output!


```{exercise}
Make a list and a numpy array in which the values 2, 3, 5 are stored. Multiply the list and array by the value 2 and print the outcome. What is the difference between the mathematical operation on the list and numpy array? Why do we, physicists, prefer numpy arrays? 
```

```python
#your code

```

In some cases we want to add items to our array or combine different arrays into a single one. There are different ways to do that. To combine to numpy arrays, we can make use of the concatenate function. To add items at the end of our array, we can use the append function.

```python
a = np.array([1,2,3,4,5])
a = np.append(a,6)
b = np.array([6,7,8,9,10])
b = np.delete(b,0)
c = np.concatenate((a,b))
c = np.append(c,11)
print(c)
```

```{exercise}
Below we have made two arrays, one with even numbers and one with odd numbers. Combine these two arrays in a single array and sort them (see https://numpy.org/doc/stable/reference/generated/numpy.sort.html). Next, delete the third element in the array.
```

```python
even_nr = np.arange(0,10,2)
print(even_nr)
odd_nr = np.arange(1,11,2)
print(odd_nr)
#your code

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-c1323d47dae023f1", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB1_converting)=
### Converting variables between different types

We can also convert a value from one type to another by using functions with the same name as the type that we want to convert them to. Some examples:
<!-- #endregion -->

```python
float(5)
```

```python
int(7.63)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-e7f8cf2c018ef4fd", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note that when converting an `float` to an `int`, Python does not round off the value, but instead drops all the numbers off after the decimal point (it "truncates" it). If we want to convert to an integer and round it off, we can use the `round()` function:
<!-- #endregion -->

```python
b = round(7.63)
print(b)

a = 4.45
b = 4.55
a = round(a,1)
b = round(b,1)
print(a)
print(b)
```

There seems to be something odd happening here, as when we round to the first decimal number **a** and **b** obtain the same value. Why this happens is covered in the last two notebooks. It has to do with always rounding down or up results in a systematic error in the mean.

```python
print(type(b))
print(b+0.4)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-f3f5149b2d627e26", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
This works for conversions between many types. Sometimes, you will lose information in this process: for example, converting a `float` to an `int`, we lose all the numbers after the decimal point. In this example, Python makes a guess at what you probably want to do, and decides to round off the floating point number to the nearest integer. 

Sometimes, Python can't decide what to do, and so it triggers an error:
<!-- #endregion -->

```python
float(1+1j)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-582c3f589fac8746", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
A very useful feature is that Python can convert numbers into strings:
<!-- #endregion -->

```python
a = 7.54
str(a)
b = a + 1
print(b)
%whos
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-18152675870ab0f1", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
That is actually what happens when you use the `print()` commands with a numeric value.

But also very useful is that as long as your string is easily convertable to a number, Python can do this for you too! Note below that the quotation marks makes it a string!
<!-- #endregion -->

```python
float('5.74')
```

```python
int('774')
```

```python
complex('5+3j')
```

We even can convert immutable tuples to mutable lists, and back again.

```python
a = (4,5)
print(type(a))
a = list(a)
print(type(a))
a = tuple(a)
print(type(a))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ce079e7a0832a0f5", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise} 1.10`** \
Define a list of parameters with as many types as possible, i.e. all the examples you see above and maybe a few more. Use `%whos` to see how they look inside the computers' memory. Try to change their format and re-run the `%whos` command.
<!-- #endregion -->

```python
# Your parameters list
a=
b=

# Parameter formats in the computer
%whos
```
(NB1_var_names)=
### Names of variables

So far we have not talked about the names of variables. Throughout the notebook we used *a* and *b* for single variables, list, numpy arrays and so on. Each time the previous value is overwritten. Furthermore, what does *a* refers to? Is it acceleration, is it a test variable? We have no clue.

If you want to be able to read your code next year, or if you want us to be able to read your code, you have to come up with proper names for your variables. We advice you to look at the YT-movie clip below as some conventions are clearly elaborated. Also, look at the PEP 8 -- Style Guide for Python Code: https://www.python.org/dev/peps/pep-0008/
for more related tips and conventions.

```{iframe} https://www.youtube.com/embed/Uw95Uc3xgWU?si=xgfUC4-DxmYbMfmB
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-d453c295a6954f9d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
## Python can do math

Python has a set of math functions that are directly built in to the language. You can use Python as a calculator! 
<!-- #endregion -->

```python
1+1
```

So from now on, don't use your calculator or excel when working on calculations yourselves! Use Python!

Calculations also work with variables:

```python
a = 5
print(a+1)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-74f5aea3a72d2f71", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
Discover what the following Python operators do by performing some math with them: `*`, `-`, `/`, `**`, `//`, `%`. Print the value of the mathematical operation to the command line in subsequent cells.
```
<!-- #endregion -->

```python
# Try out *

# What did it do? Add your answer here:
```

```python
# Try out -

# What did it do? Add your answer here:
```

```python
# Try out /

# What did it do? Add your answer here:
```

```python
# Try out **

# What did it do? Add your answer here:
```

```python
# Try out //

# What did it do? Add your answer here:
```

```python
# Try out %

# What did it do? Add your answer here:
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8cd6e8f83013a575", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Another handy built-in function is `abs()`:
<!-- #endregion -->

```python
print(abs(10))
print(abs(-10))
print(abs(1j))
print(abs(1+1j))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ec6f5beb19edae73", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
You can find the full list of built-in math commands on the [Python documentation webpage](https://docs.python.org/3/library/stdtypes.html#numeric-types-int-float-complex).
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-9873288c26d190e4", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB1_send_data)=
## Sending data to Python using input()

So far, we have seen examples of "output": Python telling us stuff, like in the first "Hello world" example above. 

And we have seen examples of "code": us giving instructions to Python to do things. 

In addition, we can also send stuff to Python. Often in physics, we do this by having Python read data files, which we will cover later, but we can also send information to Python using the `input()` command:
<!-- #endregion -->

```python
a = input()

print()
print("The input was:")
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-84fd218d798174b7", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Here something seemingly odd happens: even if we type a number into the input box, it will *always* return a string variable of type `str`:
<!-- #endregion -->

```python
type(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8f2b377eabcbec2b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
If we want to use our input as a number, we have to convert it to a number, for example, by using the `float()` function. Moreover, it might be handy to tell the user what he or she is supposed to do. You can specify text for the label of the input box: 
<!-- #endregion -->

```python
a = input("Enter a number: ")
a = float(a)
print("\nThe value of a is:", a)
print("a has the type:", type(a))
```

A very useful tool is string formatting (https://realpython.com/python-string-formatting/). We can tell Python that a number is comming, specify its type and later include the number:

```python
print('The number given by the use is %.1f ' %a) #prints 1 dec float
print('The number given by the use is %d ' %a) #prints as integer
print('The number given by the use is %e ' %a) #prints with scientific notation
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-39dc108b097dadf4", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
Use the `input` function to get parameters of integer, float and string format into the computer. Have Python check whether the proper type is assigned.
```
<!-- #endregion -->

```python
# Your code here

```

```python

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-53972ca5ec4efa32", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB1_tab_compl)=
## Tab completion in Jupyter Notebooks


Computer programmers often forget things, and often they forget what variables they have defined. Also, computer programmers always like to save typing if they can. 

For this reason, the people who made Jupyter notebooks included a handy feature called "TAB completion" (which is actually something that has been around for [a long time](https://en.wikipedia.org/wiki/Command-line_completion) in unix and ms-dos command line environments). 

The idea is that if you start typing part of the name of a variable or part of the name of a function, and then push the `TAB` key, Jupyter will bring up a list of the variable and function names that match what you have started to type. If only one matches, it will automatically type the rest for you. If multiple things match, it will offer you a list: you can either keep typing until it's unique and press TAB again, or you can use the cursor keys to select the one you want.
 
Here is an example: 
<!-- #endregion -->

```python
this_is_my_very_long_variable_name = 5
this_is_another_ones = 6
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-df0c3eda1082e7ed", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Now click on the following code cell, go the end of the lines in this cell and try pushing `Tab`:
<!-- #endregion -->

```python
this_is_a

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-26572cb3a032030b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Handy! Jupyter did the typing for me! 

If multiple things match, you will get a drop-down box and can select the one you want. So press `Tab` : after
<!-- #endregion -->

```python
this_is
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-cc31b788b063face", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
You can also keep on typing: if you just type `a` after you hit tab and then hit tab again, it will finish the typing for you.
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-6ea392babfac0516", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise} 1.13`** 

Use tab completion on the initial letters of a few of the commands that have been presented. Along the way you will discover many more Python commands!
<!-- #endregion -->

```python
# Your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-f4fabb371d6b9224", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB1_understand_errors)=
## Understanding Python Errors

Sometimes, the code you type into a code cell will not work. In this case, Python will not execute your code, but instead print out an error message. In this section, we will take a look at these error messages and learn how to understand them.

Let's write some code that will give an error. For example, this is a typo in the name of the `print()` command:
<!-- #endregion -->

```python
a = 5
printt(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-4d9a7d42147dd830", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
After your code cell, you will see some colored text called a "Traceback". This "Traceback" is the way that Python tries to tell you where the error is. 

Let's take a look at the traceback:

```{figure} Notebook_1_anatomy_of_an_error.png 
:width: 60%
```

The traceback contains three important details that can help you:

1. The type of error
2. Where the error occurred in your code
3. An attempt to explain why the error happened

For 1 and 2, Python is pretty good and will communicate clearly. For 3, sometimes you need to have some experience to understand what python is trying to tell you.

In this specific case, the type was a `NameError` that occured on line 2 of our code cell. 
*(By the way, in the View menu, you can turn on and off line numbers in your cells.)* 

A `NameError` means that Python tried to find a function or variable that you have used, but failed to find one. If you look already at the line of code, you can probably spot the problem already.

At the very end of the traceback, Python tries to explain what the problem was: in this case, it is telling you that there is no function named `printt`. 

You will also get a `NameError` if you try to use a variable that doesn't exist:
<!-- #endregion -->

```python
print(non_existant_variable)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-5deb43b858deacc0", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Another common type of error is a `SyntaxError`, which means you have typed something that Python does not understand:
<!-- #endregion -->

```python
a = a $ 5
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-b33dea484458dc18", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
You can also get errors if you try to use operators that do not work with the data type you have. For example, if you try to "divide" two strings:
<!-- #endregion -->

```python
"You cannot " / "divide strings"
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-b40abf4de47d6118", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Here, you get a `TypeError`: the division operator is a perfectly fine syntax, it just does not work with strings. 


In Python, errors are also called "Exceptions", and a complete list of all error (exception) types, and what they mean, can be found here:

https://docs.python.org/3/library/exceptions.html#concrete-exceptions

Sometimes, you can learn more about what the error means by reading these documents, although they are perhaps a bit hard to understand for beginners. 

In last resort, you can also always try a internet search: googling the error message can help, and there are also lots of useful posts on [stack exchange](https://stackexchange.com) (which you will also often find by google).
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-737d6eb17c2a2f4f", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise} 1.14`** \
Run the following code and try to understand what is going wrong by reading the error message.
<!-- #endregion -->

```python
a=10
b=0
c=(a/b)
```

```python
4 + practicum*3
```

```python
d='practicum is great' + 2
```

If you are not sure what to do, what the function was called or need some help, there are two handy tools. First, if you put a question mark (?id) before your variable or function, you get additional information. 

The other tool is to type your variable, put a dot behind it and autocomplete using tab. This will produce a dropdown menu with all the available actions that can be carried out.



```{exercise}
Try **?%whos** below and see what information is given.
```


```python

```

```{exercise}
Make a variable and an array. Use the second tool to find out what actions can be performed on the two different types. 
```

```python

```
