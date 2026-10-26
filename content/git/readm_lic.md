# Setting up a Git repository

> Here we briefly address to important components of every git repository: the gitignore file and the README file. 

## Making a new repo 
Go to https://github.com/new. This will lead to a page where you can create a new repository.

Choose a descriptive Repository name. Choose it wisely as your repositories will be shared with teachers (or future colleagues). In some cases, like this online book, the repository name will be part of the URL.

Choose visibility to private, Add Readme (on) and click on the green button with Create repository.

Now you have a repository where you can share and synchronize materials.

Click on Settings (in the top right corner of your screen) and click on Collaborators in the left-hand menu.

Click the Add people button under the Manage access heading.

Type your partner’s (or partners’) username and click on Add <username> to this repository (where <username> is your partner’s username).

See [here](#ch_start_exercise) how to get your repo locally.

## README
A readme file (README.md in the root folder) is an important source of information in your project. It contains an explanation of the content of your project, who worked on the project, how to contact anybody working on the project, how to cite the project in further scientific research and any further information that you find to be relevant. 

A good readme file includes at least the information below, but you can always add information as you wish.
* **Project name**: The title of the project.

* **Authors / Owners**: The people that have executed the project. 

* **Table of content**: A short description of what the project is about, followed by the structure or table of content of the project. This explains the structure of your project to the reader and simplifies navigating the project. 

* **How to do it yourselves**: A description of how the reader could execute the project themselves, if they want to use it. This can be split into *how to install any prerequisites* and *how to use* the project. 

* **Citing**: How to properly cite the project if people want to refer to it in further scientific work. There are a few possible formats for citations, but including a [bibtex](https://www.bibtex.org/) enables people to choose their own preferred citation style. 

* **Contact**: Information about how to contact the authors for any questions and any issues that have arisen. 

* **Contributors**: The remaining people that worked on the project, possibly with their contributions detailed. 

* **Licenses**: Information about the [specific copyright license](https://en.wikipedia.org/wiki/Permissive_software_license) under which the project is published. This lets the reader know how to use and properly reference any figures, code or text from your project. In your educational projects you can state: 

_Copyright © 2026 [name]. All rights reserved. This source code is provided for educational/review purposes only. Reuse, modification, or redistribution is not permitted without prior permission._

The goal of a readme file is to answer any and all questions that a user might have while looking at your project or while using your project. Sections that can be added when relevant could be *an explanation of the data*, *examples*, *keywords*, *most relevant conclusions*, etc. An example of a readme file including a lot of information can be found [here](https://github.com/FreekPols/Mechanica/blob/main/README.md). 


## Gitignore
A .gitignore file contains all files or directories that Git ignores while tracking, committing, pushing or pulling files to your repository. There could be several reasons that you would want to include files in a gitignore file, below some examples: 

* Temporary or auto-generated files that are created and deleted while running your code can clutter your history. 
* Any sensitive information that you would only want on your local computer and not in a public repository. 
* Directories containing a large number of data files that do not need to be committed with every version of the project and increase the time to push and pull significantly, for instance, pixi installs the dependencies (software) in the root folder. These files ought not to be included in a git repo!


Your .gitignore file can include both folders, specific files, or files ending with a specific extension, like `*.pdf`. 

Below an example for ignoring a folder "data", a specific file "project.py" and all files ending in ".ipynb"

```txt .gitignore
# Ignore the entire "data" and "_build" folder (and all its contents)
data/
_build

# Ignore the specific file "project.py"
project.py

# pixi environments
.pixi/*
!.pixi/config.toml


# Ignore all Jupyter Notebook files and pdf
*.ipynb
*.pdf

# Ignore secrets 
.env
```

````{note} A note when working with jupyter notebooks (.ipynb)
:class: dropdown
Jupyter notebooks are .ipynb files, which are written in raw JSON, including metadata and outputs. This means that every time your notebook is run, the JSON file changes to include the new metadata and outputs. 

The jupyter notebook: 
```python
print("Hello World")
```

The JSON file after execution:
```json
{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {
    "execution": {
     "iopub.status.busy": "2026-10-07T09:30:00.000000Z"
    }
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Hello World\n"
     ]
    }
   ],
   "source": [
    "print(\"Hello World\")"
   ]
  }
 ],
 "metadata": {
  "language_info": {
   "name": "python"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
```

Git reads these JSON files as long text files and not as code. This can cause very difficult merge conflicts in the JSON files, compared to relatively simple merge conflicts in a python file. For example: two people clone this notebook above. They each make minor changes to the code, one adding `print("Hello Alice")` and the other adding `print("Hello Bob")`. Below are the merge conflicts that would arise in a JSON file and a python file. 

The JSON file merge conflict:
```json
<<<<<< HEAD
  "execution_count": 1,
  "outputs": [
    {
      "name": "stdout",
      "output_type": "stream",
      "text": [ "Hello Alice\n" ]
    }
  ],
  "source": [ "print(\"Hello Alice\")" ]
=======
  "execution_count": 3,
  "outputs": [
    {
      "name": "stdout",
      "output_type": "stream",
      "text": [ "Hello Bob\n" ]
    }
  ],
  "source": [ "print(\"Hello Bob\")" ]
>>>>>> feature-branch
```
The merge conflict that would arise in a python file: 
```python
<<<<<< HEAD
print("Hello Alice")
=======
print("Hello Bob")
>>>>>> feature-branch
```

For this reason, it is not ideal to use jupyter notebook files in Git. If you still want to use jupyter notebooks, you can convert them to markdown (.md) files using [Jupytext](https://jupytext.org/). 

````
