(ch_introduction)=
# Introduction

> In this chapter we will explain the merits of using get and install the software to make use of it.

(sec_intro_to_git)=
## Intro to git

(sub_sec_why_git)=
### Why git

**Case 1:**

Imagine working on your bachelor thesis. You have reached the point of handing it in: `final_draft.pdf`. Now your supervisor reviews and returns `final_draft_cFP.pdf`. You go back to work and hand in a second draft version `final_draft_vs2.pdf` and sure there are new comments `final_draft_vs2_cFP.pdf`. After processing the comments you submit `final.pdf` after some sending forth and back you and up with `real_final_vs4.pdf`. And we forgot to mention that somewhere along that timeline you worked in an older version where you thus had to readjust some change made in a different version...

**Case 2:**

During your master's project you work on a piece of software, made by someone else, clearly not well documented. After some bug fixing the basic features work and you start implementing your own features. At some point, something breaks and you can't figure out what or why: _what were the changes made that resulted in hitting a severe error?_ Worse, you can't go back to a version where it did work...

In both cases it would have been useful to have worked in a systematic way where there would be automatic versioning. This would mean that you wouldn't need to rename the document, didn't work in an older version than `latest`, and you would be able to review all changes made and even go back to an earlier version of your code that _did_ work.

Where software applications as onedrive, google drive and google docs are trying to best to ease the processes described above, there is no guaranteed way that this actually does work, there is hardly control over which version is stored when and where, and no easy way to go back and forth in time (that is earlier versions of the same document), and these applications do not fit well with programming (especially not in a team setting). Welcome to git...

(sub_sec_what_is_git)=
### What is Git 

Git is a version control system that helps you track changes in your files and collaborate with others. It allows you to save different versions of your work, go back to previous versions if needed, and merge changes from multiple people. Git is commonly used for managing source code in software projects, but it can be used for any type of file. 

Git is useful beyond software development. In a research project, for example, you can use it to keep track of your analysis code and document how your results were produced. This makes your workflow more transparent and reproducible.

Git provides thus a way to synchronize files between a server and local stored files. Other servers can host the webpage (the Jupyter Book) by requesting the files and using a so-called build script.

Both GitHub and GitLab provide an online integrated development environment - a place where you can edit your files. Below is a description of both GitHub and GitLab - TU Delft and subsequently an oversight of the (dis)advantages of each these systems. Know that we are able to connect these two (synchronize between them).

(sub_sec_github)=
### GitHub
GitHub is a web-based platform for hosting and collaborating on Git repositories. Owned by Microsoft, GitHub offers tools for code review, issue tracking, and project management, making it popular for open-source and private projects alike. One valuable feature is GitHub Pages, which allows you to publish static websites directly from a repository, making it easy to share documentation, portfolios, or project pages.

(sub_sec_gitlab)=
### Gitlab 
TU Delft hosts a local server with GitLab software, which is an implementation of git with a lot of useful extensions. Anyone with a TU Delft netid can get a GitLab account, simply by logging in on https://gitlab.tudelft.nl. You can then be added to projects or start your own project.[^TI]

[^TI]: Text from [](https://doi.org/10.59490/tb.73)

(sub_sec_comparing_git)=
### Comparing the two versions of git

GitHub and GitLab have both advantages and disadvantages. GitLab is advised by TUD unless many external users are involved. However, as GitLab disable pages a Jupyter Book should be build locally.

| | pros | cons |
|---|---|---| 
|Github | GitHub pages enables to see content in website | Is property of MicroSoft
| | Allows users out side TUD to easily engage| No backup at TUD |
| | Github actions | Not standard reachable by TUD (i.c.o. conflicts, e.g. copyrights)|
| | Massive storage | |
| Gitlab | Is hosted by TUD | Is terminated when one leaves TUD |
| | Accessible by colleagues | Harder for outside collaborators |
| | CI/CD | Pages disabled |
| | Storage limited by TUD | Various faculties have their own GL and policies |
| | TUD Backups |  Is more often down compared to GitHub|

```{important}
We will use GitHub for our educational purposes as GitLab-TU Delft is severely limited for students. However, your work in a research group will probably be shared using GitLab. The main functionalities and codes will be the same.
```

(sec_zero)=
## From zero to hero

We expect **no prior knowledge of Git** at the start of this project. Git can feel a little overwhelming at first—it certainly did for us, but you will learn by using it.

As you become more comfortable with Git, you will probably discover useful features that you did not even know existed. Most of those are not covered here: this introduction focuses on the basics you need to get started.

You do not need to understand everything at once. Start with the basic workflow, use it regularly, and build from there.

(sec_first_steps)=
## First steps

**Create account GitHub**
If you haven't an account yet, go to [https://github.com/](https://github.com/) and create a free account (sign up).

**Install git**
If you haven't installed git yet (not sure? run 

```
git --version
``` 
in your terminal to check whether git is installed), install [git](https://git-scm.com/install). 

Now we have an account on GitHub and software to make use of git, we need to 'connect' these. Open a terminal and run:

``` 
git config --global user.name "<username>"
```

where `<username>` is the name you use in your GitHub account. Next, run:
```
git config --global user.email "<email address>"
```

where `<email address>` is the email address you use for your GitHub account.

You can check your configuration by running:
```
git config --list
```

```{note}
When you use Git through this account for the first time, you will be asked to complete a verification step.
```
**Install VSC & extensions**
Visual Studio Code (VSC) includes built-in Git functionality. With VSC, you can stage, commit, and push changes directly from the editor, view diffs, and manage branches without leaving your coding environment. This integration streamlines your workflow and reduces the need to switch between multiple tools. As VSC is also used to work with editing markdown files, writing other (programming) languages like LaTeX or C++, we want to install this. 

Install [VSC](https://code.visualstudio.com/Download). 

Once installed, start VSC. There are some extensions that are very useful:
- Code Spell Checker 
- Dutch - Code Spell Checker
- GitHub Actions
- MyST-Markdown
- GitHub Pull Requests

Install these through the extension market place (ctrl + shift + X). Later on you will find other useful extensions, depending on the type of programming / work you'll do.

We are ready to explore the use of git by an exercise.

```{tip} **Git Desktop**
Alternatively to VSC, GitHub Desktop is a graphical application that simplifies working with Git repositories, making it easier to synchronize your files with platforms like GitHub or GitLab. Instead of using command-line instructions, you can perform common tasks—such as committing changes, pushing to remote repositories, and resolving merge conflicts—through an intuitive interface. This is especially helpful for beginners or those who prefer a visual workflow. We won't go into detail of using Git Desktop, but it might be worth exploring.
```

