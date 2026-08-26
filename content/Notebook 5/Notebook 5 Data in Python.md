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

(NB6_data_in_python)=
# Data in Python: Loading, Plotting, and Fitting

(NB6_test)=
## Pre/Post-test
> This test is for testing your current skills in Python. You can use it in two ways:
> * **pre-test:** to test your skills beforehand. If you are already proficient in Python, and can do this test within approximately 15 minutes, you can scan through the notebook rather than carfefully reading each sentence.
> * **post-test:** test your skills after Notebook 5. Check whether you learned enough.

**Doing an analysis**  
Eric so far survived the first weeks of his employment. As he showed some true skills, he is asked to help in building an RC-filter. First, some initial data needs to be analysed. He receives a datafile called [pretestdata.csv](https://github.com/Contemporary-Physicslab/FYPLC/blob/main/book/Course%20files/Notebook%205/pretestdata.csv). Once he retrieved (loaded) this data, he plots it first. He then uses the theoretical formula that should describe the pattern in the data: $\frac{U_C}{U_{max}}=\frac{1}{\sqrt{1+(wRC)^2}}$, where $w$ is the angular frequency given by $w=2\pi f$. $RC$ can be considered a constant which can be found using least-square fitting.
- Retrieve the data and plot these using a log-scale on the x-axis. Think about the scientific rules for making plots.
- Find the best estimate of RC and plot the fitfunction on top of the dataset.
- Carry out a residual analysis.

```python
# Your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-e43ee4f9ec42e73b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB6_learning_obj)=
## Learning objectives

In this notebook, we will explore how to load and save datafiles in Python using Numpy, how to plot data and functions with a plotting library called Matplotlib, and how to fit a model to data and analyse the results.

After completing this notebook, you are able to:
* load data from ASCII text files
* save data to ASCII text files
* generate plots of data and functions
* fit a model to data using "fitting by hand"
* use `curve_fit` to perform a least-squares fit of a model to a dataset
* analyse the residuals to determine the quality of the fit
* calculate the statistical error in the parameters of a least-squares fit

<!-- #endregion -->

```python
import numpy as np
import matplotlib.pyplot as plt
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-b336a15e1594fec1", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB6_data_management)=
## Data management

Here, we will explore some functions provided by numpy for loading data from files into python, and for saving data from python to files. We consider it good practices that you save a raw data (CSV) file somewhere on your computer and then copy this file for further processing. If any mistake has been made, you can always rely on your stored raw data file.

```{tip} data management
1. Save your raw measurements in an excel or csv file.
2. Use a file name that clearly indicates that this is the raw data.
3. Safely store it somewhere, not to touch it.
4. Make a copy and change the name of the file.
5. Use Python to read in the data and process them.
```

During the experiments that you encounter in this course you can write your measurements in an excel file, and store this file as a CSV file. When processing the data, you will load the data in your Jupyter Notebook file.

(NB6_loading)=
### Loading data with Numpy

Until now, we have seen how to generate data inside python, for example by assigning values to arrays, or, for example, by using functions like `np.zeros()`, `np.linspace()`, and `np.random.random()`.

However, what if we want to use Python to analyze data from an experiment? How do we get the data into python? 

Sometimes, we might have just a small number of data points that we have measured by hand and wrote down on a piece of paper: say a list of measured fall times for different heights. In this case, you can just "load" the data by defining Python arrays that contain your measured values:

```{code-cell} python
# Drop heights in meters
d = np.array([0, 0.5, 1.0, 1.5 , 2.0,  2.5]) 
# Measured times
t = np.array([0, 0.2, 0.3, 0.44, 0.6, 0.89])
```

In a computer controlled experiment, though, you may have, for example, a data file of voltage measured as a function of time from an acquisition card or oscilloscope which may have hundreds, thousands, or even millions of data points. Moreover, if you manually take measurements it is often more convenient to do so using excel. You can then save your data and load them using Python. If done so, your raw data is always safely stored.

If we want to look at the datafile, to get an idea of what is inside, whether there are comments included and so on, we can open the file and read it.
<!-- #endregion -->

```python
with open("v_vs_time.dat") as file:
    for i in range(5):
        print(file.readline())
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-f79c995cb536082e", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
We can also read (and print) the entire file using `print(file.read())`. 

Typically (if you're lucky), the measurement software will save its data in an (<a href=https://en.wikipedia.org/wiki/ASCII>ASCII</a>) text file. (Or at least there will be software for converting the data to an ASCII text file...) For example, let's think about an experiment where we measure a voltage as a function of time. In this case, the data will often be recorded in two columns of numbers in the text file, separated by a space. The first number would represent the time of the measurement, say in seconds, and the second the measured voltage, in volts:

`File: v_vs_time.dat:`
```
0.000000000000000000e+00 -4.881968419624156397e-01
1.001001001001000992e-02 6.574038838172248100e-01
2.002002002002001985e-02 -4.868767180890223312e-01
3.003003003003002977e-02 -8.581352351530058264e-01
4.004004004004003969e-02 1.605962930324425164e+00
5.005005005005004615e-02 -5.458119271515118331e-01
6.006006006006005954e-02 -1.910121935716198927e+00
7.007007007007007293e-02 -8.213606665035044774e-01
8.008008008008007939e-02 -1.724982388182002335e+00
...
```

This is an example of a file format called [Delimiter-separated values (**DSV**)](https://en.wikipedia.org/wiki/Delimiter-separated_values>). In the example above, the "delimiter" (ie the thing that separates the values) is a space. 

Another common delimiter is a comma `,` or `;`, often named a `.csv` file for "comma separated value" file. This is a common "export" format from spreadsheets like excel. A third common value is a "tab separated value" file (often saved with a `.tsv` file extension, also available as an export option from some spreadsheets), which separates the values in the file be tab characters (which in Python strings show up as special character `\t`, a bit like the newline `\n`).

For reading in CSV files, Python has a very simple routine [`np.loadtxt()`](https://docs.scipy.org/doc/numpy/reference/generated/numpy.loadtxt.html).



It can handle any type of **delimiter**: the default is any whitespace (tab or space), but this can also be configured using the `delimiter=` keyword argument. It also does not care about the file extension: for example, it is fine if a CSV file does not have a `.csv` extension (it doesn't even have to have an extension!). A typical convention is to name the files containing ASCII text data with an extension `.dat`.

Let's give it a try using the file [v_vs_time.dat](v_vs_time.dat): 
<!-- #endregion -->

```python
data = np.loadtxt("v_vs_time.dat")
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-3aa9fb298e9a108a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
If the first line would have been the names of the variables, we could have skipped the first row (see again the [documentation](https://docs.scipy.org/doc/numpy/reference/generated/numpy.loadtxt.html)).
Here we have assigned the return value of `np.loadtxt` to a variable `data`, which is a numpy array. But what exactly is our variable `data`? We can find out more by looking at the shape of the returned `data` array:
<!-- #endregion -->

```python
data.shape
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-5bace50c3249b281", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
When `np.loadtxt()` loads a file, it will return a 2D numpy array with of shape `(n,m)`, where `n` is the number lines in the file and `m` is the number of columns (here, we have 1000 points and 2 columns). 

As mentioned above, the first column represents the time that the measurement was taken, and the second column represents the measured voltage in volts. We will typically want to extract these into two vectors `t` and `v`, which we can do using slicing:
<!-- #endregion -->

```python
t = data[:,0]
v = data[:,1]
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-c63f7111a8fd6835", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
We can look at the first 10 points and see that we have successfully loaded the data from the file! 
<!-- #endregion -->

```python
print('t = ', t[0:10])
print('v = ', v[0:10])
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-9a33fae5f634b3cb", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
We can check that the data is correct by opening the data file itself from the Jupyter file browser: Jupyter can also directly load and edit text files. (Another way of loading hand-recorded data into Python is just to use Jupyter to create an ASCII `.dat` file yourself.)
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-def50c91314bd96b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB5_ex_load
Load the data from the file [exercise_data.dat](exercise_data.dat). The first column represents a measurement time in seconds, and the second represents a measurement voltage in volts. How many points are in the dataset? 

*(Important: make sure that you use different variable names than t and v for the data you load, since we will continue to use the data we loaded in the example code in the sections below!)*
```
<!-- #endregion -->

```python
# Your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-0793eb4c8f85801b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB6_saving)=
### Saving data with Numpy

We can also save data using a numpy routine [`np.savetxt()`](https://numpy.org/doc/stable/reference/generated/numpy.savetxt.html). To do this, we have to "pack" the data back into a numpy array of the correct shape. 

Let's take a look at an example where we calculate the square of the measured voltage and save this back into a new file:
<!-- #endregion -->

```python
v_squared = v**2
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-fb66afd2a19403c5", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
To "pack" them together into a matrix like the one returned by `np.loadtxt()`, we can first create a 2D matrix of the correct size and then use slicing with an assignment operator `=` to give the columns the correct values:
<!-- #endregion -->

```python
# Create empty array
to_save = np.zeros([len(v), 2])

# Fill columns with data
to_save[:,0] = t
to_save[:,1] = v_squared
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-7823cff287a7691f", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Now we are ready to use `np.savetxt()` in the current folder: 
<!-- #endregion -->

```python
np.savetxt("vsquare_vs_time.dat", to_save)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-5c513d113d2f3e3f", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
If you go back to your workspace in a new tab, you will can see that this file has been created, and if you click on it, you can see what is inside it. 
<!-- #endregion -->

```{exercise}
:label: NB5_ex_testarray
Make a testarray $x$ running from 1 to 100 with an interval of 0.1. Write a function $y=3.05 x + 0.95$. Use this function to make a new array for $y$. Save your data in the file `testfile.csv` using `;` as a delimiter (NOTE: delimiters are sometimes ";" and sometimes "," Always inspect the datafile first.). If all went well, when running the subsequent cell your data are loaded and shown in a plot.
```

```python
x = 

def function

y = 

```

```python
imported_data = np.loadtxt('testfile.csv', delimiter=';')

plt.figure()
plt.plot(imported_data[:,0],imported_data[:,1],'k.',markersize='1')
plt.xlabel('$x$')
plt.ylabel('$y$')
plt.xlim(0,100)
plt.show()
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-9fc0eeb9a99e75d9", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB6_plot)=
## Plotting data and functions with Matplotlib

We loaded a dataset but haven't given it a proper look yet. You already learned how to plot data, but here we give it a more thorough look. We will use the data that we loaded before and a fake dataset.
<!-- #endregion -->

```python
# A "fake" dataset to illustrate plotting
v_fake = np.random.normal(10,0.5,1000)

plt.figure()
plt.plot(t,v,'k.',markersize=1)
plt.plot(t,v_fake,'r+')
plt.xlabel("Time (s)")
plt.ylabel("Voltage (V)")
plt.show()
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-1d9eda6969d17554", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Matplotlib will automatically change the color of the second dataset (you can also control them manually, see the <a href= https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.pyplot.plot.html>documentation</a>). But it can be hard to tell which one is which, and for this reason, it can be useful to add a legend to your plot. Furthermore, if you want a really big figure, you can also adjust the figure size:
<!-- #endregion -->

```python
# plotting two datasets.
plt.figure(figsize=(12,8))
plt.plot(t,v, 'k.',markersize=3, label="Voltage 1")
plt.plot(t,v_fake, 'r+',markersize=5, label="Voltage 2")
plt.xlabel("Time (s)")
plt.ylabel("Voltage (V)")
plt.legend()
plt.show()
```

```{tip}
Colorblindness is the decreased ability to see color. In interpreting graphs, colors help for those who don't have any sight disability. However, using green and red are not helping when you have congenital red–green color blindness. You can always check your graphs in a [blindness simulator](https://www.color-blindness.com/coblis-color-blindness-simulator/), and/or use different markers. See [here](https://www.nki.nl/about-us/responsible-research/guidelines-color-blind-friendly-figures) for other tips.
```



<!-- #region nbgrader={"grade": false, "grade_id": "cell-1f4975d1b1b7c3a2", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB5_ex_plot
Make a plot of the data you loaded from @NB5_ex_load.
```
<!-- #endregion -->

```python
#code to plot the data you loaded in exercise 5.1

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-93d67850489cb7df", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB5_ex_pow_law
As you may have noticed the data from `exercise_data.dat` does not seem like straight line, but instead looks like a power law function $V = at^p$ with power $p$. 

One way to test for such power law relations is to make a plot with an x-axis that is not $t$ but instead $t^p$: if you get the correct $p$, then the  data plotted will form a straight line. 

Write code to plot $V$ against $t^p$ and then put in different guesses at the power $p$ to see if you can see what the power is. 
```
<!-- #endregion -->

```python
# Your code here

```

A very cool thing you can do with python and a function is to make interactive plots. Above, we guestimated our value for `p` but we can further inspect it by making `p` a true variable in our plot and using a slider to see what fits best. Below is an example of such an interactive plot using ipywidgets. 

```python
import numpy as np
import matplotlib.pyplot as plt
from ipywidgets import interact
import ipywidgets as widgets

# loading our data
t2,v2 = np.loadtxt("exercise_data.dat", unpack=True)

# making our function
def update_graph(p):
    plt.plot(t2**p,v2,'k.')
    
    plt.xlabel(fr"$t^{{{p:.1f}}}$ $(s^{{{p:.1f}}})$")
    plt.ylabel("v (V)")
    
# using the function to make it interactive using the variable p.
interact(update_graph, p=widgets.FloatSlider(min=0.1, max=4, step=0.1, value=1))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-076d0c966917fff0", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Also handy to know: you can use [LaTeX](https://en.wikipedia.org/wiki/LaTeX) commands to add mathematical symbols and equations to your plot.

Important: when you do this, it is a good idea to add an `r` before the quote of your string (see below) to prevent the common backslash `\` commands of latex from being treated as things like tab characters or newline characters. 
<!-- #endregion -->

```python
plt.figure(figsize=(6,6))
plt.plot(t,v, 'k.',markersize=3, label="Voltage 1")
plt.plot(t,v_fake, 'r+',markersize=3, label="Voltage 2")
plt.xlabel(r"Time $\tau$ (s)") # random greek symbols
plt.ylabel(r"Voltage $V_\alpha$ (V)") # subscripts
plt.legend()
plt.show()
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-a1372d935bab78f8", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
As explained earlier on, we can plot functions as well. It is useful to plot both your data and a function describing that data. For example, with our voltage data above, if we want to plot a straight line function over over the data: 
<!-- #endregion -->

```python
line = 2*t
plt.figure()
plt.plot(t,v, '.')
plt.plot(t,line, '--', lw=4)
plt.xlabel("Time (s)")
plt.ylabel("Voltage (V)")
plt.show()
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-ecd3b09678cacd45", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Here, we also used the `linewidth` parameter (which can be shorted to `lw` to save typing) to make the line a bit fatter so it is easier to see, and used the '--' plot format specifier to make it a dashed line. 
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-46dd5bd28954941b", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB5_ex_log
Another way to get the exponent is to plot $\log(V)$ vs $\log(t)$ (a log-log plot). If the data really follows a power law relation, then this should give a straight line with a slope determined by the exponent. Try this, and then add a straight line $\log(V) = p \log(t)$ to the plot. Play around with the value of $p$ until the line has the same slope as the data. For this plot, use solid filled circle for the data and a solid line for the theory.

*(Do you get a warning message? Why?)*
```
<!-- #endregion -->

```python
# Your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8599a077e778277a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB6_fit)=
## Fitting

In experimental physics, one of our primary goals is to try to figure out if our observed experimental measurements match the theoretical predictions that we can make from mathematical models. If it does, then we are happy and we have confirmed that our mathematical model is at least one way to explain our data! (We typically say that the experimental observations are consistent with the predictions of theory.) If that all works, we try to take this a step further, and extract values for our theoretical parameters from our data.

In this section of the notebook, we will discuss how to fit a mathematical model to experimental data and extract both the best-fit parameters of the model for the given dataset, and also the estimated (statistical) uncertainties in these fitted parameters.
<!-- #endregion -->

```{iframe} https://www.youtube.com/embed/wbQ7ra725ys
```

(NB6_fit_by_hand)=
### Fitting by hand

A first important step in any fitting is to make some plots of your experimental model and find out if there are parameter regimes where it can at least come close to the data. By "fitting by hand", you can already get an idea whether your model is a good description of your data, and approximately what the values of the model parameters are.

In the last plot above, we saw an example of plotting a function on top of some data. If we look at the data, even without looking at the plotted function, we can see that our experimental data of voltage vs. time seems to be a straight line. This suggests that we can model the data with a linear function:

$$
V(t) = at + b
$$

where $a$ is some parameter with the units of $\frac{\mathrm{V}}{\mathrm{s}}$ representing the slope of the line, and $b$ (in $\mathrm{V}$) is a parameter describing the value of the voltage at $t=0$.

The fact that the the line $V = 2t$ (the orange dashed line) seems to pass through the middle of our blue data already suggests that for our data (the blue points), $a = 2 \; \frac{\mathrm{V}}{\mathrm{s}}$  and $b = 0 \; \mathrm{V}$  seems like pretty good parameters for our model to describe the data.

We can also see that `a = 1.7` and `b = 1.7` are also OK (they go through a lot of the data points), but are probably not as good:

```python
line1 = 1.7*t+1.7
line2 = 2*t

plt.figure()

plt.plot(t,v, '.',c='k', ms=2)
plt.plot(t,line1, '--', c='b', lw=4, label="y=1.7$x$+1.7")
plt.plot(t,line2, '--', c='r', lw=4, label="y=2.0+0.0")

plt.xlabel("Time (s)")
plt.ylabel("Voltage (V)")

plt.legend()
plt.show()
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-3e41d51a52bac6e2", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Now that we have a 'good' estimate of our parameters, how can we find the **best** parameters (`a` and `b` in this case) for our data? And how do I know how accurately my parameters fit the data? 

For that, we can use a procedure called [least squares fitting](https://en.wikipedia.org/wiki/Least_squares). In the remaining part of this notebook, you will learn more about least squares fitting and how it works - the video above is a very short introduction to the least squares method. Here, we will look at how to code it in Python, how to use it to get the best fit parameters of a model for you data, and how to find out what the [statistical error](https://en.wikipedia.org/wiki/Errors_and_residuals) is on the parameters of your model given the data you are using for the fit. 
<!-- #endregion -->

<div style="width:75%; margin:0 auto;">
    <iframe width="600" height="450" src="https://www.youtube.com/embed/S0ptaAXNxBU" title="What is Least Squares?" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>

<!-- #region nbgrader={"grade": false, "grade_id": "cell-b352eec645cffa6c", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB5_ex_fit_by_hand
Using the data you loaded in @NB5_ex_load, try fitting the function $V = at^p$ "by hand" to the data by manually adjusting $a$ and $p$ and replotting the function until you think you have the best fit. What are the values of $a$ and $p$ that you find? 

For the ones who want slighlty more challenge: do it with an interactive plot with two variables!
```
<!-- #endregion -->

```python
# Your code here

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-347f6460e621fd38", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB6_least_sq)=
### Least squares fitting

To have Python automatically find the best parameters for fitting your data with a given function, you can use the `curve_fit()` routine from the [`scipy` (scientific Python) package](https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.curve_fit.html).

Since we will use only the `curve_fit` routine, we will import it on its own:
<!-- #endregion -->

```python
from scipy.optimize import curve_fit
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-8cd0ccee9956231a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
To use curve fit, we first need to create a Python function that returns the mathematical function that we want to fit. Our function is:

$$
f(x) = ax + b
$$

It has one variable, $x$, and two parameters, $a$ and $b$. For using `curve_fit`, we will need to make a Python function that takes three arguments: the first is the variable `x` (for the above, it will be time), and the other two arguments are the fit parameters `a` and `b`, and which should return the predicted voltage:
<!-- #endregion -->

```python
def function_fit(x,a,b):
    return a*x+b
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-318b791dd38d2a55", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In the simplest case (and it will always work when you are fitting a stright line), you can just then directly send the function and your x and y data and it will do the fit for you:
<!-- #endregion -->

```python
values, covariance = curve_fit(function_fit, t, v)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-2ae5e791a8ee0965", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Tada! `curve_fit` actually returns two things. The first is an array containing the optimal fit values:
<!-- #endregion -->

```python
print(values)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-1a0084e54c4a46fa", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
The first one corresponds to the first parameter of the function and the second to the second: in our case, `a` and `b`:
<!-- #endregion -->

```python
a_fit = values[0]
b_fit = values[1]
print(a_fit)
print(b_fit)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-dd958e133a172472", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
We can actually see that our fit by hand is a pretty good approximation of the values Python returns using the least squares method. We can now check what the fit looks like. To do so, it is useful to create a testarray for x first, and calculate our corresponding values for y. We will see why this is a good idea in a minute.
<!-- #endregion -->

```python
x_test = np.linspace(0.8*min(t),1.2*max(t), 1000)
y_fit = function_fit(x_test,*values)

plt.figure()

plt.plot(t, v, '.', c='k', ms=2)
plt.plot(x_test, y_fit, 'r--', lw=2, label="Fit (y = %.2f $x$ + %.2f)" % (a_fit, b_fit))

plt.xlabel("Time (s)")
plt.ylabel("Voltage (V)")
plt.legend()

plt.xlim(0,10)
plt.ylim(min(v),max(v))
plt.show()
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-efff4d4d08c4ef9a", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Cool! Also, it turns out that the best statistical fit of the slope to our data is not exactly 2 but slightly higher (about 2.0148)

In addition, sometimes in measurements, we also have error bars on the each of the individual black data points in the plot, and sometimes some data points could have more error than others. In these cases, the fitting routine can take these individual error bars into account when performing this fit: we will see more about this later in the course.
<!-- #endregion -->

<!-- #region nbgrader={"grade": false, "grade_id": "cell-728ba4c89dc5d7e0", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB5_lsf
Perform a least squares fit to of the data from @NB5_ex_load to the function $V = at^p$. Make a plot of the function with the values of $p$ and $a$ from the fit on top of the data. How close are the fitted values to your attempt at fitting by hand? 
```
<!-- #endregion -->

```python
#code that performs a least square fit to the exercise data

```

(NB6_test)=
### Test array and some ideas for plotting

It was mentioned that it is a good idea to make a testfunction before plotting our fitline. Why is that so? If our fitfunction is not a straight line, and we have not that many measurements, the dots are connected in an odd manner. That is, our fit is not continous. Below we illustrate this with the red dotted lines, making sharp turns at each new datapoint. The blue dotted line shows our test variable with many more datapoints.  
Moreover, we can improve our plot by including values for the xlim, where our fitfunction nicely starts at the borders of the graph. To better compare our graphs, we make use of subplots. It requires some adjustments, but [the manual](https://matplotlib.org/stable/gallery/subplots_axes_and_figures/subplots_demo.html) is very helpful.

```python
x_2 = np.arange(1,9,2)
y_2 = 0.25*x_2**2             

#fitting our data
def fitfunction3(x,a,b):
    return a*x**b

val, cov = curve_fit(fitfunction3,x_2,y_2)

#making a test array for our fit
x_test_2 = np.linspace(-0.2,1.2*max(x_2))
y_fit_2 = fitfunction3(x_test_2,*val)


#plotting of the data and fit in a subplt
fig, (ax1, ax2) = plt.subplots(1, 2)

ax1.plot(x_2,fitfunction3(x_2,*val),'r--',label='fit')
ax1.plot(x_2,y_2,'k.',label='measurements')
ax1.set(xlabel='$x$', ylabel='$y$')
ax1.legend()
ax1.set_xlim([0, 7.5])
ax1.set_ylim([0,15])
ax1.set_title('bad graph')


ax2.plot(x_test_2,y_fit_2,'b--',label='fit')
ax2.plot(x_2,y_2,'k.',label='measurements')
ax2.set(xlabel='$x$', ylabel='$y$')
ax2.legend()
ax2.set_xlim([0, 7.5])
ax2.set_ylim([0,15])
ax2.set_title('better graph')

fig.subplots_adjust(wspace=0.4)
plt.show()
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-bd69b024d2582da3", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB6_init_guess)=
### Initial guesses

The curve fit routine has the option to provide initial guesses on your parameters using a keyword argument `p0`:
<!-- #endregion -->

```python
initial_guesses = (2.5,1)
values2, covariance2 = curve_fit(function_fit, t, v, p0 = initial_guesses)
print(values2)
print(values)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-da995318402bc3d7", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
In this case it (nearly) did not make a difference: and in fact, for fitting a linear function, least squares fitting will converge to the same set of values, no matter what initial guess you provide. 

This is NOT true for functions $f(x)$ that are not linear in the parameters. In really bad cases, the parameter values that `curve_fit` finds can even be highly sensitive to the initial conditions. For this reason, it is always a good idea, and sometimes absolutely necessary, to first do some "fitting by hand", and then ideally provide these initial conditions to the `curve_fit` routine. 

And even if you do not provide hand-tuned initial guesses (which you may not if you are automatically fitting a huge number of datasets), it is important that you always make a plot of the fitted curves that you find on top of the data just to make sure nothing goes wrong. 

```{tip}
1. Plot your raw data
2. Make an initial guess of the values of your fit parameters.
3. Using curve fitting with the inital guess.
4. Plot the raw data including the fit function to check whether it is a proper fit.
```
<!-- #endregion -->

(NB6_residual)=
### Residuals

But how good is our fit? That is difficult to say by only lookig at the plot above. But we can investigate our residuals: $R(x) = D(x)- F(x)$ where $R(x)$ are our residuals as function of $x$,  $D(x)$ are our data (measurements) as function of $x$, and $F(x)$ our fitfunction at $x$. If our functionfit perfectly matches our data, our residues are 0. But as our data often includes some noise, we expect that our residuals are [normally distributed](https://en.wikipedia.org/wiki/Normal_distribution). 

```python
# calculating our residual
R = function_fit(t,*values)-v

#plotting our residuals
plt.figure()

plt.plot(t, R, '.', c='k', ms=2)

plt.xlabel("Time (s)")
plt.ylabel(r"$\Delta$ Voltage (V)")

plt.show()

#inspecting our residuals with a histogram
plt.figure()
plt.hist(R,bins=40,density=True)
plt.xlabel(r"$\Delta$ Voltage (V)")
plt.ylabel('pdf')
plt.show()
```

Well... it sure looks likes a normal distribution. But can we visualize it even better? We can try to fit using a normal distrubtion. The details about the normal distrubution will be discussed in Notebook 6. The [scipy norm library](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.norm.html) is here of good use!

```python
from scipy.stats import norm

x_test_R = np.linspace(np.min(R),np.max(R),1000)
distribution = norm.pdf(x_test_R,np.mean(R),np.std(R))


plt.figure()
plt.hist(R,bins=40,density=True)
plt.plot(x_test_R,distribution,'r')
plt.xlabel(r"$\Delta$ Voltage (V)")
plt.ylabel('pdf')
plt.show()
```

What did we do here? We created a test dataset and for each of these values we calculated the return value from the probability density function (pdf), using the average and standard deviation calculated from our residuals. We then plotted this function on top of our histogram. We can see that the distribution of the residuals can be described reasonably well with a normal distribution!


So how would we combine the above? Well, we can plot our data including the fitfunction, include the residuals directly below so we can inspect which datapoints deviate from our model, and provide the histogram of the residuals.

```python
plt.figure()

# defining our grid for the subplots
gs = plt.GridSpec(
    2, 2,
    width_ratios=[1.4, 1],
    wspace=0.35
)

ax1 = plt.subplot(gs[0, 0])
ax2 = plt.subplot(gs[1, 0], sharex=ax1)
ax3 = plt.subplot(gs[:, 1])

# making our three plots.
ax1.plot(t, v, '.', c='k', ms=2)
ax1.plot(x_test, y_fit, 'r--', lw=2, label="Fit (y = %.2f $x$ + %.2f)" % (a_fit, b_fit))
ax1.set_ylabel("Voltage (V)")
ax1.legend()

ax1.set_xlim(0,10)
ax1.set_ylim(min(v),max(v))

ax2.plot(t, R, '.', c='k', ms=2)
ax2.set_xlabel("Time (s)")
ax2.set_ylabel(r"$\Delta$ Voltage (V)")


ax3.hist(R,bins=40,density=True)
ax3.plot(x_test_R,distribution,'r')
ax3.set_xlabel(r"$\Delta$ Voltage (V)")
ax3.set_ylabel('pdf')

plt.subplots_adjust(wspace=0.4)
plt.show()
```

```{important}
Note that we ourselves have been very sloppy with naming our variables in earlier editions of this Notebook, e.g. we had multiple variables called `xtest`. Hence, we had to go trough are notebook and check and change all duplicate names. Wasted time!
``` 

<!-- #region nbgrader={"grade": false, "grade_id": "cell-7019fff9dd353955", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(NB6_unc)=
### Uncertainty in the parameters


We found above that the best statistical fit to our data was not our initial estimate of `a = 2`, but actually more like `a = 2.0148`. But the line with `a = 2` also looked pretty good, right? How much better is the fit with `a = 2.0148`? 

To find this out, we can use the other variable that `curve_fit` returned: the [covariance matrix](https://en.wikipedia.org/wiki/Covariance_matrix). With two parameters, the covariance matrix is a 2x2 array:  
<!-- #endregion -->

```python
values, covariance = curve_fit(function_fit, t, v)
print(covariance)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-f0ffe772615a4907", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
The most important two for us are the diagonal elements: the first diagonal element tells us the square of the [standard error](https://en.wikipedia.org/wiki/Standard_error) $\sigma_a$ of parameter `a` and the second diagonal element gives us the square of $\sigma_b$.

```{important}
The uncertainty in our parameters can be obtained by taking the square root of the diagonal elements of our covariance matrix.
```

<!-- #endregion -->

```python
a_err = np.sqrt(covariance[0,0])
b_err = np.sqrt(covariance[1,1])
print(a_err)
print(b_err)
```

Or more quickly:

```python
a_rr, b_err = np.sqrt(np.diag(covariance))
print(a_rr,b_err)
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-5d97036c0a1d934d", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
(The standard error $\sigma_a$ is also sometimes also written as $\Delta a$,  and is also sometimes called the parameter "uncertainty" instead of the parameter "error"). 

We can now quote the full values of the parameters from our fit, including uncertainties:
<!-- #endregion -->

```python
print("The value of a is %.2f +/- %.2f V" % (a_fit, a_err))
print("The value of b is %.2f +/- %.2f V" % (b_fit, b_err))
```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-b4032ef7311840a6", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
Reminder: as earlier shown, we use a placeholder format `%.2f` designating that we want to print as float with two decimals. There are a 
[lot](https://www.python-course.eu/python3_formatted_output.php) of other ways to format your string.

Note that typically when you quote an uncertainty, you should pick only one significant digit. And also, when you quote the value of a parameter, you should also quote it with the same number of decimal places as your error. 

So in this case, we quote the value of `a` as 2.015, and not its "exact" value of 2.0148415283012246. Why? The reason is that it doesn't make sense to quote more digits on the value of `a` than a number of digits corresponding to the size of the statistical error, and so physicists and scientists truncate the accuracy of the numbers they report to a level comparable to the error. 
<!-- #endregion -->

```{exercise}
:label: NB5_ex_test
Below we have made a fake dataset for you. The parameters are known to you. But still, it is your task to 'deconstruct' the dataset and find the parameters as if these were unknown to you.
```

```python
x_meas = np.arange(0,10.1,0.3)
y_meas = 0.2345*x_meas**2 + 3.045*x_meas + np.random.normal(0,1.5,len(x_meas))

# Your code here                                   

```

<!-- #region nbgrader={"grade": false, "grade_id": "cell-d3c840f7897a22f3", "locked": true, "schema_version": 3, "solution": false, "task": false} -->
```{exercise}
:label: NB5_ex_find_p
Calculate the errors on the fit parameters from your fit in @NB5_ex_lsf . Was your estimate of $p$ within the statistical error margins from you fit? Were the values for $a$ and $p$ you found from "fitting by hand" within the statistical error margins? 
```
<!-- #endregion -->

```python
#code to calculate the parameter uncertainties (errors) and check if your earlier
#estimates agree with the least-square-fit values 
#to within the error margins of the fit

```

```{iframe} https://www.youtube.com/embed/fyUT-D-NU8I
```


```{exercise}
:label: NB5_ex_fit_yourself
In [dataset.csv](dataset.csv) we have made you a dataset where you have to find the formula describing it. Find the parameters and their associated uncertainties. Don't forget to analyse your residuals to see whether you found the proper formula.

Note! This excercise consumes a lot of your time...
```

```python

```
