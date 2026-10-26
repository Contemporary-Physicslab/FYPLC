(ch_start_exercise)=
# Start exercise

> Here we present an exercise to get you acquainted with git - without knowing in detail what it is. Two people will work together in the same repository, namely the _owner_ and the _collaborator_. The owner starts, the collaborator may help.


(sec_instruction_owner)=
## Instruction for repo owner

1. Go to [https://github.com/new](https://github.com/new). This will lead to a page where you can create a new repository.
1. Choose a descriptive **Repository name**. Choose it wisely as your repositories will be shared with teachers (or future colleagues). In some cases, like this online book, the repository name will be part of the URL.
1. Choose visibility to **private**, **Add Readme (on)** and click on the green button with **Create repository**.

Now you have a repository where you can share and synchronize materials.

1. Click on **Settings** (in the top right corner of your screen) and click on **Collaborators** in the left-hand menu.
1. Click the **Add people** button under the **Manage access** heading.
1. Type your partner's (or partners') username and click on **Add `<username>` to this repository** (where `<username>` is your partner's username).

(sec_partner_accepts)=
## Partner accepts invitation
Your partner will receive an email with an invitation to collaborate on the repository. Once accepted, both of you can make changes to the repository, though for now only through the GitHub website...

(sec_going_local)=
## Going local
These steps will make your work locally available. 

Open a terminal and navigate to the root project folder - see [Using the terminal](#sec_terminal) for instructions when needed.

Using the terminal, run 
```
git clone <repo>
``` 
where `<repo>` is the url of your repository. You can find this URL by clicking the big green button `<> Code`, and copying the HTTPS URL.

Open Visual Studio Code and open (`File/Open Folder`) the folder where your repo was cloned into. The only file that will be in it will be the `README.md` file.


(sec_exercise)=
## Exercise
You and your partner can now take turns in writing a poem.

Copy the start of the poem below and replace the text in the README.md file (paste). 

```
## For the love of physics

When I think about physics  ...
```

As you can see, the first line is given - the _owner_ writes the second line, _commits_ and _pushes_ the next line to git. The _collaborator_ pulls the repo, writes the third line, and commits and pushes to git, and so on. Make a poem of about 10 lines. See below on pulling and pushing changes. Where we only tell you what to do, not what it means.



## Pulling & Pushing changes
When you have made a local change, your partner won't see it and will not be able to use it. You'll have to push your work to the central server (GitHub). In VSC, go to source control using the icon: ![VSC git icon](figures/gitbranch_icon.svg). You will see something like @fig_init_commit. Follow these steps:

### Pushing
1. Type a Message in the inputbox just above the blue **✓ Commit** button.
2. Click for the dropdown menu and choose **Commit & Push**.
3. This will push your changes to the central server.

```{figure} figures/init_commit.png
:label: fig_init_commit
:width: 85%
:alt: a picture showing the dropdown menu to make a commit using VSC
:resource: self made picture
:license: cc-by0

A screenshot where to find the source control.
```

Your work will be now be available for your partner. But in order to work on it, it has to be _pulled_ in locally. 

### Pull
1. Open Visual Studio Code, and make sure you have opened the folder of the local repo.
2. Go to source control using the icon: ![VSC git icon](figures/gitbranch_icon.svg).
3. Next to change, click the three dots ... and choose **Pull**, see @fig_init_pull

```{figure} figures/init_pull.png
:label: fig_init_pull
:width: 85%
:alt: a picture showing the dropdown menu to pull from github using VSC
:resource: self made picture
:license: cc-by0

A screenshot where to find the source control and pull from GitHub.
```



(sec_terminal)=
## Using the terminal
You are probably used to working with a graphical interface (and your mouse): you click the location you want to go to. In the terminal, you work with commands. You navigate through the terminal using `cd <folder>` (where `<folder>` is the folder you want to go to).

Some basic commands:
- Use `cd ..` to go up one folder.
- Use `ls` or `dir` to see the contents of the folder you are in.
- To switch to another drive, type the drive letter followed by a colon (for example, `D:`).
- Use `mkdir <folder>` to create a new folder (where `<folder>` is the name of the new folder).
- Use `rmdir <folder>` to remove an empty folder (where `<folder>` is the name of the folder you want to remove).
- Use `rm <file>` to remove a file (where `<file>` is the name of the file you want to remove).
- Use `code .` to open the current folder in VS Code.

```{warning}
Using spaces in folder names is allowed on Linux and macOS, but when you refer to those folders in the terminal, spaces must be preceded by an escape character (for example, a backslash: `cd Documents/My\ Folder`).
```