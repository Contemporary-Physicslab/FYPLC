# Pixi basics

Pixi manages project environments, dependencies, and command-line tasks. Project
settings are stored in `pixi.toml`, so the environment can be recreated across
machines.

## Initialize a project

Create a project in a new directory with `pixi init`:

```shell
pixi init my-project
cd my-project
```

Pixi creates a `pixi.toml` configuration file. Run project commands with
`pixi run` so they use the project's environment.

## Add dependencies

Use `pixi add` to add packages to the project:

```shell
pixi add python
pixi add numpy
```

Pixi records dependencies in the project configuration and updates its lockfile
to keep the resolved environment reproducible. Project dependencies are
available to commands run through Pixi.

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

Tasks are useful for repeatable commands such as tests, formatting, or starting
an application.

## Install tools globally

Use `pixi global install` for a command-line tool you want to use across
projects, rather than as a dependency of one project:

```shell
pixi global install ruff
```

List globally installed tools with `pixi global list`, or remove one with
`pixi global remove ruff`. Use `pixi add` for project dependencies and global
installs for standalone tools.

