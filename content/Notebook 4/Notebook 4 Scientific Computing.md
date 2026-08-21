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

(NB4_computing)=
# Scientific Computing in Python with Numpy


(NB4_test)=
## Pre/Post-test
This test is for testing your current skills in Python. You can use it in two ways:
* pre-test: to test your skills beforehand. If you are already proficient in Python, and can do this test within approximately 15 minutes, you can scan through the notebook rather than carefully reading each sentence.
* post-test: to test your skills after Notebook 4. Check whether you learned enough.

**Calculating a derivative**
Eric is asked to develop a tool for people that need to do some mathematical calculations. He is asked to write a function that calculates and plots the derivative of a given function. The derivative of a continuous function $f(x)$ can be approximated by $f'(x) = \frac{f(x+\epsilon)-f(x-\epsilon)}{2\epsilon}$ for some small value of $\epsilon$. As Eric knows that the derivative of $f(x) = \sin(x)$ is $f'(x) = \cos(x)$, he uses this function to test whether his function works correct.
- Make an array in the domain [0, 2*$\pi$] with 1e4 even spaced values.
- Plot the function $f(x)$ for this domain.
- Write a function that calculates the derivative using the approach above.
- Plot the graph of the derivative in the same figure.
- Test the correctness of the function by using any other input function.


```python
### Your Code
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-33372ef05bccfcb0", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_obj)=
## Learning objectives

[Numpy](https://numpy.org/) (Numerical Python) is a library designed for performing scientific computing in Python. 

In this notebook, we will introduce numpy arrays, a data structure introduced in numpy for working with vectors and matrices. We will explore how to create them, how to manipulate them, and how to use them for efficient numerical calculations using numpy functions. 

After completing this notebook, you are able to:
* create (multidimensional) numpy arrays from a list of numbers
* use indexing and slicing with (multidimensional) numpy arrays
* iterate over a numpy array 
* perform mathematical operations on numpy arrays
* use functions for creating arrays (eg. `np.zeros()`, `np.linspace()`, `np.random.random()`
* use numpy functions for vectorized calculations
* to demonstrate the speed increase of vectorized calculations using `time()`
<!-- #endregion -->

```{iframe} https://www.youtube.com/embed/xECXZ3tyONo
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-7d7b639cd03ba916", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_nump_arr)=
## Numpy Arrays

You have encountered numpy arrays in previous notebooks. If you don't remember, open the first notebook and read the section where we introduce numpy arrays.

To use numpy arrays, we first need to import the numpy library, which we will do using the shortened name "np":
<!-- #endregion -->

```python nbgrader={"grade": false, "grade_id": "cell-4cd897115e9a55da", "locked": true, "schema_version": 3, "solution": false, "task": false}
import numpy as np
import matplotlib.pyplot as plt
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-2b8a256ccf823e14", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Now that we have imported numpy, we can use functions in numpy to create a numpy array. A simple way to do this is to use the function `np.array()` to make a numpy array from a comma-separated list of numbers in square brackets:
<!-- #endregion -->

```python
a = np.array([1,2,3,4,5])
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-cfdb9edf4b2e1707", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note  that numpy does not make a distinction between row vectors and column vectors: they are just vectors. 

Look at the cell below, what is the difference with the cell above?
<!-- #endregion -->

```python
a = np.array([1,2,3,4,5],dtype=float)
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-aa801acee39c518f", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_indexing)=
### Indexing arrays (and counting from zero)
One useful thing about arrays is that you can access the elements of the array using square brackets:

`a[n]` will give you the n-th element of the array `a`. 

This process of extracting a single element from the array is called **indexing**. 

Note that here we encounter for the first time what is known as the python **counting from zero** convention. What is the counting from zero convention? In the example above, we created an array:

```
a = np.array([1,2,3,4,5])
```

The first element of `a` is `1`. You might think that if you want to access the first element of `a`, you would use the notation `a[1]`. Right?

Let's try it:
<!-- #endregion -->

```python
print(a[1])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-992a7aa5df6186e4", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
**WRONG!** Why? Because the makers of Python decided to start counting from zero: the first element of a sequence `a` is actually `a[0]`. 

(This is a long-standing [discussion among computer scientists](https://en.wikipedia.org/wiki/Zero-based_numbering), and the convention is [different](https://en.wikipedia.org/wiki/Comparison_of_programming_languages_(array)#Array_dimensions) in many different languages. There are advantages and disadvantages of both, and even essays written about it...but in any case, Python chose to start arrays at zero.)

This also helps better understand the `range()` function: for example, to loop over all the elements in `a`, I can use this code:
<!-- #endregion -->

```python
for i in range(len(a)):
    n = a[i]
    print('a[%d] is %d' % (i,n))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ab7bf8fa5a2ac10f", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Here the `len` function returns the length of the array `a`. As we saw before, Python has very smart `for` loops that can automatically iterate over many types of objects, which means we can also print out all the elements of our array like this:
<!-- #endregion -->

```python
for n in a:
    print(n)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-e1299e2159378fdb", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In Python, if you try to index beyond the end of the array, you will get an error: 
<!-- #endregion -->

```python
a[5]
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-77aff5e6ccdff810", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(Remember: indexing starts at zero!)

Python also has a handy feature: negative indices count backwards from the end, and index `-1` corresponds to the last element in the array! 
<!-- #endregion -->

```python
a[-1]
```

```python
a[-2]
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8398fd216f6b2f58", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
We can also use indexing to change the values of elements in our array:
<!-- #endregion -->

```python
print(a)
a[2] = -1
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-3dae75f8494e44f3", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB4_
Set the first three, and the last two, entries of the following array to zero:
```
<!-- #endregion -->

```python
a = np.array([1,2,3,4,5,6,7,8,9,10,11,32,55,78,22,99,55,33.2,55.77,99,101.3])

#some code to set the first three and last two entries to zero 

print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-3b080cba952a146f", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_slicing)=
###  Slicing numpy arrays

Python sequences, inclduing NumPy arrays, also support a special type of indexing called "slicing" that does not just return a single element of an array, but instead returns a whole part of array. 

To do this, I put not just a single number inside my square brackets, but instead two numbers, separated by a colon `:`

`a[n:m]` will return a view that consist of all the elements in `a`, starting at element `n` and ending at element `m-1`. 

Let's look at a concrete example:
<!-- #endregion -->

```python
a = np.array(range(10))
print(a)
print(a[0:5])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-70abffff9b88cf27", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
The notation `a[0:5]` has "sliced" out the first five elements of the array.

With slicing, you can also leave off either `n` or `m` from the slice: if leave off `n` it will default to `n=0`, and if you leave off `m`, it will default to the end of the array (also the same as `m=-1` in Python indexing):
<!-- #endregion -->

```python
print(a[:5])
```

```python
print(a[5:])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-a8b2ffcd10cfc7b1", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Also handy: you can can have Python slice an array with a "step" size that is more than one by adding another `:` and a number after that. Find out its operation using:
<!-- #endregion -->

```python
print(a[0:10:2])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-24b9d17391ceeb7e", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Fun: you can also use negative steps:
<!-- #endregion -->

```python
print(a[-1:-11:-1])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-6ee08109e60cb51f", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
And finally, unlike indexing, Python is a bit lenient (merciful) if you slice off the end of an array:
<!-- #endregion -->

```python
print(a[0:20])
```

### Slicing Behavior: Views vs. Copies

When you slice an object, you get either a **view** (a window into the original data) or a **copy** (a new, independent object). This behavior is different for NumPy arrays and Python lists.

#### 1. NumPy Arrays: Slicing Creates a View

Slicing a NumPy array creates a **view** for performance. This means modifying the slice will alter your original array.

```python
import numpy as np

numpy_array = np.array([10, 20, 30, 40, 50])
array_slice = numpy_array[1:4]  # This is a view

array_slice[0] = 99  # Modify the view

# The original array is also changed!
print(f"Original array: {numpy_array}")
# Output: Original array: [10 99 30 40 50]
```

To get a **copy** instead of a view, use the `.copy()` method: `array_copy = numpy_array[1:4].copy()`.

**Exception**: Indexing with a **boolean mask** creates a **copy**, not a view.

```python
mask = numpy_array > 25
masked_copy = numpy_array[mask]  # This is a copy
masked_copy[0] = 999             # This does NOT change numpy_array
```

#### 2. Lists: Slicing Creates a Shallow Copy

Slicing a list creates a **shallow copy**, a new list whose contents are references to the original items. Modifying the elements of the slice will not affect the original list.

```python
my_list = [10, 20, 30, 40, 50]
list_slice = my_list[1:4]  # This is a shallow copy
list_slice[0] = 99         # Modify the copy

# The original list is NOT changed
print(f"Original list: {my_list}")
# Output: Original list: [10, 20, 30, 40, 50]
```

However, you can use slice assignment to modify the original list **in place**:

```python
my_list = [10, 20, 30, 40, 50]
my_list[1:3] = [99, 99]  # Replace a slice of the original list
print(f"Modified list: {my_list}")
# Output: Modified list: [10, 99, 99, 40, 50]
```

### Shallow vs. Deep Copies

We've said that list slicing creates a "shallow copy," but what does that mean? Let's look at an example with nested lists.

- A **Shallow Copy** creates a new list, but it populates it with *references* to the items in the original. If those items are mutable (like another list), changes to them will be visible in both lists.

```python
original = [[1, 2], [3, 4]]
shallow_copy = original[:]  # Create a shallow copy

shallow_copy[0][0] = 99 # Modify a nested list

# The change appears in BOTH because they share the inner list object
print(f"Original: {original}")       # Output: Original: [[99, 2], [3, 4]]
print(f"Shallow Copy: {shallow_copy}") # Output: Shallow Copy: [[99, 2], [3, 4]]
```

- A **Deep Copy** creates a new list *and* recursively copies every object inside it, creating a truly independent duplicate. For this, you can use the `copy` module.

```python
import copy

original = [[1, 2], [3, 4]]
deep_copy = copy.deepcopy(original) # Create a deep copy

deep_copy[0][0] = 99 # Modify a nested list

# Only the deep copy is changed
print(f"Original: {original}")     # Output: Original: [[1, 2], [3, 4]]
print(f"Deep Copy: {deep_copy}")  # Output: Deep Copy: [[99, 2], [3, 4]]
```

NumPy `.copy()` makes a shallow copy of the `ndarray`, but since NumPy arrays usually only contain immutable objects, this acts the same as a deep copy. A multidimensional NumPy array is not seen as an array of arrays like a multidimensional list, but is instead seen as a single, continuous block of memory containing all the elements. The array object simply holds metadata (like its shape) that tells NumPy how to interpret this flat block of data as a multidimensional grid.

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8d1518c5eafa34e8", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB4_
Slicing can also be used to *set* multiple values in an array at the same time. Use slicing to set first 10 entries of the array below to zero in one line of code.
```
<!-- #endregion -->

```python
a = np.array(range(20))+1
print(a)
#some code that sets the first 10 entries to zero

print(a)
```

```{exercise}
:label: NB4_
The same exercise but now code in a smarter way.
```

```python
#your code here 

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-9b377accb5c0210c", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_math_op)=
###  Mathematical operations on arrays

An advantage of using numpy arrays for scientific computing is the way they behave under mathematical operations. In particular, they very often do exactly what we would want them to do if they were a vector:
<!-- #endregion -->

```python
a = np.array([1,2,3,4,5])
print(2*a)
```

```python
print(a+a)
```

```python
print(a+1)
```

```python
print(a-a)
```

```python
print(a/2)
```

```python
print(a**2)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-2963828a5132a24a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
What about if I multiply two vectors together? 

In mathematics, if I multiply two vectors, what I get depends on if I use the "dot product" or the "outer product" for my multiplication:

https://en.wikipedia.org/wiki/Row_and_column_vectors#Operations

The "dot product" corresponds to multiplying a column vector by a row vector to produce a single number. The "outer product" (also called the "tensor product") corresponds to multiplying the column vector by the row vector to make a matrix. 

**Question:** If I type `a*a`, or more generally `a*b`, does Python use the inner or outer product? 

It turns out: it uses **neither!** In Python, the notation `a*a` produces what is commonly called the "element-wise" product: specifically,

`a*b = [a[0]*b[0], a[1]*b[1], a[2]*b[2], ...]`

(Mathematically, this has a fancy name called the <a href=https://en.wikipedia.org/wiki/Hadamard_product_(matrices)>Hadamard product</a>, but as you can see, despite the fancy name, it's actually very simple...)

We can see this in action here:
<!-- #endregion -->

```python
print(a*a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-713408533e01c84c", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
What if I actually want the dot product or the outer product? For that, Python has functions `np.dot()` and `np.outer()`: 
<!-- #endregion -->

```python
print(np.dot(a,a))
```

```python
print(np.outer(a,a))
```

A useful mathematical operator is the cross product (https://en.wikipedia.org/wiki/Cross_product) where one calculates a vector which is perpendicular to vectors **x** and **y**. 



```python
x = np.array([1,0,0])
y = np.array([0,1,0])
z = np.cross(x,y)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-d29f4ba63452bfee", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Pretty much all operators work with numpy arrays, even comparison operators, which can sometimes be very handy:
<!-- #endregion -->

```python
print(a)
print(a>3)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8657218bbd2eabbc", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB4_
Generate a sequence of the first 20 powers of 2 in a numpy array (starting at $2^0$). 

Your output should be an array $[2^0, 2^1, 2^2, 2^3, ...]$. 

*(Hint: Start with a numpy array created using an appropriate range function that makes an array [0,1,2,3,...])*
```
<!-- #endregion -->

```python
# your code that makes the desired array

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-809eedfdadcd8b57", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_func)=
## Functions for creating numpy arrays

In numpy, there are also several handy functions for automatically creating arrays, see https://numpy.org/devdocs/reference/routines.array-creation.html. We provide some examples:
<!-- #endregion -->

```python
a = np.zeros(5)
print('zeros', a)
a = np.ones(5)
print('ones', a)
a = np.eye(5)
print('diagonal')
print(a)
a = np.tri(5)
print('ones below and on diagonal')
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-a3a728bdca7ae5e3", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_lins)=
###  np.linspace

To automatically generate an array with linearly increasing values you can use `np.linspace()`:

https://docs.scipy.org/doc/numpy/reference/generated/numpy.linspace.html

np.linspace takes three arguments: the starting number, the ending number, and the number of points.

This is a bit like the `range` function we saw before, but allows you to pick the total number of points, automatically calculating the (non-integer) step size you need:
<!-- #endregion -->

```python
a = np.linspace(0,20,40)
print(a)
print()
print("Length is: ", len(a))
print("Step size is: ", a[1]-a[0])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ea30686a4490a44d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note that if we wanted to have a step size of exactly 0.5, we need a total of 41 points:
<!-- #endregion -->

```python
a = np.linspace(0,20,41)
print(a)
print()
print("Length is: ", len(a))
print("Step size is: ", a[1]-a[0])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-60d973103e7a78a9", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB4_
Generate an array that runs from -2 to 1 with 20 points using `linspace`.
```
<!-- #endregion -->

```python
a = your code
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-7c4a427b963a9b3c", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_arange)=
###  np.arange()

If we want to have more control on the exact spacing, we can use the `np.arange()` function. It is like `range()`, asking you for the start, stop, and step size:
<!-- #endregion -->

```python
a = np.arange(0,20,0.5)
print(a)
print()
print("Length is: ", len(a))
print("Step size is: ", a[1]-a[0])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-5b97dd88408ae9d0", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Here, we already see a small quirk of `arange`: the stopcondition. It does not include this specified number (rather < than <=). If we want to get a range that stops at `20.0`, we need to make the stop point any number a bit bigger than 20 (but smaller than our step size):
<!-- #endregion -->

```python
a = np.arange(0,20.00000001,0.5)
print(a)
print()
print("Length is: ", len(a))
print("Step size is: ", a[1]-a[0])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ab1a61494f1f5b33", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
For this reason, I do not find myself using `np.arange()` very often, and mostly use `np.linspace()`. There are also several other useful functions, such as <a href=https://docs.scipy.org/doc/numpy/reference/generated/numpy.geomspace.html>np.geomspace()</a>, which produces geometrically spaced points (such that they are evenly spaced on a log scale). 
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-3a0d9465353f954b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB4_
Generate a numpy array that has a first element with value 60 and last element 50 and takes steps of -0.5 between the values. 
```
<!-- #endregion -->

```python
a = your code
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ed2f97bb11cf695d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_random)=
###  Random numbers

Numpy can also generate arrays of random numbers:
<!-- #endregion -->

```python
a = np.random.random(40)
print(a)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-624c748e1b750b24", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
This will generate uniform random numbers on the range of 0 to 1, but there are also several other random number generator functions that can make <a href=https://en.wikipedia.org/wiki/Normal_distribution>normally distributed</a> random numbers, or random integers, and more.
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-bf4eeb182ddf3fdf", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB4_
Generate a numpy array, `rounded_grades` that contains 300 random grades that have a distribution of a <a href=https://www.mathsisfun.com/data/standard-normal-distribution.html>bell-shaped curve</a> that might represent the final grades of the students in this course, with an average grade of 7.5 and a standard deviation of 1. Make sure your grades are rounded to a half point.

(You may find it useful have to look at the help of the `np.random.normal()` function.

(Because of the properties of a normal distribution a small pecentage of the grades may be above a 10, you may leave this for now.)
```
<!-- #endregion -->

```python
#Your code here that results in a numpy array rounded_grades
...some code...
print(rounded_grades)
```

```{exercise}
:label: NB4_
There are various ways in which you can analyse your grade distribution.

You can plot a <a href=https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.hist.html>histogram</a> of the grade distribution. Make sure that the width of our histogram bars is 0.5, corresponding to our rounded grades.
```

```python
import matplotlib.pyplot as plt

... some code ...
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-042c8d00bb09795d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_multidim)=
###  Multidimensional arrays (matrices)


We have looked at 1D arrays especially. However, numpy also supports two-dimensional (or N-dimensional) numpy arrays, that can represent matrices. To make a 2D numpy array, you can use the `zeros()` function, for example, but with a two-entry list of numbers specifying the size N and M of the matrix:
<!-- #endregion -->

```python
m = np.zeros([10,10])
print(m)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-63e005300e7f7098", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
For two dimensional matrices, the usual function `len()` is not enough to tell us about the shape of our matrix. Instead, we can use a property of the numpy matrix itself called its `shape`:
<!-- #endregion -->

```python
print(len(m))
print(m.shape)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-f8e1398b61d09699", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Indexing two dimensional arrays works by using commas inside square brackets to specify the index of the first and second dimensions:
<!-- #endregion -->

```python
a = np.array(range(1,6))
m = np.outer(a,a)
print("Initial matrix:")
print(m)

# First index in the row number (counting from zero), second index in the column number
m[2,3] = -1 
print("\nAfter changing entry [2,3] to -1:")
print(m)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-4e9af994bf9d7df7", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
You can also use slicing to to assign values to an array from a vector, which can be a handy way to enter a matrix by hand:
<!-- #endregion -->

```python
m = np.zeros([3,3])
m[0,:] = [1,2,3]
m[1,:] = [4,5,6]
m[2,:] = [7,8,9]
print(m)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-461ca601abc17699", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Similarly, slicing also can be used to extract rows, columns, or blocks of the matrix:
<!-- #endregion -->

```python
# A row
print(m[1,:])
```

```python
# A column
print(m[:,1])
```

```python
# Extract a block as a sub-matrix
print(m[1:,1:])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-6ab7d9e10575586d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
There are several functions for making matrices which you may find useful someday: 

https://docs.scipy.org/doc/numpy/reference/routines.array-creation.html

including this one which is used often:
<!-- #endregion -->

```python
# The identity matrix
print(np.eye(10))
```

```python
# A band diagonal matrix
print(np.eye(10,k=-1))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-484f34f51c8f8c5e", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB4_
Use Python to calculate the following matrix multiplication: 

$$
\begin{bmatrix}
1 & 1 & 0 \\
0 & 2 & 1 \\
1 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
1 & 3 & 0 \\
3 & 1 & 1 \\
1 & 1 & 1
\end{bmatrix}
$$

To perform this multiplication, you will need to use the `matmul` or `dot` routine of numpy: 

https://docs.scipy.org/doc/numpy/reference/generated/numpy.matmul.html
https://docs.scipy.org/doc/numpy/reference/generated/numpy.dot.html

*(For the nerds: do these [two matrices](https://en.wikipedia.org/wiki/Commuting_matrices>commute))*

*(For the real nerds: have your program check if they commute and inform the user!)*
```
<!-- #endregion -->

```python
m1 = np.zeros([3,3])
some code to fill the matrix
m2 = np.zeros([3,3])
some code to fill the matrix

# Check the matrices  
print(m1)
print()
print(m2)
print()

product = some code
print(product)

do nerd stuff if you want...
```

We can do seemingly smart things using these 'special' vectors and matrices. For instance, what if we want to take the sum of all values in an array? We can use the dotproduct:

$$
\begin{bmatrix}
1 & 1 & 1 \\
\end{bmatrix}
\cdot
\begin{bmatrix}
1 \\ 2 \\ 3 \\
\end{bmatrix}
= 6
$$

```python
ones = np.ones(3)
array = np.linspace(1,3,3)
print(np.dot(one_diag,array))
```

Moreover, if we want to create a cummulative sum of values in an array, we can use the tri matrix:

$$
\begin{bmatrix}
1 & 0 & 0 \\
1 & 1 & 0 \\
1 & 1 & 1
\end{bmatrix}
\cdot
\begin{bmatrix}
1  \\
2  \\
3 
\end{bmatrix}
= 
\begin{bmatrix}
1\cdot1 + 0\cdot2 + 0\cdot3   \\
1\cdot1 + 1\cdot2 + 0\cdot3 \\
1\cdot1 + 1\cdot2 + 1\cdot3
\end{bmatrix}
=
\begin{bmatrix}
1  \\
3  \\
6 
\end{bmatrix}
$$


```python
tri = np.tri(3)
print(np.dot(tri,array))
```

Another way to do so is to use a for-loop: 

```python
a = np.linspace(1,3,3)
sum_a = 0
cumsum = np.array([])

for x in a:
    sum_a += x
    cumsum = np.append(cumsum,sum_a)
    
print("The sum is", sum_a)
print("The cummulative sum is", cumsum)

```

```{exercise}
:label: NB4_

Below we have a set of repeated measurements. We want to understand how the average value of our repeated measurements evaluates over time, that is, how does the average value change as function of $N$ repeated measurements? To investigate this: calculate and plot the average value as function of the number of measurements.
```

```python
measurements = np.random.normal(5,1,20)
print(measurements)

#your code here

```

But wait... is there not a more direct way to do all of the above... Sure! We can make use of Numpy functions.

<!-- #region nbgrader={"grade": false, "grade_id": "cell-0a8f096130330d1f", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_nump_func)=
## Numpy functions

For many common (mathematical) operations, fuctions exists. For instance, we can calculate the average value of our measurements of above using a for loop, but also using the function `np.average`:
<!-- #endregion -->

```python
sum_meas = 0

for measurement in measurements:
    sum_meas += measurement

print(sum_meas/len(measurements))
print(np.average(measurements))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-48cd73f9aeaf481e", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
This is very handy: it saves us loads of thinking and typing! From the function name, it is also easy to understand what you are doing, making the code clearer and easier to read. However, the purpose of numpy functions is not only to save lots of typing: they also can often perform calculations MUCH faster than if you do program the calculation yourself with a `for` loop, as we will see in the next section.

Python also has many other useful functions for performing calculations using arrays:
<!-- #endregion -->

```python
# Calculate the standard deviation
print(np.std(measurements,ddof=1))
```

```python
# The square root
print(np.sqrt(a))
```

```python
# Numpy also has max and min, here is an example of min
a = np.linspace(-10,10,100)
print(np.min(a**2))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-3c32880c009136b2", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Good question for you to think about: why is the minimum value not zero? And what would I have to change above to get the code to return zero? 

In addition to finding the minimum value in a vector, the function `argmin` can tell you **where** (what index number) the minimum is:
<!-- #endregion -->

```python
# Find the index number of the minimum of the array
i = np.argmin(a**2)
print(i)
print((a**2)[i])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-d520c5750ce4f54a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note also here that we used round brackets `()` around the `a**2` in the `print` statement to be able to then index the resulting array `a**2` array using square brackets `[]`. 

You can find the full list of mathematical numpy functions on the documentation website:

https://docs.scipy.org/doc/numpy/reference/routines.math.html

and the full list of all functions in the reference guide: 

https://docs.scipy.org/doc/numpy/reference/index.html
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-081110b083e1eeb8", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB4_

**a)**
Create an array with values ranging from 14 to 42, skipping the odd numbers.

**b)**
Make an array `x` that runs from 0 to 4 with 20 points, and calculate an array `y` whose entries are equal to the square root of the entries in `x`. 
```
<!-- #endregion -->

```python
your code to make the requested arrays x and y
print(y)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-dfed25e05b150ef3", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB4_vectoris)=
### Vectorisation" and fast code with numpy functions


In the first example above, we showed two ways of calculating an average: one using a `for` loop, and one using the numpy function. 

Functionally, they are equivalent: they do exactly the same thing. 

A curious feature of Python is that if you use functions instead of coding loops yourself, often things are **MUCH MUCH** faster. 

To show this quantitatively, we will use the `time` library to calculate the time it takes to find the average of a pretty big array using both techniques:
<!-- #endregion -->

```python
# The time() function from the time library will return a floating point number representing 
# the number of seconds since January 1, 1970, 00:00:00 (UTC), with millisecond or even microsecond
# precision
# 
# We will use this to make a note of the starting time and the ending time, 
# and then print out the time difference 
from time import time

# A pretty big array, 50 million random numbers
a = np.random.random(int(50e6))

# Set timer
t1 = time()

# Caluclate the average
avg = 0
for x in a:
    avg += x    
avg /= len(a)
t2 = time()
t_forloop = t2-t1
print("The 'for' loop took %.3f seconds" % (t2-t1))

t1 = time()
avg = np.average(a)
t2 = time()
t_np = t2-t1
print("Numpy took %.3f seconds" % (t_np))

# Now let's compare them
print("\nNumpy was %.1f times faster!" % (t_forloop/t_np))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-bbb6d85899ba86b1", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Why is numpy so much faster? The reason is that Python is an <a href=https://en.wikipedia.org/wiki/Interpreted_language>interpreted language</a>. In each of the steps of the `for` loop, the Python kernel reads in the next step it has to do, translates that into an instruction for your computer processor, asks the computer to perform the step, gets the result back, reads in the next step, translates that into a processor instruction, sends that as an instruction to the computer processor, etc, etc. 

If we did the same test in a <a href=https://en.wikipedia.org/wiki/Compiled_language>compiled programing language</a> like <a href=https://en.wikipedia.org/wiki/C_(programming_language)>C</a>, there would be no difference if we used a library function or if we wrote our own `for` loop. 

When you use smart functions in Python libraries, like (many of) those in numpy, numpy will actually use an external library compiled in a language like C or Fortran that is able to send all of the calculation in one step to your computer processor, and in one step, get all the data back. This makes Python nearly as fast as a compiled language like C or Fortran, as long as you are smart in how you use it and avoid having "manual" `for` loops for large or long calculations. 

(For small calculations, Python coded `for` loops are perfectly fine and very handy!)

In the language of interpreted programmers, finding smart ways of getting what you need done using "compiled library functions" is often referred to as <a href=https://en.wikipedia.org/wiki/Array_programming>vectorisation</a>. 

Note that even normal mathematical operators are actually "vectorized functions" when they operate:
<!-- #endregion -->

```python
# This is actually a vectorized 'for' loop, it involves multiplying 50 million numbers by 5
b = 5*a
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-2a60c21baccb3c7d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
 Here is a nice example of a vectorized way of counting the number of times the number '5' occurs in a random sample of 100 integers between 0 and 20:
<!-- #endregion -->

```python
nums = np.random.randint(0,21,100)
print("There are %d fives" % np.sum(nums == 5))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-c8bc80849f5e0e0a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
To see how this works, we can look at the intermediate steps:
<!-- #endregion -->

```python
nums = np.random.randint(0,21,100)
print(nums)
print(nums == 5)
print("There are %d fives" % np.sum(nums == 5))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-1a3f30004c3e3ffb", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Note that in this case, `np.sum()` will convert the `bool` value `True` into `1` and `False` into `0` for calculating the sum, according the the standard convertion of `bool` types to `int` types. You can see this in action if you want using the function `astype()` that is built into numpy arrays:
<!-- #endregion -->

```python
print(nums == 5)
print((nums == 5).astype('int'))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-dd8dc8bd0ab88a1c", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Another neat feature that `numpy` has is that is can 'vectorize' normal Python functions so that they can take `numpy` functions and make them a bit faster (10-20%). This is done using the `np.frompyfunc` function. An example is given below.
<!-- #endregion -->

```python
def fac(N):
    if (N == 1) or (N == 0):
        return 1
    return N * fac(N-1)

#As you can see applying the following array does not work
N = np.arange(9)

try:
    print(fac(N))
    print("This works")
except:
    print("This does not work \n")
    
#Now if we make this a numpy function is will work 
#(the numbers in the frompyfunc represent the input and output values)

numpy_fac = np.frompyfunc(fac,1,1)


try:
    print(numpy_fac(N))
    print("This works")
except:
    print("This does not work")
```

<!-- #region -->
(NB4_MC)=
## Monte Carlo Simulation


A commonly used method for numerical calculations is a Monte Carlo simulation (named after the (in)famous casino district). Simply stated, the method consists of generating a great number of random points and checking afterwards which points satisfy the boundary conditions of the calculation.

For example: to calculate the area of a circle with radius one, one can generate a great number of random points within a square of size 1 by 1, and check for each points whether they fall within the circle $r < 1$. The area of the circle can then be obtained by multiplying the area of the square with the number of points that are within the circle divided by the total number of points.

This may sound a bit cumbersome, and of course in this example calculating $\pi \cdot r^2$ is a lot faster. There are however many applications where the Monte Carlo method proves to be very useful; for example in calculating integrals that cannot (easily) be solved analytically.

In the next exercises, you are going to calculate the integral of the function $f(x) = e^{x^2}$ in the interval [0,1] using the Monte Carlo method. 

```{exercise}
:label: NB4_

First, make a plot to get an idea of what the function looks like. 

What is the maximum value of $f(x)$ in the interval [0,1]?

Make a (rough) estimate of the value of the integral by looking a the graph
```
<!-- #endregion -->

```python
import matplotlib.pyplot as plt

#First we define our function
def f(x):
    return np.exp(x**2)

```

Now we are going to generate random samples in a square that has an area that is greater than the integral that we want to calculate. 

For this, we will use the np.random.uniform() function, which generates random float in the interval [a,b) - notice, this is an half-open interval so b is not included. 

Moreover, it is wise to define the area by four points: $x_a$, $x_b$, $y_a$ and $y_b$.

```{exercise}
:label: NB4_

Complete the code below to generate a random sample of y-values in an appropriate range.
```

```python
N = int(1e6)   #number of points that we are going to use in our calculation
x_a = 
x_b = 
y_a = 
y_b = 
#Generate samples:
random_x = np.random.uniform( , ,size=N)   
random_y = np.random.uniform( , ,size=N)
```

Next, we want to determine the number of points in our sample that fall within the area under the line f(x). 

**Exercise 4.13**

Determine the number of points that satisfy this condition using a for loop and calculate the value of the integral.

```python
from time import time

t1 = time()

### your code ###



solution_integral = 

print('The solution of the integral is %.6f' %(solution_integral))            
print('Time for calculation: %.3f s' %(time()-t1))
```

We have a solution of the integral (much easier than on paper, right?)! But how do we know how accurate our solution is? First, compare your result to your estimate from the previous exercise. Does it make sense?

To make a substantiated claim about the accuracy of our solution we have to determine the uncertainty in our result. As we are basically performing a count, Poisson statistics tells us that the uncertainty in the counted number of points that satisfy the condition is the square root of the counted number: $u(N_{counted}) = \sqrt{N_{counted}}$.
We can then determine the uncertainty in the area using the calculus approach.

Let's check our solution by comparing it to the answer given by another numerical method from the scipy library.

```python
from scipy.integrate import quad

Area = np.abs(x_b-x_a)*np.abs(y_b-y_a)
err_solution = Area*np.sqrt(s)/N          #estimated error of our solution, which is the area of our random uniform box divided by the number of points used in the calculation times the poisson uncertainty

scipy_solution = quad(f,0,1)       #calculating integral using quad function from scipy, returns: value of integral and estimated error

abs_difference = np.abs(solution_integral-scipy_solution[0]) #determine absolute difference between solutions


assert abs_difference <= 2*np.sqrt(err_solution**2 + scipy_solution[1]**2), 'The results are not in agreement'  #check if the values are in agreement 

print('Our solution: %.3f +/- %.3f' %(solution_integral, err_solution))
print('Scipy solution: %.14f +/- %.14f' %(scipy_solution[0], scipy_solution[1]))
print('Difference between the solutions: %.6f' %(abs_difference))
```

Looks pretty good!

Our method gives a reasonable answer, but as you can see the uncertainty is relatively high...If we want to improve our result we should use more points to lower the uncertainty (which scales with $\sqrt{N}$). However, the for loop we used is already quite slow. More points would mean an annoyingly long calculation. 

We should therefore try to avoid the use of a for loop and instead use a comparison operator to speed up the calculation.

```{exercise}
:label: NB4_
Again, complete the code below and calculate the integral, this time without using a for loop.
```

```python
t1 = time()

s = np.sum(  <= )

solution_integral = 

print('The solution of the integral is %.6f' %(solution_integral))            
print('Time for calculation: %.3f s' %(time()-t1))
```

This is much faster!

Now lastly we want to plot our random generated points that are within the area underneath f(x) and those that are not in the same graph with a different colour. For this, we need the actual values of the points that satisfy the condition.

As you have seen before, a comparison operation on a numpy array returns a type boolean array:

```python
array = np.array([4,2,6,8,5,4])

boolean_array = array > 4

print(boolean_array)
```

We can subsequently use this boolean array to get the values of the array that satisfy the condition:

```python
new_array = array[boolean_array]

print(new_array)
```

Or, more simply:

```python
new_array = array[array > 4]

print(new_array)
```

```{exercise}
:label: NB4_

Make a figure in which you plot:

- the function f(x)
- the random points that are within the area under the line f(x)
- the random points that are outside this area (in a different colour)

We will generate new random samples with fewer points, otherwise we cannot distinguish them.

Don't forget to label your axes!
```

```python
random_x = np.random.uniform( , ,1000)
random_y = np.random.uniform( , ,1000)

#your code
```

```{exercise}
:label: NB4_

One way to 'improve' the quality of your data, making it less noisy, is the use of a <a href="https://en.wikipedia.org/wiki/Moving_average">moving average filter</a>. The moving average filter calculates the average value of N elements, N often being 3 or 5. This smooth out any abrupt changes and allows a better focus on long term trends. Of course you will lose two elements of the entire dataset (think yourselves why). 


The filtered data is stored in an array: $F(i) = \frac{p(i)+p(i+1)+p(i+2)}{3}$, looped over all elements $p(i)$. More precise: $F(i)=\frac{1}{k}\sum_{i}^{i+k-1}p(i)$
```

```python
Z = np.arange(1,20)
#def moving_average_1(p, k):
#     F = np.empty(len(p)-(k-1))

print(Z)
print(moving_average_1(Z,3))
```
