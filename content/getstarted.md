(get_started)=
# Get started

> Here we describe how to install the software required. You can do it on your own, but we advise to do it during the first lecture. Moreover, do not worry when things are not yet fully clear - it will take some time to understand what is happening and why we think this is a good way to work.

(software)=
## Software

In this course you'll learn to work with Python using Jupyter Notebooks. In order to work with Python and Jupyter Notebooks, you'll need some software to open and run the files. Installing the software and all dependencies (packages) can be quite some work if done one-by-one. However, we'll work with a package manager called Pixi. Pixi helps to install the software and dependencies and allows for others to run your scripts if you provide the associate .toml file (no worries if you don't understand yet).  

We also encourage you to install [Visual Studio Code](https://code.visualstudio.com/), which is a popular code editor. It allows you to program in different languages, where it recognizes the commands in that language and adjusts the FONT so that it becomes better readable. Moreover, it allows you to install various packages (such as Jupyter Notebook). It also integrates GIT and allows to code using Co-Pilot, an AI pair programmer. 

### Jupyter Notebook and Jupyter Lab
In this course we make use of .ipynb files which are Jupyter Notebooks. To run these notebooks we can use integrated development environments (IDE's) as *Jupyter Notebook* or *Jupyter Lab*. Jupyter Notebook is a web-based interface that allows users to create and share documents with live code, visualizations, and narrative text in a linear format. JupyterLab, on the other hand, is a more advanced interface offering a flexible and modular environment with multiple panels, including notebooks, terminals, and text editors, providing a more versatile experience for interactive computing. I prefer to use Jupyter lab - and that is thus the one we will be working with in this course.

```{figure} Figures/jupyterlab.PNG
---
name: fig_jl
width: 100%
---
The Jupyter lab IDE
```

(installation_steps)=
## Installation steps
1. Go to [Pixi's website](https://pixi.prefix.dev/latest/installation/) and install pixi on your machine.
2. Download the [course files](https://github.com/Contemporary-Physicslab/FYPLC/archive/refs/heads/main.zip) and unzip it in a folder called `FYPLC` (preferably in `TN/1ejaar/IP/FYPLC`).

By now you have everything that you need. Pixi will take care of the installation of the software.

We did not yet install Python and packages. We will do so now.

5. Navigate to the `FYPLC` folder, right click on the folder and choose `Open in Terminal`. 
6. Type `pixi install` and hit enter.
  
We already created a `.toml` file in which we specified what needs to be installed. It will take a while for your computer to download and install all packages.

```{note}
On a windows computer, you can double click the `start.bat` file that we create. It will do the above automatically and instantly open jupyter lab.

For MacOS: run `chmod +x ./start_macos.command && xattr -d com.apple.quarantine ./start_macos.command` (only the first time) and double click then the `start_macos.command` file.
```

(run_course_files)=
## Run course files
Once everything is installed simply type `pixi run start` and hit enter. This will work because in the `.toml` file we created a task called `start` which runs jupyter lab. Hence, running `pixi run start` is equivalent to `pixi run jupyter lab`. 

```{tip}
Want to see the notebooks as a clear website (as probably seen here)? Run `pixi run myst start` and it will spin up a local server where the website is live hosted.

```

## Start new projects with pixi
For this course we created a pixi.toml file for you. We specified which software / libraries / packages should be installed. What if you have a new project where you need to use Python?

We derive the steps below from [pixi's own manual](https://pixi.prefix.dev/latest/getting_started/).

1. Navigate with the terminal to the folder of your project.
2. Run `pixi init` to create a new Pixi workspace.
3. Include the packages that are needed for that project by `pixi add <package name>`, e.g. `pixi add numpy`. [^pypi]
4. Start your task by running `pixi run <task>`, e.g. `pixi run jupyter lab`.

[^pypi]: Note that some packages are only available through pypi, these can be included using `pixi add --pypi <package name>`

An option is to create tasks in your `pixi.toml` file, e.g. the task `start` which then starts the IDE.


## Working with and in a terminal
The terminal is a 'tool' that lets you interact with your computer through the so called command line. It is used to run commands, scripts, or programs without leaving the coding environment. For example, you can compile code, run a development server, install dependencies, or manage files. It's very helpful for developers because it allows you to code and execute commands in one place, streamlining your workflow.

```{figure} Figures/VSCterminal.PNG
---
name: fig_VSCterminal
width: 80%
---
The VSC terminal to interact with the computer using the command line
```

````{admonition} Using the command line
:class: dropdown
Normally we navigate through our folders by using a graphic interface and clicking through the folders. However, there is another way to navigate through your folders, namely using the command line as we are doing with Anaconda prompt.

When you run the command `dir` it returns the folders and files in the folder you are currently in. You can go to another folder by running the command `cd NAMEFOLDER`. If you want to move to a higher folder, run the command `cd ..`

```{figure} Figures/terminaldir.PNG
---
name: fig_terminaldir
width: 100%
---
Moving through your folder with the command line
```

````

