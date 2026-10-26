---
authors: Freek Pols
---

# Pixi intro

## Why use a package manager?

Computational physics depends on software beyond the code we write: numerical libraries, plotting tools, and sometimes compilers. Installing these by hand can lead to incompatible versions or missing dependencies, and code that works on one computer may fail on another.

A package manager installs and organizes a project's dependencies, often in an isolated environment. This lets different projects use different software versions without interfering with each other. By recording dependencies with the project, collaborators can also recreate a similar setup more easily. In our case, you run the same software and packages as your teacher. That gives us the opportunity to ease the way of installing and guarantees that you run the correct software.

As you can infer from the above, package management is important for reproducibility. A package manager cannot guarantee that a simulation or analysis is correct, but it helps ensure that differences in the software environment are less likely to affect the results. 

### Environments



## Pixi

There are various package managers. Our choice is **pixi**. Pixi stores a project's dependencies and settings in a `pixi.toml` file and can capture exact package versions in a lockfile. This helps collaborators recreate a consistent environment. Pixi installs packages from conda channels such as conda-forge and can also use Python packages from PyPI.

### Why use Pixi?

Pixi creates isolated environments for projects, so their dependencies do not interfere with one another or with software installed globally. You describe the tools and packages a project needs, and Pixi handles creating and updating the environment. This makes setup easier to repeat across computers and operating systems.

Pixi also supports **tasks**: named commands configured for a project. Tasks can cover routine actions such as running a program, executing tests, or building the project. For example, a configured task called `test` can be run with `pixi run test`. Tasks make common workflows easy to find and run consistently.

### Environments beyond Python

Pixi is not limited to Python. An environment can include tools and libraries from other ecosystems, including C and C++ compilers, command-line utilities, and compiled libraries. You can combine these with Python packages in the same project environment when needed—a useful feature in computational physics, where Python code often works alongside compiled software.


