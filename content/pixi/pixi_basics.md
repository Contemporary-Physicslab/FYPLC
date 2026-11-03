---
authors:
  - FP
---
  
# Pixi basics

Pixi manages project environments, dependencies, and command-line tasks. Project settings are stored in `pixi.toml`, so the environment can be recreated across machines.

## Initialize a project

Create a project in a new directory with `pixi init`:

```shell
pixi init my-project
cd my-project
```

or in the folder where you are already in:

```shell
pixi init
```

Pixi creates a `pixi.toml` configuration file. Run project commands with `pixi run` so they use the project's environment.

## Add dependencies

Use `pixi add` to add packages to the project:

```shell
pixi add python
pixi add numpy
```

Pixi records dependencies in the project configuration and updates its lockfile to keep the resolved environment reproducible. Project dependencies are available to commands run through Pixi.

## Define and run tasks

Tasks are named commands configured in `pixi.toml`. For example:

```toml
[tasks]
hello = "python -c 'print(\"Hello from Pixi!\")'"
```

Run the task from the project directory:

```shell
pixi run hello
```

Tasks are useful for repeatable commands such as tests, formatting, or starting an application. For this project we created already:

`pixi run editor` which launches Jupyter Lab
`pixi run preview` which runs a Jupyter Book server and shows your project using a local host.
`pixi run pdf` which makes a pdf version of your project.


## Install tools globally

Use `pixi global install` for a command-line tool you want to use across projects, rather than as a dependency of one project:

```shell
pixi global install python==3.14
```

This will ensure that python is installed on your machine and can be reached throughout. We recommend to install globally:
`pixi global install python==3.14 mystmd numpy matplotlib scipy jupytext jupyterlab`

Note that we want to use `jupyterlab_myst` but this is a pypi packages. Pypi packages cannot be installed globally.

If we want to see what is installeed globally, run `pixi global list`. If we want to remove a package, run `pixi global remove <package>`. Use `pixi add` for project dependencies and global installs for standalone tools.

```{warning}
Regularly check for updates! Especially since AI is able to find more and more security issues
```